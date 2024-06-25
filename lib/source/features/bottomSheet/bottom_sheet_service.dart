import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File?> pickAndCropImage(BuildContext context) async {
  final imagePicker = ImagePicker();
  final imageCropper = ImageCropper();
  
  // Request permission if not granted
  await Permission.storage.request();
  
  final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
  
  if (pickedImage != null) {

    // Crop the image
    CroppedFile? croppedFile = await imageCropper.cropImage(
		
      sourcePath: pickedImage.path,
	  
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
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
      return File(croppedFile.path);
    } else {
      // Handle cropping cancellation or error
      return null;
    }
  }
  
  return null;
}


