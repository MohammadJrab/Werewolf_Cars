import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/common/enums/car_makers.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_dialog_search_bar.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/car_logo_sliver_grid.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/makers_list_tile_list_view.dart';
import 'package:werewolf_cars/services/car_maker_filter_service.dart';

class CarsMakersDialog extends StatefulWidget {
  const CarsMakersDialog({super.key});

  @override
  State<CarsMakersDialog> createState() => _CarsMakersDialogState();
}

class _CarsMakersDialogState extends State<CarsMakersDialog> {
  final TextEditingController _searchController = TextEditingController();
  final CarMakerFilterService _filterService = CarMakerFilterService();
  List<CarMaker> _filteredCarMakers = List.from(CarMaker.values);

  @override
  void initState() {
    super.initState();
    _filteredCarMakers = _filterService.filterCarMakers("", _filteredCarMakers);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredCarMakers = _filterService.filterCarMakers(
          _searchController.text, CarMaker.values);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildDialog(context);
  }

  Widget _buildDialog(BuildContext context) {
    return Container(
      padding: HWEdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: _buildBoxDecoration(),
      child: Column(
        children: [
          _buildHeader(context),
          20.verticalSpace,
          CustomDialogSearchBar(
              searchController: _searchController,
              hintText: 'Search for Makers'),
          _buildCarMakersContent(),
        ],
      ),
    );
  }

  Widget _buildCarMakersContent() {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          if (_searchController.text.isEmpty) const CarLogoSliverGrid(),
          SliverToBoxAdapter(child: 10.verticalSpace),
          SliverFillRemaining(
            child: MakersListTileListView(carMakers: _filteredCarMakers),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'Makers',
          style: context.textTheme.titleMedium?.s20.b,
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.xmark, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: AppColors.blackLight,
      borderRadius: BorderRadius.circular(10.r),
      boxShadow: const [
        BoxShadow(
          blurRadius: 8,
          color: AppColors.primary,
        )
      ],
    );
  }
}
