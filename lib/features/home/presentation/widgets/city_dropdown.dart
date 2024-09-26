import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/my_color_scheme.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_dropdown_search.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';

class CityDropdown extends StatelessWidget {
  const CityDropdown({super.key, required this.onChanged});

  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: 180.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
      baseStyle:
          context.textTheme.titleMedium?.s17.b.withColor(AppColors.white),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        fit: FlexFit.loose,
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
