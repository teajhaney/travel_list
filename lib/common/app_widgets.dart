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

// SEARCH FIELD BUTTON
class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // Update the UI when the focus state changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Theme.of(context).colorScheme.shadow),
      focusNode: _focusNode,
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.onPrimary,
        focusColor: Theme.of(context).colorScheme.surface,
        hintText: 'Search trips',
        hintStyle:
            TextStyle(color: Theme.of(context).colorScheme.primaryContainer),
        suffixIcon:
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        suffixIconColor: Theme.of(context).colorScheme.primaryContainer,
        prefixIcon:
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        prefixIconColor: Theme.of(context).colorScheme.primaryContainer,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(n65)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(n65)),
        ),
      ),
    );
  }
}
