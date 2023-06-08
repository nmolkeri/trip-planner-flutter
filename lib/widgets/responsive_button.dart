import 'package:flutter/material.dart';
import 'package:trip_finder/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final String text;
  bool? isResponsive;
  double? width;


  ResponsiveButton({super.key,
  this.text = "",
  this.isResponsive = false,
  this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset("img/button-one.png")
      ]),
      ),
    );
  }
}