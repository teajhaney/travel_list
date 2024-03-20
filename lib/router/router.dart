import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../source/features_export.dart';
import 'app_routes.dart';

final router = GoRouter(
  initialLocation: AppRoutes.onboard.path,
  // redirect: (context, state) async{

  // },
  routes: [
    GoRoute(
      path: AppRoutes.onboard.path,
      name: AppRoutes.onboard.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: OnboardingScreen()),
    ),
    GoRoute(
      path: AppRoutes.signIn.path,
      name: AppRoutes.signIn.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: SignInScreen()),
    ),
    GoRoute(
      path: AppRoutes.signUp.path,
      name: AppRoutes.signUp.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: SignUpScreen()),
    ),
    GoRoute(
      path: AppRoutes.buttomNavigation.path,
      name: AppRoutes.buttomNavigation.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ButtomNavigationBar()),
    ),
  ],
);
