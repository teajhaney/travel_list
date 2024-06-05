import 'package:flutter/material.dart';

import '../../../common/common_export.dart';

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
