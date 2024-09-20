import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/common/enums/transmission_type.dart';
import 'package:werewolf_cars/core/api/api_utils.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/custom_dialog_list_view.dart';

class TranmissionDialog extends StatefulWidget {
  const TranmissionDialog({super.key});

  @override
  State<TranmissionDialog> createState() => _TranmissionDialogState();
}

class _TranmissionDialogState extends State<TranmissionDialog> {
  @override
  Widget build(BuildContext context) {
    return _buildDialog(context);
  }

  final List<String> _transmissionTypes =
      List.from(TransmissionType.values.map((e) => e.name));

  Widget _buildDialog(BuildContext context) {
    return Container(
      height: 350.h,
      padding: HWEdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: _buildBoxDecoration(),
      child: Column(
        children: [
          _buildHeader(context),
          15.verticalSpace,
          Expanded(
              child: CustomDialogListView(
            items: _transmissionTypes,
            onItemSelected: (selectedItem) {
              showMessage(selectedItem);
            },
          ))
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'Transmission',
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
