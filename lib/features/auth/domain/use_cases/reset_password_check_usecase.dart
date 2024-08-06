import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';
import 'package:werewolf_cars/features/auth/data/models/authorization_response.dart';

@injectable
class ResetPasswordCheckUsecase extends UseCase<
    Result<ResponseWrapper<AuthorizationResponse>>, ResetPasswordCheckParams> {
  ResetPasswordCheckUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<ResponseWrapper<AuthorizationResponse>>> call(
      ResetPasswordCheckParams params) {
    return _datasource.resetPasswordCheck(params.data);
  }
}

class ResetPasswordCheckParams {
  const ResetPasswordCheckParams({
    required this.phone,
    required this.token,
  });

  final String phone;

  final String token;

  Map<String, dynamic> get data => {
        'phone': phone,
        'token': token,
      };
}
