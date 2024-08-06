import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/response_wrapper/response_wrapper.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/use_case/use_case.dart';
import 'package:werewolf_cars/features/auth/data/data_sources/auth_datasource.dart';
import 'package:werewolf_cars/features/auth/data/models/customer_info.dart';

@injectable
class RegisterUsecase extends UseCase<
    Result<ResponseWrapper<CustomerInfoResponse>>, RegisterParams> {
  RegisterUsecase(this._datasource);
  final AuthDatasource _datasource;
  @override
  Future<Result<ResponseWrapper<CustomerInfoResponse>>> call(
      RegisterParams params) {
    return _datasource.register(params.data);
  }
}

class RegisterParams {
  const RegisterParams({
    required this.name,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });
  final String name;
  final String phone;
  final String password;
  final String passwordConfirmation;

  Map<String, dynamic> get data => {
        'name': name,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
}
