import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';
import 'package:travel_list/main.dart';
import 'package:travel_list/router/app_routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await supabase.auth.signInWithPassword(
          password: _passwordController.text.trim(),
          email: _emailController.text.trim());
      if (!mounted) return;
      context.goNamed(AppRoutes.buttomNavigation.name);
    } on AuthException catch (error) {
      if (!mounted) return;
      showSnackBar(context, error.message);
    } catch (error) {
      if (!mounted) return;
      showSnackBar(context, 'Unexpected error occured, try again later');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
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
