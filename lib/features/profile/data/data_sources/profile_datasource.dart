import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/core/api/api_utils.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/features/profile/domain/use_cases/update_profile.dart';

@injectable
class ProfileDatasource {
  Future<Result<User>> updateProfile(UpdateProfileParams params) async {
    fun() async {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'user-not-logged-in',
          message: 'No user is currently logged in.',
        );
      }
      String? avatarUrl;

      if (params.avatar != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('avatars')
            .child('${user.uid}.jpg');

        await storageRef.putFile(params.avatar!);
        avatarUrl = await storageRef.getDownloadURL();
      }
      if (params.email != user.email) {
        await user.updateEmail(params.email);
      }

      await user.updateProfile(
        displayName: params.displayName,
        photoURL: avatarUrl,
      );

      await user.reload();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'phone_number': params.phoneNumber,
        'email': params.email,
        'full_name': params.displayName,
        if (avatarUrl != null) 'photo_url': avatarUrl,
      });
      return FirebaseAuth.instance.currentUser!;
    }

    return toApiResult(() => throwAppException(fun));
  }
}
