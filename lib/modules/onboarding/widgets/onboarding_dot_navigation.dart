import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:catarsis/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:catarsis/utils/constants/colors.dart';
import 'package:catarsis/utils/constants/sizes.dart';
import 'package:catarsis/utils/device/device_utility.dart';
import 'package:catarsis/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? AppColors.light : AppColors.dark,
          dotHeight: 6.0,
        ),
      ),
    );
  }
}
