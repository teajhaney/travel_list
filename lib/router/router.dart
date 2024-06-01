import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../source/features_export.dart';
import 'app_routes.dart';

final router = GoRouter(
  initialLocation: AppRoutes.buttomNavigation.path,
  routes: [
    GoRoute(
      path: AppRoutes.onboard.path,
      name: AppRoutes.onboard.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: OnboardingScreen()),
    ),
    GoRoute(
      path: AppRoutes.buttomNavigation.path,
      name: AppRoutes.buttomNavigation.name,
      redirect: (context, state) async {
        final authService = AuthMethods();
        return authService.authStateChanges.first.then((user) async {
          if (user == null ||
              !FirebaseAuth.instance.currentUser!.emailVerified) {
            // User is not signed in, redirect to sign-in page
            return state.namedLocation(AppRoutes.signIn.name);
          } else {
            // User is signed in, stay on the current page
            return null;
          }
        });
      },
      pageBuilder: (context, state) =>
          const MaterialPage(child: ButtomNavigationBarScreen()),
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
      path: AppRoutes.forgotPassword.path,
      name: AppRoutes.forgotPassword.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ForgotPasswordScreen()),
    ),
    GoRoute(
      path: AppRoutes.emailVerification.path,
      name: AppRoutes.emailVerification.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: EmailVerifiedScreen()),
    ),
  ],
);
