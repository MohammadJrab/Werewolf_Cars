import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/my_color_scheme.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_dropdown_search.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/car_mini_details_card_widget.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_drop_down_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/refresh_list_widget.dart';
import 'package:werewolf_cars/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/car_type_list_view_state.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    _homeCubit = GetIt.I<HomeCubit>()..getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
      value: _homeCubit,
      child: SafeArea(
        child: Scaffold(
          body: RefreshListWidget(
            onRefresh: _homeCubit.getHomeData,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppSvgPicture(
                        Assets.svgBell,
                        width: 24.w,
                        height: 24.w,
                      ),
                      _CityDropdown(
                        onChanged: (m) {},
                      ),
                      CircleAvatar(
                        backgroundImage: const AssetImage(Assets.imagesAppIcon),
                        maxRadius: 28.r,
                      )
                    ],
                  ),
                  30.verticalSpace,
                  SearchBar(
                    onTap: () {},
                  ),
                  Padding(
                    padding: HWEdgeInsetsDirectional.only(
                        start: 24, top: 20, bottom: 20),
                    child: AppText(
                      "Recommended",
                      style: context.textTheme.bodyMedium.s20.sb,
                    ),
                  ),
                  SizedBox(
                    height: 260.h,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) =>
                            const CarMiniDetailsCardWidget()),
                  ),
                  Padding(
                    padding: HWEdgeInsetsDirectional.only(
                        start: 24, top: 20, bottom: 20),
                    child: AppText(
                      "Browse by body type",
                      style: context.textTheme.bodyMedium.s20.sb,
                    ),
                  ),
                  Padding(
                    padding: HWEdgeInsetsDirectional.only(start: 14),
                    child: const SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CarTypeListView(),
                    ),
                  ),
                  Padding(
                    padding: HWEdgeInsetsDirectional.only(
                        start: 24, top: 20, bottom: 20),
                    child: AppText(
                      "Browse by Budget",
                      style: context.textTheme.bodyMedium.s20.sb,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50.h,
                          width: 75.w,
                          margin: HWEdgeInsets.only(left: 24),
                          decoration: BoxDecoration(
                              color: AppColors.whiteLess,
                              borderRadius: BorderRadius.circular(8).r),
                        );
                      },
                    ),
                  ),
                  80.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CityDropdown extends StatelessWidget {
  const _CityDropdown({required this.onChanged});

  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 180.w,
      child: Row(
        children: [
          15.horizontalSpace,
          const AppSvgPicture(Assets.svgLocationPin),
          10.horizontalSpace,
          Expanded(child: dropDown(context)),
        ],
      ),
    );
  }

  Widget dropDown(BuildContext context) {
    return AppDropdownSearch<String?>(
      items: const ["Dubie", "Germany"],
      itemAsString: (item) => item!.toUpperCase(),
      selectedItem: "Germany",
      onChanged: onChanged,
      contentPadding: HWEdgeInsetsDirectional.only(start: 2, end: 0),
      dropdownButtonProps: DropdownButtonProps(
        alignment: Alignment.center,
        icon: AppSvgPicture(Assets.svgArrowDown,
            width: 14.w, color: context.colorScheme.white),
      ),
      baseStyle: context.textTheme.titleMedium.s17.b.withColor(AppColors.white),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        menuProps: MenuProps(
          borderRadius: BorderRadius.circular(15.r),
        ),
        itemBuilder: (context, item, isSelected) {
          return Padding(
            padding: HWEdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(item!, style: context.textTheme.labelLarge.m),
                if (isSelected) const Icon(Icons.done_rounded)
              ],
            ),
          );
        },
        searchFieldProps: TextFieldProps(
          style:
              context.textTheme.bodyMedium?.b.withColor(AppColors.blackLight),
          maxLines: 1,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              filled: true,
              constraints: const BoxConstraints(minHeight: 40, maxHeight: 40),
              fillColor: AppColors.grey.shade50,
              border: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search By Name",
              hintStyle:
                  context.textTheme.titleSmall.m.withColor(AppColors.grey)),
        ),
      ),
      hintText: "Choose County",
      filled: false,
      borderColor: Colors.transparent,
      validator: (value) => value == null ? LocaleKeys.required : null,
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: 328.w,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10).r),
        padding: HWEdgeInsetsDirectional.only(start: 36, end: 24),
        margin: HWEdgeInsets.only(left: 24, right: 24),
        child: Row(
          children: [
            SizedBox(
              width: 24.r,
              child: const AppSvgPicture(
                Assets.svgSearch,
                color: Color(0xff8C9199),
              ),
            ),
            18.horizontalSpace,
            AppText(
              LocaleKeys.searchHereForCars,
              style: context.textTheme.bodyMedium.r
                  .withColor(AppColors.blackLight.withOpacity(0.67)),
            ),
            60.horizontalSpace,
            SizedBox(
              width: 24.r,
              child: const AppSvgPicture(
                Assets.svgFilter,
                color: Color(0xff8C9199),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
