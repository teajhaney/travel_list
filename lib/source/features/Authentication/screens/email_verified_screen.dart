import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_list/router/app_routes.dart';

import '../../../../common/common_export.dart';
import '../../../features_export.dart';

class EmailVerifiedScreen extends StatefulWidget {
  const EmailVerifiedScreen({super.key});

  @override
  State<EmailVerifiedScreen> createState() => _EmailVerifiedScreenState();
}

class _EmailVerifiedScreenState extends State<EmailVerifiedScreen> {
  bool _isEmailverified = false;
  bool _canResendEmail = false;

  Timer? timer;
  @override
  void initState() {
    super.initState();
    _isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!_isEmailverified) {
      sendEmailVerification();
      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerification());
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthMethods().verifyEmail();
      if (!mounted) return;
      showSnackBar(context: context, content: 'Check your email address');

      setState(() {
        _canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 30));
      setState(() {
        _canResendEmail = true;
      });
    } catch (error) {
      if (!mounted) return;
      showSnackBar(
          context: context,
          content: error.toString(),
          color: Theme.of(context).colorScheme.error);
    }
  }

  Future<void> checkEmailVerification() async {
    //call after email verification
    FirebaseAuth.instance.currentUser!.reload;
    setState(() {
      _isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (_isEmailverified) {
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isEmailverified
        ? const ButtomNavigationBarScreen()
        : SafeArea(
            child: Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(n10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                         verificationEmailSent ),
                      const Gap(n20),
                      ButtonFiled(
                          onPressed: _canResendEmail
                              ? sendEmailVerification
                              : checkEmailVerification,
                          label: resendEmailverification),
                      const Gap(n20),
                      ButtonFiled(
                          label: "cancel",
                          onPressed: () {
                            AuthMethods().signOutUser;
                            context.goNamed(AppRoutes.signIn.name);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
