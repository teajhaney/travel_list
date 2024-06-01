import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';
import 'package:travel_list/router/app_routes.dart';

import '../authentication_export.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordValid = false;

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

  //  VALIDATE PASSWORD
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _isPasswordValid = false;
      });
      return null;
    }
    // Define your password validation rules here
    final passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (passwordRegex.hasMatch(value)) {
      setState(() {
        _isPasswordValid = true;
      });

      //password is valid
    } else {
      setState(() {
        _isPasswordValid = false;
      });
    }
    return null;
  }
  // SIGN UP FUNCTION

  Future<void> _signIn() async {
    if (_isEmailValid && _isPasswordValid) {
      try {
        setState(() {
          _isLoading = true;
        });
        //implement sign in methods
        String response = await AuthMethods().signInUser(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (response == 'success') {
          setState(() {
            _isLoading = false;
          });
          if (!mounted) return;
          context.goNamed(AppRoutes.emailVerification.name);
        } else {
          setState(() {
            _isLoading = false;
          });
          if (!mounted) return;
          showSnackBar(
            context: context,
            content: 'Sign in failed, try again later',
            color: Theme.of(context).colorScheme.error,
          );
        }
      } on AuthException catch (error) {
        if (!mounted) return;
        showSnackBar(context: context, content: error.message);
      } catch (error) {
        if (!mounted) return;
        showSnackBar(
            context: context,
            content: 'Unexpected error occured, try again later',
            color: Theme.of(context).colorScheme.error);
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                      const Text(password),
                      const Gap(n20),
                      TextFieldInput(
                        textEditingController: _passwordController,
                        isPassword: true,
                        textInputType: TextInputType.text,
                        onchanged: _validatePassword,
                      ),
                      const Gap(n10),
                      GestureDetector(
                        onTap: () =>
                            context.goNamed(AppRoutes.forgotPassword.name),
                        child: Text(
                          forgotPassword,
                          style: getRegularStyle(
                              fontSize: n16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                        ),
                      ),
                      const Gap(n20),
                      Center(
                          child: FillButton(
                        isLoading: !_isLoading,
                        onPressed: _signIn,
                        label: signIn,
                      )),
                      const Gap(n20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(dontHaveAnAccount),
                          const Gap(n5),
                          GestureDetector(
                            onTap: () => context.goNamed(AppRoutes.signUp.name),
                            child: Text(
                              signUp,
                              style: getRegularStyle(
                                  fontSize: n16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                            ),
                          )
                        ],
                      )
                    ]))));
  }
}
