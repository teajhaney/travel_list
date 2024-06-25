import 'dart:io';

import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:travel_list/common/common_export.dart';
import 'package:travel_list/source/features/bottomSheet/bottom_sheet_export.dart';

import '../../features_export.dart';

class TravelListScreen extends StatefulWidget {
  const TravelListScreen({super.key});

  @override
  State<TravelListScreen> createState() => _TravelListScreenState();
}

class _TravelListScreenState extends State<TravelListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: n150,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    textColor: Theme.of(context).colorScheme.primaryContainer,
                    title: const Text(location),
                    subtitle: const Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text('Exact location'),
                      ],
                    ),
                    trailing: const CircleAvatar(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: n10),
                    child: SearchTextField(),
                  )
                ],
              ),
            ),
            const TravelListContent()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Platform.isAndroid
                ? showMaterialModalBottomSheet(
                    enableDrag: false,
                    expand: true,
                    context: context,
                    builder: (context) => const BottomSheetContent(),
                  )
                : showCupertinoModalBottomSheet(
                    enableDrag: false,
                    expand: true,
                    context: context,
                    builder: (context) => const BottomSheetContent(),
                  );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
