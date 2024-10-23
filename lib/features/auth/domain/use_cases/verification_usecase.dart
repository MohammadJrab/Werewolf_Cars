import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';

@injectable
class VerificationUsecase extends UseCaseNoParam<Result<bool>> {
  VerificationUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<bool>> call() {
    return _datasource.verification();
  }
}
