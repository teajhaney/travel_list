import 'package:flutter/material.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
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
              const Text('Email'),
              const Gap(n20),
              TextFieldInput(
                  textEditingController: _emailController,
                  isPassword: false,
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress),
              const Gap(n20),
              const Text('Password'),
              const Gap(n20),
              TextFieldInput(
                  textEditingController: _passwordController,
                  isPassword: true,
                  hintText: "Enter your password",
                  textInputType: TextInputType.text),
              const Gap(n20),
              Center(
                child: FilledButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: n10, vertical: n20),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(n10),
                        ),
                      )),
                  onPressed: () {},
                  child: !_isLoading
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sign In',
                            style: getMediumStyle(
                                fontSize: n30, color: Colors.white),
                          ),
                        )
                      : const CircularProgressIndicator(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
