// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_it/get_it.dart';
// import 'package:werewolf_cars/common/models/page_state/page_state.dart';
// import 'package:werewolf_cars/core/config/routing/router.dart';
// import 'package:werewolf_cars/core/config/theme/colors_app.dart';
// import 'package:werewolf_cars/core/config/theme/my_color_scheme.dart';
// import 'package:werewolf_cars/core/config/theme/typography.dart';
// import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
// import 'package:werewolf_cars/core/utils/responsive_padding.dart';
// import 'package:werewolf_cars/features/app/presentation/widgets/app_dropdown_search.dart';
// import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
// import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
// import 'package:werewolf_cars/features/app/presentation/widgets/loading_indicator.dart';
// import 'package:werewolf_cars/features/auth/presentation/widgets/auth_background.dart';
// import 'package:werewolf_cars/features/home/presentation/manager/restaurant_cubit/restaurant_cubit.dart';
// import 'package:werewolf_cars/generated/assets.dart';
// import 'package:werewolf_cars/generated/locale_keys.g.dart';
// import 'package:simple_shadow/simple_shadow.dart';

// class SelectCountyPage extends StatefulWidget {
//   const SelectCountyPage({super.key});

//   @override
//   State<SelectCountyPage> createState() => _SelectCountyPageState();
// }

// class _SelectCountyPageState extends State<SelectCountyPage> {
//   // City? selectedOption;
//   // late RestaurantCubit _restaurantCubit;

//   // void onSelectOption(City option) {
//   //   setState(() {
//   //     selectedOption = option;
//   //   });
//   // }

//   // onFilter(City value) {
//   //   onSelectOption(value);
//   //   return _restaurantCubit.onChangeSelectedCity(value);
//   // }

//   // @override
//   void initState() {
//     // _restaurantCubit = GetIt.I<RestaurantCubit>()..onGetMetaData();
//     // initSelectedOption();
//     super.initState();
//   }

//   // initSelectedOption() async {
//   //   selectedOption = await _restaurantCubit.loadSelectedCity();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xfff7fafc),
//         body: AuthBackground(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding:
//                   HWEdgeInsets.only(top: 85, right: 40, left: 40, bottom: 30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: SimpleShadow(
//                       color: AppColors.black,
//                       opacity: 0.15,
//                       offset: const Offset(0, 4),
//                       sigma: 4,
//                       child: AppText(
//                         "Chose city",
//                         textAlign: TextAlign.center,
//                         style: context.textTheme.headlineSmall?.xb.withColor(
//                           AppColors.blackLight.withOpacity(0.85),
//                         ),
//                       ),
//                     ),
//                   ),
//                   20.verticalSpace,
//                   AppSvgPicture(Assets.svgLocation,
//                       width: 175.w,
//                       alignment: Alignment.center,
//                       color: AppColors.blackLight),
//                   50.verticalSpace,
//                   Padding(
//                     padding: HWEdgeInsets.symmetric(horizontal: 10),
//                     child: SizedBox(
//                       height: 50.h,
//                       width: 626.w,
//                       child: _CityDropdown(
//                         onChanged: (v) => onFilter(v!),
//                       ),
//                     ),
//                   ),
//                   65.verticalSpace,
//                   TextButton(
//                     onPressed: () {
//                       if (selectedOption != null) {
//                         GRouter.router
//                             .goNamed(GRouter.config.mainRoutes.home);
//                       }
//                     },
//                     style: ButtonStyle(
//                       minimumSize:
//                           MaterialStatePropertyAll(Size(250.w, 55.h)),
//                       padding: const MaterialStatePropertyAll(
//                           EdgeInsets.symmetric(horizontal: 27)),
//                       backgroundColor:
//                           const MaterialStatePropertyAll(AppColors.primary),
//                       shape: MaterialStatePropertyAll(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(15.r),
//                           ),
//                         ),
//                       ),
//                     ),
//                     child: AppText(
//                       LocaleKeys.ok,
//                       style: context.textTheme.bodyLarge.b
//                           .withColor(AppColors.white),
//                     ),
//                   ),
//                   26.horizontalSpace,
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _CityDropdown extends StatelessWidget {
//   const _CityDropdown({required this.onChanged});

//   final void Function(City?)? onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 87.h,
//       width: 400.w,
//       child: dropDown(context),
//     );
//   }

//   Widget dropDown(BuildContext context) {
//     return BlocBuilder<RestaurantCubit, RestaurantState>(
//       builder: (context, state) {
//         return AppDropdownSearch<City?>(
//           items: state.cities.getDataWhenSuccess ?? [],
//           itemAsString: (item) => item!.name,
//           selectedItem: state.selectedCity,
//           onChanged: onChanged,
//           dropdownButtonProps: DropdownButtonProps(
//             alignment: Alignment.center,
//             icon: state.cities.when(
//               init: () => const Center(child: LoadingIndicator()),
//               loading: () => const Center(child: LoadingIndicator()),
//               loaded: (data) => state.selectedCity != null
//                   ? InkWell(
//                       onTap: () => context
//                           .read<RestaurantCubit>()
//                           .onChangeSelectedCity(null),
//                       child: Icon(Icons.close_rounded,
//                           size: 17,
//                           color: state.cities.getDataWhenSuccess!.isEmpty
//                               ? context.colorScheme.grey.withOpacity(0.3)
//                               : context.colorScheme.grey),
//                     )
//                   : Icon(Icons.keyboard_arrow_down_rounded,
//                       size: 20,
//                       color: state.cities.getDataWhenSuccess!.isEmpty
//                           ? context.colorScheme.grey.withOpacity(0.3)
//                           : context.colorScheme.grey),
//               empty: () => Icon(Icons.keyboard_arrow_down_rounded,
//                   size: 20,
//                   color: state.cities.getDataWhenSuccess!.isEmpty
//                       ? context.colorScheme.grey.withOpacity(0.3)
//                       : context.colorScheme.grey),
//               error: (exception) => InkWell(
//                   onTap: GetIt.I<RestaurantCubit>().onGetMetaData,
//                   child: const Icon(Icons.refresh)),
//             ),
//           ),
//           popupProps: PopupProps.menu(
//             showSearchBox: true,
//             menuProps: MenuProps(
//               borderRadius: BorderRadius.circular(15.r),
//             ),
//             itemBuilder: (context, item, isSelected) {
//               return Padding(
//                 padding: HWEdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     AppText(item!.name, style: context.textTheme.labelLarge.m),
//                     if (isSelected) const Icon(Icons.done_rounded)
//                   ],
//                 ),
//               );
//             },
//             searchFieldProps: TextFieldProps(
//               maxLines: 1,
//               textAlignVertical: TextAlignVertical.top,
//               decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//                   filled: true,
//                   constraints:
//                       const BoxConstraints(minHeight: 40, maxHeight: 40),
//                   fillColor: AppColors.grey.shade50,
//                   border: InputBorder.none,
//                   focusedErrorBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   hintText: "Search By Name",
//                   hintStyle:
//                       context.textTheme.titleSmall.m.withColor(AppColors.grey)),
//             ),
//           ),
//           hintText: "Choose County",
//           filled: true,
//           fillColor: const Color(0xffeff1f9),
//           borderColor: Colors.transparent,
//           validator: (value) => value == null ? LocaleKeys.required : null,
//         );
//       },
//     );
//   }
// }
