import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:catarsis/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:catarsis/utils/constants/colors.dart';
import 'package:catarsis/utils/helpers/helper_functions.dart';
import 'package:catarsis/utils/constants/sizes.dart';
import 'package:catarsis/utils/device/device_utility.dart';

class OnBoardingElevatedButton extends StatelessWidget {
  const OnBoardingElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);

    return Positioned(
      right: AppSizes.defaultSpace,
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => controller.nextPage(context),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? AppColors.primary : AppColors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
