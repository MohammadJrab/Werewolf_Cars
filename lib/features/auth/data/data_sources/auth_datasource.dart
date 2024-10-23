import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/core/api/client.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/features/app/domin/repositories/prefs_repository.dart';
import 'package:werewolf_cars/features/auth/domain/use_cases/register_usecase.dart';
import '../../../../common/constants/route.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client_config.dart';

@injectable
class AuthDatasource {
  AuthDatasource(this._prefsRepository, {required ClientApi clientApi})
      : _clientApi = clientApi;

  final ClientApi _clientApi;
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

  Future<Result<bool>> resetPasswordGenerate(String email) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.resetPasswordGenerate,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: email,
        ),
      );
      return true;
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<ResponseWrapper<bool>>> resetPassword(
      Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.resetPasswordReset,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: data,
        ),
      );
      return const ResponseWrapper<bool>(data: true);
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

  Future<Result<ResponseWrapper<bool>>> resendCode(
      Map<String, dynamic> date) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.resend,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: date,
        ),
      );

      return ResponseWrapper<bool>.fromJson(response.data, (json) => true);
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
