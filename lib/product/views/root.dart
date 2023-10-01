import 'package:f_weather/product/components/custom_bottom_navigation_bar.dart';
import 'package:f_weather/product/constants/path_of_assets/lottie_url.dart';
import 'package:f_weather/product/extensions/padding_extension.dart';
import 'package:f_weather/product/init/navigator/navigator_routes.dart';
import 'package:f_weather/product/init/theme/utility/padding_manager.dart';
import 'package:f_weather/product/state/root_state_manager.dart';
import 'package:f_weather/product/state/theme_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        scrolledUnderElevation: 0.0,
        actions: [
          SizedBox(
            width: 90,
            height: 80,
            child: _ChangeThemeToggleButton(animationController: _animationController),
          ).onlyPadding(right: PaddingManager.commonHorizontal),
        ],
      ),
      body: Observer(
        name: "Center",
        builder: (_) {
          return Center(
            child: NavigatorRoutes()
                .navPages
                .elementAt(GetRooteStateManager.rootStateManager.selectedIndexOfBottomNavigationBar),
          ).symmetricpadding(
            horizontal: PaddingManager.commonHorizontal,
            vertical: PaddingManager.commonVertical,
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
              // themeState: GetThemeStateManager().themeStateManager,
              )
          .onlyPadding(
        left: PaddingManager.horizontalOfBottomNavigationBar,
        right: PaddingManager.horizontalOfBottomNavigationBar,
        bottom: PaddingManager.onlyBottomOfBottomNavigationBar,
        top: PaddingManager.onlyTopOfBottomNavigationBar,
      ),
    );
  }
}

class _ChangeThemeToggleButton extends StatelessWidget {
  const _ChangeThemeToggleButton({
    required AnimationController animationController,
  }) : _animationController = animationController;

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GetThemeStateManager.themeStateManager.changeThemeData();
        GetThemeStateManager.themeStateManager.isNight
            ? _animationController.animateTo(0.5)
            : _animationController.animateTo(-0.5);
      },
      child: Lottie.asset(
        LottieUrls.pathOfToggleThemeButton,
        fit: BoxFit.cover,
        controller: _animationController,
        onLoaded: (_) {
          _animationController.animateTo(0.5);
        },
      ),
    );
  }
}
