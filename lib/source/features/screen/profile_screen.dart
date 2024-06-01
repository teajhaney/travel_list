import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_list/common/app_widgets.dart';
import 'package:travel_list/router/app_routes.dart';
import 'package:travel_list/source/features/Authentication/authentication_export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FillButton(
        isLoading: true,
        label: 'Sign out',
        onPressed: () {
          AuthMethods().signOutUser();
          context.goNamed(AppRoutes.signIn.name);
        },
      )),
    );
  }
}
