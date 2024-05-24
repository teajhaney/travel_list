import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';
import 'package:travel_list/router/app_routes.dart';

import '../../../main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
  Future<void> _signUp() async {
    if (_isEmailValid && _isPasswordValid) {
      try {
        setState(() {
          _isLoading = true;
        });

         await supabase.auth.signUp(
            password: _passwordController.text.trim(),
            email: _emailController.text.trim(),
            data: {'username': _usernameController.text.trim()});
        
        if (!mounted) return;
        context.goNamed(AppRoutes.buttomNavigation.name);
      } on AuthException catch (error) {
        if (!mounted) return;

        showSnackBar(context, error.message);
      } catch (error) {
        if (!mounted) return;
        showSnackBar(context, 'Unexpected error occured, try again later');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      showSnackBar(context, 'Invalid email or password');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: constraints.maxHeight,
        ),
        child: IntrinsicHeight(
          child: Center(
            child: Padding(
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
                    const Text(username),
                    const Gap(n20),
                    TextFieldInput(
                        textEditingController: _usernameController,
                        isPassword: false,
                        textInputType: TextInputType.emailAddress),
                    const Gap(n20),
                    const Text(password),
                    const Gap(n20),
                    TextFieldInput(
                      textEditingController: _passwordController,
                      isPassword: true,
                      textInputType: TextInputType.text,
                      onchanged: _validatePassword,
                    ),
                    const Gap(n20),
                    Text(
                      passwordRule,
                      style: getRegularStyle(
                          fontSize: n10,
                          color: Theme.of(context).colorScheme.error),
                    ),
                    const Gap(n20),
                    Center(
                        child: FillButton(
                      isLoading: !_isLoading,
                      label: signUp,
                      onPressed: _signUp,
                    )),
                    const Gap(n20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(alreadyHaveAnAccount),
                        const Gap(n5),
                        GestureDetector(
                          onTap: () {
                            context.goNamed(AppRoutes.signIn.name);
                          },
                          child: Text(
                            signIn,
                            style: getMediumStyle(
                                fontSize: n16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ));
    })));
  }
}
