import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/data/job_offer_model.dart';
import 'package:JobSearch/model/data/offer_merged_model.dart';
import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final offerListenerStreamNotifierProvider = StreamNotifierProvider.autoDispose
    .family<OfferListenerStreamNotifier, List<OfferMergedModel>, String>(
        OfferListenerStreamNotifier.new);

class OfferListenerStreamNotifier
    extends AutoDisposeFamilyStreamNotifier<List<OfferMergedModel>, String> {
  // arg is for listening type : "INCOMING" or "OUTGOING"
  @override
  Stream<List<OfferMergedModel>> build(String arg) async* {
    final listOfOfferMergeModel = <OfferMergedModel>[];
    final firestore = ref.read(firestoreProvider);
    final selfUserId = ref.read(userProvider)!.uid;
    final offerCollectionRef = firestore.collection('offers');
    final jobCollectionRef = firestore.collection('jobPosts');
    final usersCollectionRef = firestore.collection('users');
    if (arg == "OUTGOING") {
      final offerStream = offerCollectionRef
          .where('senderUid', isEqualTo: selfUserId)
          .snapshots();

      await for (final offerQuery in offerStream) {
        if (offerQuery.docs.length == 0) {
          yield [];
          break;
        }
        final offerList = offerQuery.docs
            .map((e) => JobOfferModel.fromJson(e.data()))
            .toList();
        final jobsQuery = await Future.wait(
            offerList.map((e) => jobCollectionRef.doc(e.jobId).get()));
        final jobsList =
            jobsQuery.map((e) => JobModel.fromJson(e.data()!)).toList();

        final usersQuery = await Future.wait(
            offerList.map((e) => usersCollectionRef.doc(e.recipientUid).get()));
        final usersList =
            usersQuery.map((e) => UserModel.fromJson(e.data()!)).toList();

        for (var i = 0; i < offerList.length; i++) {
          listOfOfferMergeModel.add(OfferMergedModel(
            invitedJobModel: jobsList[i],
            applicantModel: usersList[i],
            jobOfferModel: offerList[i],
          ));
        }
      }
    } else if (arg == "INCOMING") {
      final offerStream = offerCollectionRef
          .where('recipientUid', isEqualTo: selfUserId)
          .snapshots();
      await for (final offerQuery in offerStream) {
        final offerList = offerQuery.docs
            .map((e) => JobOfferModel.fromJson(e.data()))
            .toList();
        yield offerList;
      }
    } else {
      throw Exception("Invalid argument for OfferListenerStreamNotifier");
    }
  }
}
