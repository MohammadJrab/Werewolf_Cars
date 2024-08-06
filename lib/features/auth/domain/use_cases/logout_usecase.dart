import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/config/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';

@injectable
class LogoutUsecase extends UseCaseNoParam<Result<ResponseWrapper<bool>>> {
  LogoutUsecase({required AuthDatasource source}) : _datasource = source;

  final AuthDatasource _datasource;

  @override
  Future<Result<ResponseWrapper<bool>>> call() => _datasource.logout();
}
