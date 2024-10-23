import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';

@injectable
class ResetPasswordGenerateUsecase
    extends UseCase<Result<bool>, ResetPasswordGenerateParams> {
  ResetPasswordGenerateUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<bool>> call(ResetPasswordGenerateParams params) {
    return _datasource.resetPasswordGenerate(params.email);
  }
}

class ResetPasswordGenerateParams {
  const ResetPasswordGenerateParams({
    required this.email,
  });

  final String email;
}
