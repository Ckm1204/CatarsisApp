import 'package:flutter/material.dart';

import 'package:catarsis/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:catarsis/utils/constants/sizes.dart';
import 'package:catarsis/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: AppSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: const Text('Salir'),
      ),
    );
  }
}
