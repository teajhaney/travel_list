import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '.././source/features_export.dart';
import 'app_routes.dart';

final router = GoRouter(
  initialLocation: AppRoutes.buttomNavigation.path,
  // redirect: (context, state) async{

  // },
  routes: [
    GoRoute(
      path: AppRoutes.buttomNavigation.path,
      name: AppRoutes.onboard.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ButtomNavigationBar()),
    ),
  ],
);
