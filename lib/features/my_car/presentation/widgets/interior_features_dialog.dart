import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/common/enums/interior_features.dart';
import 'package:werewolf_cars/core/api/api_utils.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/extensions/interiro_features_extension.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/feautres_list_view.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';

class InteriorFeaturesDialog extends StatefulWidget {
  const InteriorFeaturesDialog({super.key});

  @override
  State<InteriorFeaturesDialog> createState() => _InteriorFeaturesDialogState();
}

class _InteriorFeaturesDialogState extends State<InteriorFeaturesDialog> {
  final Set<String> _selectedFeatures = {};

  final List<String> _interiorFeatures = InteriorFeature.values
      .map(
        (e) => e.featureName,
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return _buildDialog(context);
  }

  Widget _buildDialog(BuildContext context) {
    return Container(
      height: 675.h,
      padding: HWEdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: _buildBoxDecoration(),
      child: Column(
        children: [
          _buildHeader(context),
          15.verticalSpace,
          SizedBox(
            height: 530.h,
            child: DialogFeaturesListView(
              items: _interiorFeatures,
              selectedItems: _selectedFeatures,
              onItemSelected: (selectedItem, isSelected) {
                setState(() {
                  if (isSelected) {
                    _selectedFeatures.add(selectedItem);
                  } else {
                    _selectedFeatures.remove(selectedItem);
                  }
                });
              },
            ),
          ),
          22.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              dialogButton(
                context: context,
                title: LocaleKeys.cancel,
                onTap: () => context.pop(),
              ),
              dialogButton(
                context: context,
                title: LocaleKeys.ok,
                onTap: () {
                  showMessage(_selectedFeatures.join(" || "));
                  context.pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector dialogButton({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AppText(
        title,
        style: context.textTheme.bodyMedium.s18.b,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'Interior',
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
