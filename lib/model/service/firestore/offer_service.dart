import 'dart:async';

import 'package:JobSearch/model/data/job_offer_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final offerServiceNotifierProvider = AsyncNotifierProvider.autoDispose<OfferServiceNotifier, String?>(OfferServiceNotifier.new);

class OfferServiceNotifier extends AutoDisposeAsyncNotifier<String?> {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> sendJobOffer(
      {required String recipientUserId, required String jobPostId}) async {
    state = const AsyncLoading();
    final firestore = ref.read(firestoreProvider);
    final selfUserId = ref.read(userProvider)!.uid;
    final offerCollectionRef = firestore.collection('offers');
    final offerDocumentRef = offerCollectionRef.doc();
    final offerId = offerDocumentRef.id;
    final offerModel = JobOfferModel(
        jobOfferId: offerId,
        senderUid: selfUserId,
        recipientUid: recipientUserId,
        jobId: jobPostId,
        timestampField: FieldValue.serverTimestamp(),
        status: null);
    await offerDocumentRef.set(offerModel.toJson());
    state = const AsyncData("JOB_OFFER_SENT");
  }

  Future<void> acceptOffer({required JobOfferModel jobOfferModel}) async {
    final firestore = ref.read(firestoreProvider);
    final offerCollectionRef = firestore.collection('offers');
    final updatedJobOfferModel = jobOfferModel.copyWith(status: true);
    await offerCollectionRef
        .doc(jobOfferModel.jobOfferId)
        .update(updatedJobOfferModel.toJson());
    state = const AsyncData("JOB_OFFER_ACCEPTED");
  }

  Future<void> rejectOffer({required JobOfferModel jobOfferModel}) async {
    final firestore = ref.read(firestoreProvider);
    final offerCollectionRef = firestore.collection('offers');
    final updatedJobOfferModel = jobOfferModel.copyWith(status: false);
    await offerCollectionRef
        .doc(jobOfferModel.jobOfferId)
        .update(updatedJobOfferModel.toJson());
    state = const AsyncData("JOB_OFFER_REJECTED");
  }
}
