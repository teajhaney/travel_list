import 'package:flutter/material.dart';

import 'package:travel_list/common/app_colors.dart';

import '/screen/screen_export.dart';

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
  final Map<String, IconData> _icons = const {
    '': Icons.shopping_bag_outlined,
    ' ': Icons.explore_outlined,
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
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: SizedBox(
              height: 70,
              child: BottomNavigationBar(
                  items: _icons
                      .map((title, icon) => MapEntry(
                          title,
                          BottomNavigationBarItem(
                            icon: Icon(icon, size: 30),
                            label: title,
                          )))
                      .values
                      .toList(),
                  currentIndex: _currentIndex,
                  selectedItemColor: AppColors.seedColor,
                  selectedFontSize: 11,
                  unselectedFontSize: 11,
                  unselectedItemColor: AppColors.greyColor,
                  onTap: (index) => setState(() => _currentIndex = index)),
            ),
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
