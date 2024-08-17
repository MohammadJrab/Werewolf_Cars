import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:werewolf_cars/core/config/routing/router_config.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/pages/error_page.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/onboarding_widget.dart';
import 'package:werewolf_cars/features/auth/presentation/pages/congrate_page.dart';
import 'package:werewolf_cars/features/auth/presentation/pages/login_page.dart';
import 'package:werewolf_cars/features/auth/presentation/pages/reset_password_page.dart';
import 'package:werewolf_cars/features/auth/presentation/pages/select_country_page.dart';
import 'package:werewolf_cars/features/auth/presentation/pages/sigup_page.dart';
import 'package:werewolf_cars/features/home/presentation/pages/home_page.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/pages/search_page.dart';

import '../../../features/app/presentation/pages/base_page.dart';
import '../../../features/app/presentation/pages/splash_page.dart';

class GRouter {
  static GRouter? _instance;

  factory GRouter() => _instance ??= GRouter();

  static GoRouter get router => _router;

  static RouterConfiguration get config => _config;

  static final RouterConfiguration _config = RouterConfiguration.init();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: _config.krpRoot,
        name: _config.krpRoot,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const SplashScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.krpOnboardingRoutePath,
        name: _config.krpOnboardingRoutePath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const OnboardingPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.authRoutes.loginPage,
        name: _config.authRoutes.loginPage,
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const LoginPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.authRoutes.signupPage,
        name: _config.authRoutes.signupPage,
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const SingUpPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.authRoutes.resetPasswordPage,
        name: _config.authRoutes.resetPasswordPage,
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const ResetPassword(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.authRoutes.selectCountryPage,
        name: _config.authRoutes.selectCountryPage,
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const SelectCountyPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.authRoutes.congratsPage,
        name: _config.authRoutes.congratsPage,
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const CongratsPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.notificationsRoutes.notifications,
        name: _config.notificationsRoutes.notifications,
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: Container(
              color: AppColors.blackLight,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.settingsRoutes.settings,
        name: _config.settingsRoutes.settings,
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: Container(
              color: AppColors.blackLight,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.settingsRoutes.privacyPolicy,
        name: _config.settingsRoutes.privacyPolicy,
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: Container(
              color: AppColors.blackLight,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.settingsRoutes.aboutUs,
        name: _config.settingsRoutes.aboutUs,
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: Container(
              color: AppColors.blackLight,
            ),
            state: state,
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: _config.mainRoutes.home,
                name: _config.mainRoutes.home,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child: const HomePage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: _config.mainRoutes.search,
                name: _config.mainRoutes.search,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child: const SearchPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: _config.mainRoutes.sellMyCars,
                name: _config.mainRoutes.sellMyCars,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child: Container(
                      color: AppColors.blackLight,
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: _config.mainRoutes.favorites,
                name: _config.mainRoutes.favorites,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child: Container(
                      color: AppColors.blackLight,
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: _config.mainRoutes.chat,
                name: _config.mainRoutes.chat,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child: Container(
                      color: AppColors.blackLight,
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        builder: (context, state, navigationShell) =>
            BasePage(child: navigationShell),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(exception: state.error),
  );

  static Page<dynamic> _builderPage<T>(
      {required Widget child, required GoRouterState state}) {
    if (Platform.isIOS) {
      return CupertinoPage<T>(child: child, key: state.pageKey);
    } else {
      return MaterialPage<T>(child: child, key: state.pageKey);
    }
  }
}
