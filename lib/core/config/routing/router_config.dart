class RouterConfiguration {
  RouterConfiguration.init();

  final String krpRoot = '/';
  final String krpOnboardingRoutePath = '/onboarding';
  final mainRoutes = const _MainRoutes._();
  final homeRoutes = const _HomeRoutes._();
  final myCarsRoutes = const _MyCarsRoutes._();
  final profileRoutes = const _ProfileRoutes._();
  final authRoutes = const _AuthRoutes._();
  final notificationsRoutes = const _NotificationsRoutes._();
  final settingsRoutes = const _SettingsRoutes._();
  final chatsRoutes = const _ChatsRoutes._();
}

class _MainRoutes {
  const _MainRoutes._();
  final String home = '/home';
  final String search = '/search';
  final String sellMyCars = '/myOrders';
  final String favorites = '/favorites';
  final String chat = '/chat';
  final String profile = '/profile';
}

class _HomeRoutes {
  const _HomeRoutes._();
  final String home = '/home';

  final String carDetails = '/carDetails';
}

class _ProfileRoutes {
  const _ProfileRoutes._();
  final String profile = '/profile';
  final String profileView = '/profileView';
  final String profileEdit = '/profileEdit';
  final String favorite = '/favorite';
}

class _NotificationsRoutes {
  const _NotificationsRoutes._();

  final String notifications = '/notifications';
}

class _SettingsRoutes {
  const _SettingsRoutes._();

  final String settings = '/settings';
  final String privacyPolicy = '/privacyPolicy';
  final String aboutUs = '/aboutUs';
}

class _AuthRoutes {
  const _AuthRoutes._();

  final String loginPage = '/loginPage';
  final String signupPage = '/signupPage';
  final String confirmAccountPage = '/confirmAccountPage';
  final String congratsPage = '/congratsPage';
  final String resetPasswordPage = '/resetPasswordPage';
  final String selectCountryPage = '/selectCountryPage';
}

class _MyCarsRoutes {
  const _MyCarsRoutes._();
  final String myCarsPage = 'myCarsPage';
}

class _ChatsRoutes {
  const _ChatsRoutes._();
  final String chatsPage = 'chatsPage';
}
