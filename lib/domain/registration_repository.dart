import 'package:firebase_auth/firebase_auth.dart';
import 'package:shobdo_kutir/data/local/pref_helper.dart';

class RegistrationRepository {
  static final _repository = RegistrationRepository._();
  final _firebaseAuth = FirebaseAuth.instance;

  RegistrationRepository._();

  factory RegistrationRepository.init() {
    return _repository;
  }

  Future<String?> loginUser(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      PrefHelper.setIsLoggedIn(true);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> registerUser(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      PrefHelper.setIsLoggedIn(true);
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
