import 'package:flutter/material.dart';

import 'package:travel_list/common/common_export.dart';

import 'screen_export.dart';

class ButtomNavigationBar extends StatefulWidget {
  const ButtomNavigationBar({super.key});

  @override
  State<ButtomNavigationBar> createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> _screens = const [
    TravelListScreen(),
    ProfileScreen(),
  ];
  final Map<String, IconData> _icons = {
    '': Icons.list,
    ' ': Icons.person,
  };
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: SizedBox(
          height: n70,
          child: BottomNavigationBar(
            items: _icons
                .map((title, icon) => MapEntry(
                    title,
                    BottomNavigationBarItem(
                      icon: Icon(icon, size: n30),
                      label: title,
                    )))
                .values
                .toList(),
            fixedColor: Theme.of(context).colorScheme.primaryContainer,
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
