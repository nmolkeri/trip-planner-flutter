import 'package:flutter/material.dart';
import 'package:trip_finder/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String? text;
  final Color? backgroundColor;
  bool showBorder;
  final Color borderColor;
  final Color textColor;
  double size;
  IconData? icon;
  bool isIcon;

  AppButton({
    super.key, 
    this.text,
    this.isIcon = false,
    required this.size,
    this.backgroundColor,
    this.showBorder = false,
    this.borderColor = Colors.black,
    this.textColor = Colors.black,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: size,
              height: size,
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: showBorder ? borderColor : Colors.transparent, 
                width: showBorder ? 1.0 : 0),
                color: backgroundColor,
              ),
              child: isIcon ? Center(child: Icon(icon, color: textColor)) 
                : Center(child: AppText(text: text!, color: textColor)),
            );
  }
}