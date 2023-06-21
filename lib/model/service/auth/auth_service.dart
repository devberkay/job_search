import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/auth_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:JobSearch/model/provider/storage/storage_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final authServiceProvider = Provider.autoDispose<AuthService>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firebaseStorage = ref.watch(storageProvider);
  final firestore = ref.watch(firestoreProvider);
  return AuthService(firebaseAuth, firestore, firebaseStorage);
});

class AuthService {
  final FirebaseAuth _firebaseAuthInstance;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  AuthService(this._firebaseAuthInstance, this._firebaseFirestore,
      this._firebaseStorage);

  Future<void> signInWithGoogle() async {
    
    final googleUser =
        await _firebaseAuthInstance.signInWithPopup(GoogleAuthProvider());
    final newUserModel = UserModel(
        isSeekingJob: false,
        uid: googleUser.user!.uid,
        mail: googleUser.user!.email,
        name: googleUser.user!.displayName,
        phone: googleUser.user!.phoneNumber);
    final picDownloadUrl = googleUser.user!.photoURL;
    final rawPicTure = await http.get(Uri.parse(picDownloadUrl!));
    await Future.wait([
      _firebaseFirestore
          .collection("users")
          .doc(googleUser.user!.uid)
          .set(newUserModel.toJson()),
      _firebaseStorage
          .ref("users/${googleUser.user!.uid}")
          .putData(rawPicTure.bodyBytes)
    ]);
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuthInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
