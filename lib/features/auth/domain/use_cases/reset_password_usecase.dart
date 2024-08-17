import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';

@injectable
class ResetPasswordUsecase
    extends UseCase<Result<ResponseWrapper<bool>>, ResetPasswordParams> {
  ResetPasswordUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<ResponseWrapper<bool>>> call(ResetPasswordParams params) {
    return _datasource.resetPassword(params.data);
  }
}

class ResetPasswordParams {
  const ResetPasswordParams({
    required this.email,
  });

  final String email;

  Map<String, dynamic> get data => {
        'email': email,
      };
}
