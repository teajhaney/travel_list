import 'dart:ffi';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'common_export.dart';

// ===SNACK BAR===
void showSnackBar(
    {required BuildContext context, required String content, Color? color}) {
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

//====BUTTON FILLED===
class ButtonFiled extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const ButtonFiled({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
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
        ));
  }
}
// AuthMethods().signOutUser();
//           context.goNamed(AppRoutes.signIn.name);

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

//== BORDERLESS TEXTFIELD===
class BorderlessTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final int? maxLines;
  final int? maxLengh;
  final bool autofocus;

  const BorderlessTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.hintStyle,
    this.autofocus = false,
    this.maxLines,
    this.maxLengh,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      autocorrect: true,
      maxLines: maxLines,
      maxLength: maxLengh,
      style: textStyle,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(n0),
        hintText: hintText,
        hintStyle: hintStyle,
        fillColor: Theme.of(context).colorScheme.surface,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        counterText: '',
      ),
    );
  }
}

//=== DOTTED BORDER CONTAINER===
class DottedBorderContainer extends StatelessWidget {
  final DecorationImage? decorationImage;
  final Widget? child;
  final Color? color;

  const DottedBorderContainer({
    super.key,
    this.decorationImage,
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        strokeWidth: 1,
        dashPattern: const [n30, n10],
        color: color!,
        child: Container(
          height: n200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(image: decorationImage),
          child: child,
        ));
  }
}


//=== CUSTOM CHECKBOX ===
class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Color activeColor;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.activeColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 18.0,
        height: 18.0,
        decoration: BoxDecoration(
          color: value ? activeColor : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(n5)),
          border: Border.all(
            color: activeColor,
            width: 1,
          ),
        ),
        child: value
            ? const Center(
                child: Icon(
                  Icons.check,
                  size: 12.0,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
