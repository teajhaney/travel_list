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
  Future<void> _signUp() async {
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
      print(error.message);
      showSnackBar(context, error.message);
    } catch (error) {
      if (!mounted) return;
      showSnackBar(context, 'Unexpected error occured, try again later');
    } finally {
      setState(() {
        _isLoading = false;
      });
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
                        onPressed: _signUp,
                      )),
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
