import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:werewolf_cars/common/enums/fuel_type.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/manager/search_cubit/search_cubit.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/text_with_border_item_widget.dart';

class FuelTypeListView extends StatelessWidget {
  const FuelTypeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return ListView.builder(
          padding: HWEdgeInsets.only(left: 4, right: 10),
          scrollDirection: Axis.horizontal,
          itemCount: FuelType.values.length,
          itemBuilder: (context, index) {
            final item = FuelType.values[index];
            final isSelected = item.name == state.seletedFuelType;
            return TextWithBorderItemWidget(
                title: item.name,
                isSelected: isSelected,
                onTap: () =>
                    context.read<SearchCubit>().selectFuelType(item.name));
          },
        );
      },
    );
  }
}
