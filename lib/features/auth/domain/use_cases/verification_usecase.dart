import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';

@injectable
class VerificationUsecase
    extends UseCase<Result<ResponseWrapper<bool>>, VerificationParams> {
  VerificationUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<ResponseWrapper<bool>>> call(VerificationParams params) {
    return _datasource.verification(params.data);
  }
}

class VerificationParams {
  const VerificationParams({required this.code, required this.phone});

  final String code;
  final String phone;

  Map<String, dynamic> get data => {'code': code, 'phone': phone};
}
