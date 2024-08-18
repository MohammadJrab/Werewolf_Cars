import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';

class StatusSectionWidget extends StatelessWidget {
  const StatusSectionWidget({
    super.key,
    required this.isStatus,
  });

  final bool isStatus;

  @override
  Widget build(BuildContext context) {
    return isStatus
        ? Column(
            children: [
              const Divider(),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    'Status : Under reviewing',
                    style: context.textTheme.bodyLarge!.s18.xb
                        .withColor(AppColors.white),
                  ))
            ],
          )
        : const SizedBox();
  }
}
