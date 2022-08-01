import 'package:flutter/material.dart';
import 'package:appstudentbutton6/styles/app_colors.dart';
import 'package:appstudentbutton6/styles/text_styles.dart';

class CustomHeaderHome extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const CustomHeaderHome({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35, left: 270),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: KTextStyle.headerTextStyleHome,
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.person,
              color: AppColors.whiteshade,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
