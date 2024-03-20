import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';
import 'package:travel_list/router/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final bool _isLoading = false;
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
                          textInputType: TextInputType.emailAddress),
                      const Gap(n20),
                      const Text(username),
                      const Gap(n20),
                      TextFieldInput(
                          textEditingController: _emailController,
                          isPassword: false,
                          textInputType: TextInputType.emailAddress),
                      const Gap(n20),
                      const Text('Password'),
                      const Gap(n20),
                      TextFieldInput(
                          textEditingController: _passwordController,
                          isPassword: true,
                          textInputType: TextInputType.text),
                      const Gap(n20),
                      Center(
                          child: FillButton(
                              isLoadind: !_isLoading,
                              label: signUp,
                              onPressed: () {})),
                      const Gap(n20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(alreadyHaveAnAccount),
                          const Gap(n5),
                          GestureDetector(
                            onTap: () => context.goNamed(AppRoutes.signIn.name),
                            child: Text(
                              signIn,
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
