import 'package:catarsis/generated/app_localizations.dart';
import 'package:catarsis/modules/auth/pages/login_page.dart';
import 'package:catarsis/modules/auth/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:catarsis/modules/onboarding/onboarding.dart';

import 'package:catarsis/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home:  const OnBoardingScreen(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('es', ''), // TODO: put here status management
      // locale: const Locale('en', ''),
      routes: {
        //'/login2': (context) =>  const LoginScreen(),
        //'/register2': (context) =>   const RegisterScreen(),
        '/login': (context) =>  LoginPage(),
        '/register' : (context) =>  const RegisterPage(),
      }
    );
  }
}
