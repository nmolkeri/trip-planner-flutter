import 'package:flutter/material.dart';
import 'package:trip_finder/misc/colors.dart';
import 'package:trip_finder/widgets/app_large_text.dart';
import 'package:trip_finder/widgets/app_text.dart';
import 'package:trip_finder/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png"
  ];
  List headers = [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/"+images[index]
              ),
              fit: BoxFit.fill
            )
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trip"),
                      AppText(text: "Mountain", size: 30),
                      const SizedBox(height: 20),
                      Container(width: 250,
                        child: AppText(
                          size: 14,
                          color: AppColors.textColor2,
                          text: "Mountain hikes give you an incredible sense of freedom along with endurance tests")
                      ),
                      const SizedBox(height: 20),
                      ResponsiveButton(width: 100,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(3, (indexSlider) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexSlider ? 25 : 10,
                        decoration: BoxDecoration(
                          color: index == indexSlider ? AppColors.mainColor : AppColors.textColor1,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      );
                    }),
                  )
              ],
            ),
          )
        );
      }),
    );
  }
}