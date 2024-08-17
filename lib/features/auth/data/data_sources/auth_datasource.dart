import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/core/api/client.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/features/app/domin/repositories/prefs_repository.dart';
import 'package:werewolf_cars/features/auth/data/models/authorization_response.dart';
import 'package:werewolf_cars/features/auth/data/models/customer_info.dart';

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

  Future<Result<ResponseWrapper<CustomerInfoResponse>>> register(
      Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.register,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: data,
        ),
      );

      return ResponseWrapper<CustomerInfoResponse>.fromJson(
        response.data,
        (json) {
          final customer = CustomerInfoResponse.fromJson(json);
          return customer;
        },
      );
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<ResponseWrapper<CustomerInfoResponse>>> login(
      Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.login,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: data,
        ),
      );

      return ResponseWrapper<CustomerInfoResponse>.fromJson(
        response.data,
        (json) {
          final customer = CustomerInfoResponse.fromJson(json);
          return customer;
        },
      );
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<ResponseWrapper<bool>>> resetPasswordGenerate(
      Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.resetPasswordGenerate,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: data,
        ),
      );
      return const ResponseWrapper<bool>(data: true);
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<ResponseWrapper<AuthorizationResponse>>> resetPasswordCheck(
      Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.resetPasswordCheck,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: data,
        ),
      );
      return ResponseWrapper<AuthorizationResponse>.fromJson(
        response.data,
        (json) {
          final authorization = AuthorizationResponse.fromJson(json);
          return authorization;
        },
      );
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

  Future<Result<ResponseWrapper<bool>>> verification(
      Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.verify,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: data,
        ),
      );

      return ResponseWrapper<bool>.fromJson(response.data, (json) => true);
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<ResponseWrapper<bool>>> resendCode(
      Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.resend,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: data,
        ),
      );

      return ResponseWrapper<bool>.fromJson(response.data, (json) => true);
    }

    return toApiResult(() => throwAppException(fun));
  }

  Future<Result<ResponseWrapper<bool>>> logout() async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.auth.logout,
          clientMethod: ClientMethod.delete,
          responseType: ResponseType.json,
        ),
      );

      return const ResponseWrapper<bool>(data: true);
    }

    return toApiResult(() => throwAppException(fun));
  }
}
