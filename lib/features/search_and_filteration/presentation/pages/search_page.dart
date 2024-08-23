import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/car_mini_details_card_widget.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/refresh_list_widget.dart';
import 'package:werewolf_cars/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/cars_list_view_builder.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:badges/badges.dart' as badges;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearcgPageState();
}

class _SearcgPageState extends State<SearchPage> {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    _homeCubit = GetIt.I<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeCubit,
      child: SafeArea(
        child: Scaffold(
          body: RefreshListWidget(
            onRefresh: _homeCubit.getHomeData,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                25.verticalSpace,
                const _SearchBar(),
                40.verticalSpace,
                Container(
                  height: 40.h,
                  margin: HWEdgeInsets.only(left: 24),
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      FilterItem(
                        isActive: true,
                        name: "",
                        svg: Assets.makersBmw,
                      )
                    ],
                  ),
                ),
                15.verticalSpace,
                Container(
                  width: 354.w,
                  height: 0.5.h,
                  alignment: Alignment.center,
                  color: AppColors.whiteLess,
                ),
                Expanded(
                  child: CarsListViewBuilder(
                    scrollDirection: Axis.vertical,
                    padding: HWEdgeInsetsDirectional.only(
                        start: 14, end: 14, top: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final bool isActive;
  final String svg;
  final String name;

  const FilterItem({
    super.key,
    required this.isActive,
    required this.svg,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GRouter.router.pushNamed(GRouter.config.filterRoutes.filter);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        alignment: Alignment.center,
        width: 70.w,
        margin: HWEdgeInsets.only(left: 10),
        padding: HWEdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.grey.shade900,
          border: isActive
              ? Border.all(color: AppColors.primary, width: 2.r)
              : null,
        ),
        child: badges.Badge(
          position: badges.BadgePosition.bottomEnd(end: -8),
          showBadge: true,
          onTap: () {},
          badgeContent: Center(
            child: AppText(
              4.toString(),
              style: context.textTheme.bodySmall!.sb!.copyWith(
                color: AppColors.white,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          badgeAnimation: const badges.BadgeAnimation.slide(),
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: AppColors.blackLight,
            padding: HWEdgeInsets.all(5),
          ),
          child: AppSvgPicture(Assets.svgFilterAcitve, width: 30.r),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
