import 'package:flutter/material.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        text: 'Notifications',
        automaticallyImplyLeading: true,
      ),
    );
  }
}
