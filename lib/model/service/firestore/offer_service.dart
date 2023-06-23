import 'dart:async';

import 'package:JobSearch/model/data/job_offer_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfferServiceNotifier extends AsyncNotifier<String?> {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> sendJobOffer(
      {required String recipientUserId, required String jobPostId}) {
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
    return offerDocumentRef.set(offerModel.toJson());
  }
}
