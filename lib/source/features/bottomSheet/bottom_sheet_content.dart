import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController itemController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  ImageProvider? backgroundImage;

  bool isChecked = false;

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
    final imageCropper = ImageCropper();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      if (!mounted) return;
      // Crop the image
      CroppedFile? croppedFile = await imageCropper.cropImage(
        sourcePath: pickedImage.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
          // You can add other aspect ratio presets (e.g., CropAspectRatioPreset.ratio16x9)
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Theme.of(context).colorScheme.primaryContainer,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Crop Image',
          )
        ],
      );
      if (croppedFile != null) {
        setState(() {
          backgroundImage = FileImage(File(croppedFile.path));
          showIconButton = false;
        });
      } else {
        if (croppedFile == null) return;
        // Handle cropping cancellation or error
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            onPressed: pickImage,
                            icon: const Icon(Icons.add),
                          ))
                        : null,
                  ),
                  const Gap(n10),
                  BorderlessTextField(
                    controller: titleController,
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
                    controller: descriptionController,
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
                    itemCount: 50,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          CustomCheckbox(
                            value: isChecked,
                            activeColor: Theme.of(context).colorScheme.primary,
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue;
                              });
                            },
                          ),
                          const Gap(n10),
                          Expanded(
                            child: BorderlessTextField(
                              controller: itemController,
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
                          const Gap(n20),
                        ],
                      );
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
