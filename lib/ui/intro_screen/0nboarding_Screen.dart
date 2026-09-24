

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'package:islami_c20/model/onboarding_model.dart';

import 'package:islami_c20/ui/intro_screen/widget/dots.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int indexsel = 0;
  static const onboardingCompletedKey = 'completed';

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int index = _pageController.page?.toInt() ?? 0;
      if (index != indexsel) {
        setState(() {
          indexsel = index;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

Future<void> completeOnboarding() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setBool(onboardingCompletedKey, true);

  if (!mounted) return;
  Navigator.pushReplacementNamed(context, RoutesManager.homeRouteName);
}

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsManager.header, height: screenWidth.height * .2),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnboardingModel.item.length,
                itemBuilder: (context, index) {
                  final itemm = OnboardingModel.item[index];
                  return Column(
                    spacing: screenWidth.height * .02,
                    children: [
                      Image.asset(
                        itemm.image,
                        height: screenWidth.height * .45,
                      ),

                      Text(
                        itemm.title,
                        style: TextStyle(
                          color: ColorsManager.goldColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (itemm.description != null)
                        Text(
                          OnboardingModel.item[index].description ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsManager.goldColor,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: indexsel > 0
                      ? () {
                          _pageController.animateToPage(
                            indexsel - 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                          );
                        }
                      : null,

                  child: Text(
                    indexsel != 0 ? "Beak" : '',
                    style: TextStyle(
                      color: ColorsManager.goldColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Spacer(),
                ...List.generate(OnboardingModel.item.length, (index) {
                  return Dots(active: indexsel == index);
                }),

                Spacer(),
                TextButton(
                  onPressed: () {
                    if (indexsel == OnboardingModel.item.length - 1) {
                      completeOnboarding();
                    } else {
                      _pageController.animateToPage(
                        indexsel + 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                      );
                    }
                  },
                  child: Text(
                    indexsel != OnboardingModel.item.length - 1 ? "Next" : "Finish",
                    style: TextStyle(
                      color: ColorsManager.goldColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}