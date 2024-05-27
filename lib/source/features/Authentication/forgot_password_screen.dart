import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';
import 'package:travel_list/main.dart';
import 'package:travel_list/router/app_routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    super.key,
  });

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;
  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();
    if (email.isNotEmpty) {
      try {
        setState(() {
          _isLoading = true;
        });
        await supabase.auth.resetPasswordForEmail(_emailController.text.trim());
        if (!mounted) return;
        showSnackBar(
            context: context,
            content: "Password reset email sent successfully");
        context.goNamed(
          AppRoutes.signIn.name,
        );
      } on AuthException catch (error) {
        if (mounted) return;
        showSnackBar(
            context: context,
            content: error.message,
            color: Theme.of(context).colorScheme.error);
      } catch (error) {
        if (mounted) return;
        showSnackBar(
            context: context,
            content: 'Unexpected error occurred, try again later',
            color: Theme.of(context).colorScheme.error);
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } else {
      showSnackBar(
          context: context,
          content: "Input a valid email address",
          color: Theme.of(context).colorScheme.error);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(n20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(password),
                      const Gap(n20),
                      TextFieldInput(
                          textEditingController: _emailController,
                          isPassword: false,
                          textInputType: TextInputType.emailAddress),
                      const Gap(n20),
                      const Gap(n20),
                      Center(
                          child: FillButton(
                        isLoading: !_isLoading,
                        onPressed: _resetPassword,
                        label: resetPassword,
                      )),
                    ]))));
  }
}
