import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/common_export.dart';

class ButtomSheetContent extends StatefulWidget {
  const ButtomSheetContent({
    super.key,
  });

  @override
  State<ButtomSheetContent> createState() => _ButtomSheetContentState();
}

class _ButtomSheetContentState extends State<ButtomSheetContent> {
  ImageProvider? backgroundImage;
  bool showIconButton = true;
  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  Future<void> requestStoragePermission() async {
    await Permission.storage.request();
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        backgroundImage = FileImage(File(pickedImage.path));
        showIconButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          n10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                ),
                IconButton(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                )
              ],
            ),
            const Gap(n10),
            DottedBorder(
                strokeWidth: 1,
                dashPattern: const [n30, n10],
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Container(
                  height: n200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: backgroundImage != null
                        ? DecorationImage(
                            image: backgroundImage!,
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: showIconButton
                      ? Center(
                          child: IconButton(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          onPressed: pickImage,
                          icon: const Icon(Icons.add),
                        ))
                      : null,
                )),
          ],
        ),
      ),
    );
  }
}
