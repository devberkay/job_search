import 'package:JobSearch/model/data/job_offer_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final offerListenerStreamNotifierProvider = StreamNotifierProvider.autoDispose.family<OfferListenerStreamNotifier,List<JobOfferModel>,String>(OfferListenerStreamNotifier.new);

class OfferListenerStreamNotifier
    extends AutoDisposeFamilyStreamNotifier<List<JobOfferModel>, String> {
  // arg is for listening type : "INCOMING" or "OUTGOING"
  @override
  Stream<List<JobOfferModel>> build(String arg) async* {
    final firestore = ref.read(firestoreProvider);
    final selfUserId = ref.read(userProvider)!.uid;
    final offerCollectionRef = firestore.collection('offers');
    final 
    if (arg == "OUTGOING") {
      final offerStream = offerCollectionRef
          .where('senderUid', isEqualTo: selfUserId)
          .snapshots();
      await for (final offerQuery in offerStream) {
        final offerList = offerQuery.docs
            .map((e) => JobOfferModel.fromJson(e.data()))
            .toList();
        
        yield offerList;
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
