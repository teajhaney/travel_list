import 'package:flutter/material.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:gap/gap.dart';

class PasswordResetScreen extends StatefulWidget {
//   final String resetToken;
  const PasswordResetScreen({
    super.key, 
	//required this.resetToken,
  });

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  final bool _isLoading = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
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
                      const Text(newPassword),
                      const Gap(n20),
                      TextFieldInput(
                        textEditingController: _newPasswordController,
                        isPassword: false,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const Gap(n20),
                      const Text(confirmNewPassword),
                      const Gap(n20),
                      TextFieldInput(
                          textEditingController: _confirmNewPasswordController,
                          isPassword: false,
                          textInputType: TextInputType.emailAddress),
                      const Gap(n20),
                      Center(
                          child: FillButton(
                        isLoading: !_isLoading,
                        onPressed: () {},
                        label: resetPassword,
                      )),
                    ]))));
  }
}
