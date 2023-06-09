import 'package:flutter/material.dart';
import 'package:trip_finder/misc/colors.dart';
import 'package:trip_finder/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final String text;
  bool isResponsive;
  double? width;


  ResponsiveButton({super.key,
  this.text = "",
  this.isResponsive = false,
  this.width = 120});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Flexible(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor 
          ),
          child: Row(
            mainAxisAlignment: isResponsive ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              isResponsive ? 
              Container(margin: const EdgeInsets.only(left: 20), child: AppText(text: "Book trip now", color: Colors.white,)) 
              : Container(),
              Image.asset("img/button-one.png")
          ]),
        ),
      ),
    );
  }
}