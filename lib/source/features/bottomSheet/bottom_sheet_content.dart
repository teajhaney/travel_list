import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:permission_handler/permission_handler.dart';

import '../../../common/common_export.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bottomSheet/bottom_sheet_export.dart';

class BottomSheetContent extends ConsumerStatefulWidget {
  const BottomSheetContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomSheetContentState();
}

class _BottomSheetContentState extends ConsumerState<BottomSheetContent> {
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();
  final TextEditingController itemTextController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  ImageProvider? backgroundImage;

  bool isChecked = false;

  bool showIconButton = true;
  bool _isEditing = true; // Condition to toggle between TextField and Text

  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  Future<void> requestStoragePermission() async {
    await Permission.storage.request();
  }

  Future<void> _pickImage() async {
    File? pickedFile = await pickAndCropImage(context);
    if (pickedFile != null) {
      setState(() {
        backgroundImage = FileImage(pickedFile);
        showIconButton = false;
      });
    }
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
      //   if (_isEditing) {
      //     itemTextController.text = ref.read(textProvider);
      //   }
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleTextController.dispose();
    descriptionTextController.dispose();
    itemTextController.dispose();

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final String savedText = ref.watch(textProvider);
    final List<ListItem> items = ref.watch(itemProvider);
    return Form(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(
              n10,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline),
                      ),
                      Text(
                        addList,
                        style: getBoldStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                      IconButton(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      )
                    ],
                  ),
                  const Gap(n10),
                  DottedBorderContainer(
                    decorationImage: backgroundImage != null
                        ? DecorationImage(
                            image: backgroundImage!,
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: showIconButton
                        ? Center(
                            child: IconButton(
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withOpacity(0.5),
                            onPressed: _pickImage,
                            icon: const Icon(Icons.add),
                          ))
                        : null,
                  ),
                  const Gap(n10),
                  BorderlessTextField(
                    controller: titleTextController,
                    autofocus: true,
                    hintText: listTitle,
                    hintStyle: getRegularStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                      fontSize: 30,
                    ),
                    textStyle: getRegularStyle(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontSize: 30,
                    ),
                  ),
                  const Gap(n20),
                  BorderlessTextField(
                    controller: descriptionTextController,
                    hintText: addDescription,
                    hintStyle: getRegularStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                      fontSize: 20,
                    ),
                    textStyle: getRegularStyle(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontSize: 20,
                    ),
                  ),
                  const Gap(n20),
                  ListView.builder(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length + 1,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < items.length) {
                        final item = items[index];
                        return Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              CustomCheckbox(
                                value: item.isChecked,
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                onChanged: (newValue) {
                                  setState(() {
                                    isChecked = newValue;
                                  });
                                },
                              ),
                              const Gap(n10),
                              _isEditing
                                  ? Expanded(
                                      child: BorderlessTextField(
                                        onSubmitted: (value) {
                                          ref
                                              .read(textProvider.notifier)
                                              .saveText(
                                                  itemTextController.text);
                                          ref
                                              .read(itemProvider.notifier)
                                              .addItem(itemTextController.text);

                                          setState(() {
                                            _isEditing = false;
                                          });
                                        },
                                        controller: itemTextController,
                                        autofocus: true,
                                        hintText: addItem,
                                        hintStyle: getRegularStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.3),
                                          fontSize: n20,
                                        ),
                                        textStyle: getRegularStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          fontSize: n20,
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: _toggleEditing,
                                      child: Text(
                                        item.text,
                                        style: getRegularStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          fontSize: n20,
                                        ),
                                      ),
                                    ),
                            ]);
                      } else {
                        return Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            CustomCheckbox(
                              value: false,
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              onChanged: (newValue) {},
                            ),
                            const Gap(n10),
                            Expanded(
                              child: BorderlessTextField(
                                onSubmitted: (value) {
                                  ref
                                      .read(itemProvider.notifier)
                                      .addItem(itemTextController.text);
                                },
                                controller: itemTextController,
                                autofocus: true,
                                hintText: addItem,
                                hintStyle: getRegularStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.3),
                                  fontSize: 20,
                                ),
                                textStyle: getRegularStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
