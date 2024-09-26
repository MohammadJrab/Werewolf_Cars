import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:werewolf_cars/common/enums/car_makers.dart';
import 'package:werewolf_cars/core/utils/extensions/parse_string_to_enum.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/animated_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/makers_dialog.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/manager/search_cubit/search_cubit.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/see_full_list_button_widget.dart';

class ShowCarMakersListViewWidget extends StatelessWidget {
  const ShowCarMakersListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    return SeeFullListButtonWidget(
        onTap: () => AnimatedDialog.show(
              context,
              insetPadding:
                  HWEdgeInsets.only(top: 60, left: 40, right: 40, bottom: 30),
              child: CarsMakersDialog(
                isMultiSelect: true,
                selectedCarMakers: searchCubit.state.selectedCarMakersFilter
                    .map((e) => e.toEnum())
                    .toList(),
                onSelectionConfirmed: (selectedMakers) {
                  if (selectedMakers is List<CarMaker>) {
                    for (CarMaker carMaker in selectedMakers) {
                      searchCubit.toggleMakerSelection(carMaker.name);
                    }
                  } else {
                    searchCubit.resetMakerSelection();
                  }
                },
              ),
              barrierDismissible: true,
              barrierLabel: "MakersDialog",
            ));
  }
}
