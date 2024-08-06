import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import '../../data/data_sources/auth_datasource.dart';
import '../../data/models/customer_info.dart';

@injectable
class LoginUsecase extends UseCase<
    Result<ResponseWrapper<CustomerInfoResponse>>, LoginParams> {
  LoginUsecase(this._datasource);

  final AuthDatasource _datasource;

  @override
  Future<Result<ResponseWrapper<CustomerInfoResponse>>> call(
      LoginParams params) {
    return _datasource.login(params.data);
  }
}

class LoginParams {
  const LoginParams({
    required this.phone,
    required this.password,
    required this.fcm,
  });

  final String phone;
  final String password;
  final String? fcm;

  Map<String, dynamic> get data => {
        'phone': phone,
        'password': password,
        'fcm_token': fcm,
      };
}
