import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/config/use_case/use_case.dart';
import 'package:werewolf_cars/features/profile/data/data_sources/profile_datasource.dart';

@injectable
class UpdateProfileUsecase extends UseCase<Result<User>, UpdateProfileParams> {
  final ProfileDatasource _datasource;

  UpdateProfileUsecase(this._datasource);
  @override
  Future<Result<User>> call(UpdateProfileParams params) {
    return _datasource.updateProfile(params);
  }
}

class UpdateProfileParams {
  const UpdateProfileParams({
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.avatar,
  });

  final String displayName;
  final String email;
  final String phoneNumber;
  final File? avatar;
}
