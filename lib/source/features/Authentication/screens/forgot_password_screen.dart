import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';
import 'package:travel_list/router/app_routes.dart';

import '../authentication_export.dart';

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
  bool _isEmailValid = false;

  //  VALIDATE EMAIL ADDRESS

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _isEmailValid = false;
      });
      return null;
    }
    // Regular expression pattern for email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (emailRegex.hasMatch(value)) {
      setState(() {
        _isEmailValid = true;
      });

      // Email is valid
    } else {
      setState(() {
        _isEmailValid = false;
      });
    }
    return null;
  }

  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();
    if (_isEmailValid) {
      try {
        setState(() {
          _isLoading = true;
        });
        //implement forgot password
        String response = await AuthMethods().resetPassword(email: email);

        if (response == "success") {
          setState(() {
            _isLoading = false;
          });
          if (!mounted) return;
          showSnackBar(
              context: context,
              content: "Password reset email sent successfully");
          context.goNamed(AppRoutes.signIn.name);
        } else {
          setState(() {
            _isLoading = false;
          });
          if (!mounted) return;
          showSnackBar(
            context: context,
            content: 'Password reset failed: $response',
            color: Theme.of(context).colorScheme.error,
          );
        }
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
                      const Text(email),
                      const Gap(n20),
                      TextFieldInput(
                        textEditingController: _emailController,
                        isPassword: false,
                        textInputType: TextInputType.emailAddress,
                        onchanged: _validateEmail,
                      ),
                      const Gap(n20),
                      const Gap(n20),
                      Center(
                          child: FillButton(
                        isLoading: !_isLoading,
                        onPressed: _resetPassword,
                        label: resetPassword,
                      )),
                      const Gap(n20),
                      Center(
                          child: FillButton(
                        isLoading: !_isLoading,
                        onPressed: () => context.goNamed(AppRoutes.signIn.name),
                        label: signIn,
                      )),
                    ]))));
  }
}
