// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_it/get_it.dart';
// import 'package:go_router/go_router.dart';
// import 'package:werewolf_cars/core/config/routing/router.dart';
// import 'package:werewolf_cars/core/config/theme/colors_app.dart';
// import 'package:werewolf_cars/core/config/theme/typography.dart';
// import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
// import 'package:werewolf_cars/core/utils/responsive_padding.dart';
// import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
// import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
// import 'package:werewolf_cars/features/app/presentation/widgets/custom_radio_button.dart';
// import 'package:werewolf_cars/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:werewolf_cars/features/auth/presentation/widgets/auth_background.dart';
// import 'package:werewolf_cars/generated/assets.dart';
// import 'package:werewolf_cars/generated/locale_keys.g.dart';
// import 'package:simple_shadow/simple_shadow.dart';

// class ResetPasswordChoseTypePage extends StatefulWidget {
//   const ResetPasswordChoseTypePage({super.key});

//   @override
//   State<ResetPasswordChoseTypePage> createState() =>
//       _ResetPasswordChoseTypePageState();
// }

// class _ResetPasswordChoseTypePageState
//     extends State<ResetPasswordChoseTypePage> {
//   int selectedRadio = 1;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: GetIt.I<AuthBloc>(),
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: const Color(0xfff7fafc),
//           body: AuthBackground(
//             child: Padding(
//               padding:
//                   HWEdgeInsets.only(top: 85, right: 40, left: 40, bottom: 30),
//               child: SingleChildScrollView(
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Align(
//                       alignment: Alignment.center,
//                       child: SimpleShadow(
//                         color: AppColors.black,
//                         opacity: 0.15,
//                         offset: const Offset(0, 4),
//                         sigma: 4,
//                         child: AppText(
//                           LocaleKeys.auth_changePassword,
//                           textAlign: TextAlign.center,
//                           style: context.textTheme.headlineSmall.xb.withColor(
//                             AppColors.blackLight.withOpacity(0.85),
//                           ),
//                         ),
//                       ),
//                     ),
//                     152.verticalSpace,
//                     AppText(
//                       "حدد تفاصيل الاتصال التي تفضل أن نرسل إليك عن طريقها التفاصيل...",
//                       style: context.textTheme.titleMedium?.s18.m
//                           ?.copyWith(color: AppColors.blackLight),
//                       maxLines: 2,
//                       textAlign: TextAlign.center,
//                       textDirection: TextDirection.rtl,
//                     ),
//                     58.verticalSpace,
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedRadio = 1;
//                         });
//                       },
//                       child: CustomRadioButton(
//                         title: "ايميل",
//                         subtitle: "ارسال الى الايميل",
//                         isSelected: selectedRadio == 1,
//                         icon: Assets.svgEmailContainer,
//                       ),
//                     ),
//                     30.verticalSpace,
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedRadio = 2;
//                         });
//                       },
//                       child: CustomRadioButton(
//                         title: "رقم الهاتف",
//                         subtitle: "ارسال الى رقم الهاتف",
//                         isSelected: selectedRadio == 2,
//                         icon: Assets.svgPhone,
//                       ),
//                     ),
//                     74.verticalSpace,
//                     Row(
//                       children: [
//                         BlocBuilder<AuthBloc, AuthState>(
//                           builder: (context, state) {
//                             return AppElevatedButton(
//                               style: ButtonStyle(
//                                 shape: MaterialStatePropertyAll(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(5).r)),
//                                 textStyle: MaterialStatePropertyAll(
//                                     context.textTheme.bodyMedium.s18.b),
//                                 minimumSize:
//                                     MaterialStatePropertyAll(Size(212.w, 54.h)),
//                               ),
//                               text: "استمرار",
//                               isLoading: state.verificationStatus.isLoading(),
//                               onPressed: () => context.push(GRouter
//                                   .config.authRoutes.resetPasswordByPhonePage),
//                             );
//                           },
//                         ),
//                         12.horizontalSpace,
//                         AppElevatedButton(
//                           style: ButtonStyle(
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5).r)),
//                             textStyle: MaterialStatePropertyAll(
//                                 context.textTheme.bodyMedium.s18.b),
//                             minimumSize:
//                                 MaterialStatePropertyAll(Size(126.w, 54.h)),
//                           ),
//                           text: "رجوع",
//                           onPressed: () {
//                             GRouter.router.pop();
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
