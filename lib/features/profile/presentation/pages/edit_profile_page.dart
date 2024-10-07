import 'package:faker/faker.dart' hide Color, Image;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/my_color_scheme.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text_field.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/auth/presentation/widgets/custom_textfeild.dart';
import 'package:werewolf_cars/features/auth/presentation/widgets/phone_text_field.dart';
import 'package:werewolf_cars/features/profile/presentation/manager/profile_bloc.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../core/config/routing/router.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late ProfileBloc _profileCubit;

  @override
  void initState() {
    _profileCubit = GetIt.I<ProfileBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profileCubit,
      child: SafeArea(
        top: false,
        child: ReactiveForm(
          formGroup: _profileCubit.profileForm,
          child: Scaffold(
            appBar: const CustomAppbar(
              text: LocaleKeys.editProfile,
              automaticallyImplyLeading: true,
            ),
            body: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    Positioned.fill(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: HWEdgeInsets.only(top: 150),
                            child: SingleChildScrollView(
                              padding: HWEdgeInsets.symmetric(horizontal: 33),
                              child: Column(
                                children: [
                                  65.verticalSpace,
                                  const CustomTextField(
                                    hint: LocaleKeys.ProfileDetials_fullName,
                                    formControlName: 'name',
                                    textInputAction: TextInputAction.next,
                                    prefixIcon: AppSvgPicture(
                                      Assets.svgPerson,
                                    ),
                                  ),
                                  30.verticalSpace,
                                  const CustomTextField(
                                    hint: LocaleKeys.ProfileDetials_email,
                                    formControlName: 'email',
                                    textInputAction: TextInputAction.next,
                                    prefixIcon: AppSvgPicture(
                                      Assets.svgEmail,
                                    ),
                                  ),
                                  30.verticalSpace,
                                  PhoneTextField(
                                    controlName: _profileCubit.kFromPhone,
                                    onSelect: (value) => _profileCubit
                                        .profileForm
                                        .control(_profileCubit.kFromCountryCode)
                                        .value = value.phoneCode,
                                    onInit: (value) => _profileCubit.profileForm
                                        .control(_profileCubit.kFromCountryCode)
                                        .value = value.phoneCode,
                                  ),
                                  80.verticalSpace,
                                  AppElevatedButton(
                                    text: LocaleKeys.saveChanges,
                                    onPressed: () {
                                      _profileCubit.add(UpdateProfile());
                                    },
                                    isLoading:
                                        state.updateProfileStatus.isLoading(),
                                    textStyle: context
                                        .textTheme.labelMedium.s18.b
                                        .withColor(AppColors.blackLight),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.white,
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width,
                                            53.h),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10).r)),
                                  ),
                                  30.verticalSpace,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 30.h,
                      width: 1.sw,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 120.h,
                          width: 120.w,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: state.selectedFile != null
                                    ? ClipOval(
                                        child: Image.file(
                                          state.selectedFile!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: Faker().image.loremPicsum(),
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) =>
                                              const AppSvgPicture(
                                                  Assets.svgPerson),
                                          placeholder: (context, url) =>
                                              const AppSvgPicture(
                                                  Assets.svgPerson),
                                        ),
                                      ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () => showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoActionSheet(
                                        title: AppText(LocaleKeys.photoOptions,
                                            style: context.textTheme.bodyLarge.b
                                                .withColor(AppColors.white)),
                                        actions: [
                                          CupertinoActionSheetAction(
                                            child: AppText(
                                              LocaleKeys
                                                  .chooseAnImageFromTheGallery,
                                              style: context
                                                  .textTheme.bodyLarge.b
                                                  .withColor(AppColors.white),
                                            ),
                                            onPressed: () {
                                              pickImage(
                                                  source: ImageSource.gallery);
                                            },
                                          ),
                                          CupertinoActionSheetAction(
                                            child: AppText(
                                              LocaleKeys
                                                  .takePictureFromTheCamera,
                                              style: context
                                                  .textTheme.bodyLarge.b
                                                  .withColor(AppColors.white),
                                            ),
                                            onPressed: () {
                                              pickImage(
                                                  source: ImageSource.camera);
                                            },
                                          ),
                                        ],
                                        cancelButton:
                                            CupertinoActionSheetAction(
                                          isDestructiveAction: true,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child:
                                              const AppText(LocaleKeys.cancel),
                                        ),
                                      );
                                    },
                                  ),
                                  child: Container(
                                    margin:
                                        HWEdgeInsets.only(right: 5, bottom: 5),
                                    padding: HWEdgeInsets.all(1.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.white,
                                    ),
                                    child: const Icon(
                                      Icons.edit_outlined,
                                      color: AppColors.blackLight,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  pickImage({
    required ImageSource source,
  }) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file == null) return;

    if (mounted) {
      Navigator.pop(context);
    }

    _profileCubit.add(ChangeProfileImage(file: File(file.path)));
  }

  // Widget profileInfo(
  //     {required String title,
  //     required String formControlName,
  //     TextDirection? textDirection}) {
  //   return Padding(
  //     padding: HWEdgeInsets.only(bottom: 30.0),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         AppText(
  //           title,
  //           style: context.textTheme.bodySmall.s13.m
  //               .withColor(AppColors.blackLight.withOpacity(0.77)),
  //         ),
  //         6.verticalSpace,
  //         Container(
  //           decoration: BoxDecoration(
  //             boxShadow: [
  //               BoxShadow(
  //                 color: AppColors.primary.withOpacity(0.15),
  //                 spreadRadius: 3,
  //                 blurRadius: 5,
  //               ),
  //             ],
  //             borderRadius: BorderRadius.circular(8).r,
  //           ),
  //           padding: EdgeInsets.zero,
  //           margin: EdgeInsets.zero,
  //           child: AppTextField(
  //             formControlName: formControlName,
  //             textAlign: TextAlign.center,
  //             textDirection: textDirection,
  //             // borderSideColor: AppColors.primary.withOpacity(0.65),
  //             contentPadding: HWEdgeInsetsDirectional.only(
  //                 start: 16, end: 10, top: 15, bottom: 15),
  //             borderRadius: BorderRadius.circular(8).r,
  //             borderWidth: 1.5,
  //             filled: true,
  //             maxLines: 1,
  //             fillColor: Colors.white,
  //             textStyle: context.textTheme.titleMedium.m
  //                 .withColor(AppColors.blackLight),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}


























// class EditProfilePage extends StatelessWidget {
//   const EditProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.blackLight,
//       appBar: const CustomAppbar(
//         text: 'Edit Profile',
//         automaticallyImplyLeading: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: HWEdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               40.verticalSpace,
//               const UserImageWithEdit(),
//               60.verticalSpace,
//               const EditColumnItemsProfile(),
//               const Spacer(),
//               const SaveButtonProfile(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
