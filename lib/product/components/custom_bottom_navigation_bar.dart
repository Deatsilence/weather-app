// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:f_weather/product/constants/texts/text_manager.dart';
import 'package:f_weather/product/init/theme/utility/border_radius_manager.dart';
import 'package:f_weather/product/state/root_state_manager.dart';
import 'package:f_weather/product/state/theme_state_manager.dart';

/// The `CustomBottomNavigationBar` class is a custom widget that displays a bottom navigation bar with
/// icons and text.
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            color: GetThemeStateManager.themeStateManager.theme.bottomNavigationBarTheme.backgroundColor,
            borderRadius: BorderRadiusManager.commonAllBorderRadius,
          ),
          child: GNav(
            activeColor: GetThemeStateManager.themeStateManager.theme.bottomNavigationBarTheme.selectedItemColor,
            color: GetThemeStateManager.themeStateManager.theme.bottomNavigationBarTheme.unselectedItemColor,
            gap: 8,
            selectedIndex: GetRooteStateManager.rootStateManager.selectedIndexOfBottomNavigationBar,
            onTabChange: (index) {
              GetRooteStateManager.rootStateManager.setIndex(index);
            },
            tabs: const [
              GButton(
                icon: FontAwesomeIcons.house,
                text: TextManager.textHome,
              ),
              GButton(
                icon: FontAwesomeIcons.magnifyingGlass,
                text: TextManager.textSearch,
              ),
              GButton(
                icon: FontAwesomeIcons.locationCrosshairs,
                text: TextManager.textCurrent,
              ),
            ],
          ),
        );
      },
    );
  }
}
