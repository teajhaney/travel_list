import 'package:flutter/material.dart';

import 'common_export.dart';

// ===SNACK BAR===
void showSnackBar({required BuildContext context, required String content, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: color,
    ),
  );
}

//===TEXT FIELD===
class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final ValueChanged<String>? onchanged;
  final TextInputType textInputType;
  const TextFieldInput({
    super.key,
    this.onchanged,
    required this.textEditingController,
    required this.isPassword,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPassword,
      onChanged: onchanged,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: inputBorder,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(n10),
        )),
      ),
    );
  }
}

//====FILLED BUTTON===

class FillButton extends StatelessWidget {
  final bool isLoading;
  final String label;
  final VoidCallback onPressed;
  const FillButton({
    super.key,
    required this.isLoading,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: n60,
      width: MediaQuery.of(context).size.width,
      child: FilledButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(isLoading
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surface),
              foregroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).colorScheme.onPrimary,
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(n10),
                ),
              )),
          onPressed: onPressed,
          child: Text(
            label,
            style: getMediumStyle(
                fontSize: n20,
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          )),
    );
  }
}
