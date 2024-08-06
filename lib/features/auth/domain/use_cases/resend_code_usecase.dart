import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';

@injectable
class ResendCodeUsecase
    extends UseCase<Result<ResponseWrapper<bool>>, ResendCodeParams> {
  ResendCodeUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<ResponseWrapper<bool>>> call(ResendCodeParams params) {
    return _datasource.resendCode(params.data);
  }
}

class ResendCodeParams {
  const ResendCodeParams({required this.phone});

  final String phone;

  Map<String, dynamic> get data => {'phone': phone};
}
