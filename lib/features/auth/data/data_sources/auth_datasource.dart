import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/features/app/domin/repositories/prefs_repository.dart';
import 'package:werewolf_cars/features/auth/domain/use_cases/register_usecase.dart';
import '../../../../core/api/api_utils.dart';

@injectable
class AuthDatasource {
  AuthDatasource(this._prefsRepository);

  final PrefsRepository _prefsRepository;

  Future<Result<User>> register(RegisterParams params) async {
    Future<User> fun() async {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: params.email, password: params.password);

      final user = userCredential.user!;

      await user.updateProfile(displayName: params.fullName);

      await user.sendEmailVerification();

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'full_name': params.fullName,
        'email': params.email,
        'phone_number': params.phoneNumber,
      });

      return user;
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<User>> login(
      {required String email, required String password}) async {
    fun() async {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<bool>> resetPassword(String email) async {
    Future<bool> fun() async {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      }
      return querySnapshot.docs.isNotEmpty;
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<bool>> verification() async {
    Future<bool> fun() async {
      final user = FirebaseAuth.instance.currentUser;

      await user?.sendEmailVerification();

      return true;
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<bool>> logout() async {
    fun() async {
      await FirebaseAuth.instance.signOut();

      return true;
    }

    return toApiResult(() => throwAppException(fun));
  }
}
