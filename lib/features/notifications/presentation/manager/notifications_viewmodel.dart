import 'package:flutter/material.dart';
import 'package:werewolf_cars/features/notifications/data/models/notification_model.dart';

class NotificationViewModel {
  final NotificationModel notification;
  ValueNotifier<bool> isRead;

  NotificationViewModel({required this.notification})
      : isRead = ValueNotifier(notification.readAt != null);
}
