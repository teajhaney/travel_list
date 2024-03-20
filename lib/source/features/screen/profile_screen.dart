import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_list/common/app_widgets.dart';
import 'package:travel_list/main.dart';
import 'package:travel_list/router/app_routes.dart';

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
        isLoadind: true,
        label: 'Sign out',
        onPressed: () {
          supabase.auth.signOut();
          context.goNamed(AppRoutes.signIn.name);
        },
      )),
    );
  }
}
