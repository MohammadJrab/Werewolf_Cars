import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';
import 'package:werewolf_cars/features/auth/data/models/authorization_response.dart';

@injectable
class ResetPasswordUsecase
    extends UseCase<Result<ResponseWrapper<bool>>, ResetPasswordParams> {
  ResetPasswordUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<ResponseWrapper<bool>>> call(ResetPasswordParams params) {
    return _datasource.resetPassword(
        params.data, params.authorizationResponseData);
  }
}

class ResetPasswordParams {
  const ResetPasswordParams({
    required this.password,
    required this.passwordConfirmation,
    required this.authorizationResponse,
  });

  final String password;
  final String passwordConfirmation;
  final AuthorizationResponse authorizationResponse;

  Map<String, dynamic> get data => {
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
  Map<String, dynamic> get authorizationResponseData => {
        "customer_id": authorizationResponse.customerId.toString(),
        "expires": authorizationResponse.expires,
        "signature": authorizationResponse.signature
      };
}
