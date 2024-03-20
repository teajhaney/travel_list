import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';
import 'package:travel_list/router/app_routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isLoading = false;
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
                          textInputType: TextInputType.emailAddress),
                      const Gap(n20),
                      const Text(password),
                      const Gap(n20),
                      TextFieldInput(
                          textEditingController: _passwordController,
                          isPassword: true,
                          textInputType: TextInputType.text),
                      const Gap(n10),
                      GestureDetector(
                        onTap: () => context.goNamed(AppRoutes.signUp.name),
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
                        isLoadind: !_isLoading,
                        onPressed: () =>
                            context.goNamed(AppRoutes.buttomNavigation.name),
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
