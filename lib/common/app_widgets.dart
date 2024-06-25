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
  final Function(String)? onSubmitted;

  final bool autofocus;

//   final Function(String)? onChanged;

  const BorderlessTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.hintStyle,
    this.textStyle,
    this.autofocus = false,  this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollController: ScrollController(),
      controller: controller,
      autofocus: autofocus,
      autocorrect: true,
      maxLines: null,
      scrollPhysics: const AlwaysScrollableScrollPhysics(),
      style: textStyle,
	  textInputAction: TextInputAction.done,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
	  onSubmitted: onSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(
            n0, n0, n0, n10), // Remove the default padding
        isDense: true, //
        hintText: hintText,
        hintStyle: hintStyle,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
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
        width: n20,
        height: n20,
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
