import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:werewolf_cars/common/helpers/helper_functions.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.verticalSpace,
        Padding(
          padding: HWEdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.language_rounded,
                color: AppColors.white,
              ),
              16.horizontalSpace,
              AppText(
                LocaleKeys.chooseLang,
                style: context.textTheme.titleMedium?.b.withColor(
                  AppColors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(CupertinoIcons.xmark,
                    size: 20, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        15.verticalSpace,
        ListTile(
          onTap: () async {
            if (context.locale.languageCode == "ar") {
              return;
            }
            await Future.wait([
              context.setLocale(const Locale('ar')),
              HelperFunctions().refresh(),
            ]);
            GRouter.router.go(GRouter.config.krpRoot);
          },
          contentPadding: HWEdgeInsetsDirectional.only(start: 30, end: 30),
          title: const AppText("عربي"),
          trailing: context.locale.languageCode == "ar"
              ? const Icon(
                  CupertinoIcons.checkmark_circle,
                  color: AppColors.primary,
                )
              : null,
        ),
        ListTile(
          onTap: () async {
            if (context.locale.languageCode == "en") {
              return;
            }
            await Future.wait([
              context.setLocale(const Locale('en')),
              HelperFunctions().refresh(),
            ]);
            GRouter.router.go(GRouter.config.krpRoot);
          },
          contentPadding: HWEdgeInsetsDirectional.only(start: 30, end: 30),
          title: const AppText("English"),
          trailing: context.locale.languageCode == "en"
              ? const Icon(
                  CupertinoIcons.checkmark_circle,
                  color: AppColors.primary,
                )
              : null,
        ),
      ],
    );
  }
}
