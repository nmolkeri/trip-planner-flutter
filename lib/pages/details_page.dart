import 'package:flutter/material.dart';
import 'package:trip_finder/misc/colors.dart';
import 'package:trip_finder/widgets/app_button.dart';
import 'package:trip_finder/widgets/app_large_text.dart';
import 'package:trip_finder/widgets/app_text.dart';
import 'package:trip_finder/widgets/responsive_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/mountain.jpeg"),
                    fit: BoxFit.cover 
                  )
                ),
                )
              ),
              Positioned(
              top: 70,
              left: 20,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, 
                  icon: Icon(Icons.menu),
                  color: Colors.white,)
                ],
              )
            ),
            Positioned(
              top: 270,
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: "Yosemite"),
                          AppLargeText(text: "\$250", color: AppColors.textColor1)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                          size: 16,
                          color: AppColors.mainColor),
                          AppText(text: "California, USA", size: 16, color: AppColors.mainColor)
                        ],
                      ),
                      Row(
                        children: [
                          AppText(text: "⭐ ⭐ ⭐ ⭐ ⭐"),
                          AppText(text: "(5.0)")
                        ],
                      ),
                    SizedBox(height: 20),
                    //People header
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: "People", size: 24),
                        ],
                      ),
                    SizedBox(height: 5,),
                    AppText(text: "Number of people in your group", size: 12, color: Colors.black54),
                    SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 4),
                            child: AppButton(
                              text: (index+1).toString(), 
                              size: 50, 
                              backgroundColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                              textColor: selectedIndex == index ? Colors.white : Colors.black54
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 10),
                    AppLargeText(text: "Description", color: Colors.black.withOpacity(0.8), size: 24,),
                    AppText(text: "You must go for travel. Travelling helps get rid of pressure. Go to the mountains to see the nature", color: AppColors.mainTextColor)
                  ],
                ),
            )),
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Row(
                children: [
                AppButton(size: 60, 
                  isIcon: true, 
                  icon: Icons.favorite_border, 
                  textColor: AppColors.textColor2,
                  showBorder: true,
                  backgroundColor: AppColors.buttonBackground),
                ResponsiveButton(isResponsive: true)
              ],
            ))
          ],
        ),
      ),
    );
  }
}