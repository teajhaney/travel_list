import 'package:flutter/material.dart';

import '../../../common/common_export.dart';

class ButtomSheetContent extends StatefulWidget {
  const ButtomSheetContent({
    super.key,
  });

  @override
  State<ButtomSheetContent> createState() => _ButtomSheetContentState();
}

class _ButtomSheetContentState extends State<ButtomSheetContent> {
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
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
