import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';

@injectable
class ResetPasswordGenerateUsecase extends UseCase<
    Result<ResponseWrapper<bool>>, ResetPasswordGenerateParams> {
  ResetPasswordGenerateUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<ResponseWrapper<bool>>> call(
      ResetPasswordGenerateParams params) {
    return _datasource.resetPasswordGenerate(params.data);
  }
}

class ResetPasswordGenerateParams {
  const ResetPasswordGenerateParams({
    required this.phone,
  });

  final String phone;

  Map<String, dynamic> get data => {
        'phone': phone,
      };
}
