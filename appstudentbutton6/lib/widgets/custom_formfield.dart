import 'package:flutter/material.dart';
import 'package:appstudentbutton6/styles/app_colors.dart';
import 'package:appstudentbutton6/styles/text_styles.dart';

ScrollController _scrollController = ScrollController();

class CustomFormField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;

  const CustomFormField(
      {Key? key,
      required this.headingText,
      required this.hintText,
      required this.obsecureText,
      required this.suffixIcon,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      required this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.04,
          margin: const EdgeInsets.only(left: 20, right: 20),
          constraints: const BoxConstraints(maxHeight: 300, maxWidth: 200),
          child: Text(
            headingText,
            style: KTextStyle.textFieldHeading,
          ),
        ),
        SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  constraints:
                      const BoxConstraints(maxHeight: 50, maxWidth: 400),
                  decoration: BoxDecoration(
                    color: AppColors.grayshade,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      maxLines: maxLines,
                      controller: controller,
                      textInputAction: textInputAction,
                      keyboardType: textInputType,
                      obscureText: obsecureText,
                      decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: KTextStyle.textFieldHintStyle,
                          border: InputBorder.none,
                          suffixIcon: suffixIcon),
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
