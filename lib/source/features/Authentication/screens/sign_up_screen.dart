import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';
import 'package:travel_list/router/app_routes.dart';

import '../authentication_export.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
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

        //implement sign up methods
        String response = await AuthMethods().signUpUser(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          userName: _usernameController.text,
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
            content: 'Sign up failed, Try Again later',
            color: Theme.of(context).colorScheme.error,
          );
        }
      } on FirebaseAuthException catch (error) {
        if (!mounted) return;

        showSnackBar(context: context, content: error.message!);
      } catch (error) {
        if (!mounted) return;
        showSnackBar(
            context: context,
            content: 'Unexpected error occured, try again later',
            color: Theme.of(context).colorScheme.error);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      showSnackBar(
          context: context,
          content: 'Invalid email or password',
          color: Theme.of(context).colorScheme.error);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
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
              padding: const EdgeInsets.all(n10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(firstName),
                    const Gap(n10),
                    TextFieldInput(
                      textEditingController: _firstNameController,
                      isPassword: false,
                      textInputType: TextInputType.name,
                    ),
                    const Gap(n10),
                    const Text(lastName),
                    const Gap(n10),
                    TextFieldInput(
                      textEditingController: _lastNameController,
                      isPassword: false,
                      textInputType: TextInputType.name,
                    ),
                    const Gap(n10),
                    const Text(email),
                    const Gap(n10),
                    TextFieldInput(
                      textEditingController: _emailController,
                      isPassword: false,
                      textInputType: TextInputType.emailAddress,
                      onchanged: _validateEmail,
                    ),
                    const Gap(n10),
                    const Text(username),
                    const Gap(n10),
                    TextFieldInput(
                        textEditingController: _usernameController,
                        isPassword: false,
                        textInputType: TextInputType.name),
                    const Gap(n10),
                    const Text(password),
                    const Gap(n10),
                    TextFieldInput(
                      textEditingController: _passwordController,
                      isPassword: true,
                      textInputType: TextInputType.text,
                      onchanged: _validatePassword,
                    ),
                    const Gap(n10),
                    Text(
                      passwordRule,
                      style: getRegularStyle(
                          fontSize: n10,
                          color: Theme.of(context).colorScheme.error),
                    ),
                    const Gap(n10),
                    Center(
                        child: FillButton(
                      isLoading: !_isLoading,
                      label: signUp,
                      onPressed: _signUp,
                    )),
                    const Gap(n10),
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
