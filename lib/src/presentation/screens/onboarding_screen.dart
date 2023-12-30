import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../widget/custom_botton.dart';
import '../widget/onboarding_item.dart';
import 'chat_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController controller;
  int index = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(AppIcons.gptLogo),
                height: 50,
              ),
              SizedBox(height: size.height * 0.025),
              Text(
                "Welcome to\nChatGPT",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Raleway",
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.030),
              Text(
                "Asik anything, get yout answer",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: size.height * 0.040),
              SizedBox(
                height: size.height * 0.470,
                child: PageView(
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  children: const [
                    CustomOnboardingItem(
                      icons: AppIcons.sunIcon,
                      titleText: "Examples",
                      cardText1: "Explain quantum computing\nsimple terms",
                      cardText2:
                          "Got any creative ideas for a 10 year old's brithday",
                      cardText3:
                          "How do I make an HTTP request\nin Javascript?",
                    ),
                    CustomOnboardingItem(
                      icons: AppIcons.chaqmoqIcon,
                      titleText: "Capabilities",
                      cardText1:
                          "Remembers what user said earlier\nin the conversation",
                      cardText2:
                          "Allows user to provide follow-up\ncorrections",
                      cardText3: "Trained to decline inappropriate\nrequest",
                    ),
                    CustomOnboardingItem(
                      icons: AppIcons.zoneIcon,
                      titleText: "Limitations",
                      cardText1:
                          "May occasionally generate\nincorrect information",
                      cardText2:
                          "May accosionally produce hamful\ninstructions or biased content",
                      cardText3:
                          "Limited knowledge of world and\nevents after 2021",
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                effect: const ExpandingDotsEffect(
                  dotWidth: 13,
                  activeDotColor: AppColors.buttonColor,
                  dotHeight: 4,
                ),
                count: 3,
              ),
              SizedBox(height: size.height * 0.030),
              CustomBottom(
                onPressed: () => index == 2 ? navigatorPages() : nextFunction(),
                bottomText: index == 2 ? "Let's to chat  >" : "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextFunction() {
    controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void navigatorPages() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChatScreen(),
      ),
    );
  }
}
