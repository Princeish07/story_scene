import 'package:flutter/material.dart';
import 'package:story_scene/presentation/theme/app_dimen.dart';
import 'package:story_scene/presentation/theme/app_style.dart';

import '../../../theme/app_colors.dart';

class CardWithNumber extends StatefulWidget {
  String? number;
  String? type;

  CardWithNumber({super.key, required this.number, required this.type});

  @override
  State<CardWithNumber> createState() => _CardWithNumberState();
}

class _CardWithNumberState extends State<CardWithNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(AppDimen.cardCornerRadius)),
        color: AppColors.smallCardBgColor,
      ),
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Text(
              widget.number!,
              style: AppStyles().mainTitleStyle(AppColors.mainButtonColor),
            ),
            Text(
              widget.type!,
              style: AppStyles().smallSemiBoldStyle(Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
