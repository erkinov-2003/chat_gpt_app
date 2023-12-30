import "package:flutter/material.dart";
import "package:open_ai_app/src/presentation/screens/onboarding_screen.dart";
import "package:provider/provider.dart";

import "../src/controller/main_controller.dart";


class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      builder: (context, child) =>  MaterialApp(
        title: "Chat GPT",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const OnboardingScreen(),
      ),
    );
  }
}