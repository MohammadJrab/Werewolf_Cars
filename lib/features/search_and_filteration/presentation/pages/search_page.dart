import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/refresh_list_widget.dart';
import 'package:werewolf_cars/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:werewolf_cars/generated/assets.dart';

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
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.verticalSpace,
                  Padding(
                    padding: HWEdgeInsetsDirectional.only(
                        start: 24, top: 20, bottom: 20),
                    child: AppText(
                      "Welome to search page",
                      style: context.textTheme.bodyMedium.s20.sb,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
