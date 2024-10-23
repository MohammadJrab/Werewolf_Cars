import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';

@injectable
class ResetPasswordCheckUsecase
    extends UseCase<Result<bool>, ResetPasswordCheckParams> {
  ResetPasswordCheckUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<bool>> call(ResetPasswordCheckParams params) {
    return _datasource.resetPasswordGenerate(params.email);
  }
}

class ResetPasswordCheckParams {
  const ResetPasswordCheckParams({
    required this.email,
  });

  final String email;
}
