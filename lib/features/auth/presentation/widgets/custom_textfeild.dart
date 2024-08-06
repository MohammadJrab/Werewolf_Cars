import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:simple_shadow/simple_shadow.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final String? formControlName;
  final bool isObscureText;
  final bool withDivider;
  final String? firstPartIcon;
  final String? secondPartIcon;
  final TextInputType? textInputType;
  final double? radius;
  final TextInputAction? textInputAction;
  final ReactiveFormFieldCallback? onSubmitted;
  final Widget? prefixIcon;
  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.formControlName,
    this.isObscureText = false,
    this.firstPartIcon,
    this.secondPartIcon,
    this.radius,
    this.withDivider = true,
    this.textInputAction,
    this.textInputType,
    this.onSubmitted,
    this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late ValueNotifier<bool> _obscureNotifier;

  @override
  void initState() {
    _obscureNotifier = ValueNotifier(widget.isObscureText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _obscureNotifier,
        builder: (context, obscureText, _) {
          return SimpleShadow(
            opacity: 0.3,
            color: AppColors.primary.withOpacity(0.15),
            offset: const Offset(0, 4),
            sigma: 17.8,
            child: ReactiveTextField(
              controller: widget.controller,
              formControlName: widget.formControlName,
              textAlign: TextAlign.start,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: widget.textInputType,
              onSubmitted: widget.onSubmitted,
              validationMessages: {
                ValidationMessage.required: (error) => tr(LocaleKeys.required),
                ValidationMessage.email: (error) =>
                    tr(LocaleKeys.auth_enterTheCorrectEmail),
                ValidationMessage.minLength: (error) =>
                    tr(LocaleKeys.auth_enterAtLeastEightCharacters),
                ValidationMessage.mustMatch: (error) =>
                    tr(LocaleKeys.mustMatch),
                ValidationMessage.number: (error) =>
                    tr(LocaleKeys.enterValidMobileNumber),
              },
              style: context.textTheme.bodySmall.s14!.m
                  ?.copyWith(color: AppColors.blackLight),
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                // prefix: SizedBox(
                //   width: 31.h,
                // ),
                // suffixIcon: widget.isObscureText
                //     ? IconButton(
                //         onPressed: () =>
                //             _obscureNotifier.value = !obscureText,
                //         icon: Icon(
                //           obscureText
                //               ? CupertinoIcons.eye_slash
                //               : CupertinoIcons.eye,
                //           color: obscureText
                //               ? AppColors.grey
                //               : context.colorScheme.primary,
                //         ),
                //       )
                //     : null,
                // hintText: widget.hint,
                filled: true,
                suffixIcon: widget.isObscureText
                    ? IconButton(
                        onPressed: () => _obscureNotifier.value = !obscureText,
                        icon: Icon(
                          obscureText
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          color: obscureText
                              ? AppColors.grey
                              : context.colorScheme.primary,
                        ),
                      )
                    : null,
                hintText: widget.hint.tr(),
                fillColor: const Color(0xffFFFFFF),
                contentPadding: EdgeInsets.only(
                    top: 21, bottom: 21.0.h, right: 21.0.w, left: 21.0.w),
                hintStyle: context.textTheme.bodySmall.m
                    ?.copyWith(color: const Color(0xffADAEB5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 8).r,
                  borderSide: BorderSide(
                      width: 1, color: AppColors.blackLight.withOpacity(0.65)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 8).r,
                  borderSide: BorderSide(
                      width: 1, color: AppColors.blackLight.withOpacity(0.65)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 8).r,
                  borderSide: BorderSide(
                      width: 1, color: AppColors.blackLight.withOpacity(0.65)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 8).r,
                  borderSide: BorderSide(
                      width: 1, color: AppColors.blackLight.withOpacity(0.65)),
                ),
              ),
              obscuringCharacter: "*",
              obscureText: obscureText,
            ),
          );
        });
  }
}
