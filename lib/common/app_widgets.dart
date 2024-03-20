import 'package:flutter/material.dart';

import 'common_export.dart';

// ===SNACK BAR===
void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

//===TEXT FIELD===
class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;

  final TextInputType textInputType;
  const TextFieldInput({
    super.key,
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
      keyboardType: textInputType,
      obscureText: isPassword,
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
  final bool isLoadind;
  final String label;
  final VoidCallback onPressed;
  const FillButton({
    super.key,
    required this.isLoadind,
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
              backgroundColor: MaterialStateProperty.all(isLoadind
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.background),
              foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.onPrimary,
              ),
              shape: MaterialStateProperty.all(
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
