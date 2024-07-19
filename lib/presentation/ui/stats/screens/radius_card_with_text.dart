import 'package:flutter/material.dart';
import 'package:story_scene/presentation/theme/app_colors.dart';
import 'package:story_scene/presentation/ui/stats/provider/stats_provider.dart';

class CardCornerRadiusWithText extends StatefulWidget {
  TopList? topList;

  CardCornerRadiusWithText({super.key, this.topList});

  @override
  State<CardCornerRadiusWithText> createState() =>
      _CardCornerRadiusWithTextState();
}

class _CardCornerRadiusWithTextState extends State<CardCornerRadiusWithText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.topList?.isSelected == true
            ? AppColors.mainButtonColor
            : AppColors.mainBgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color:widget.topList?.isSelected == true ? AppColors.mainButtonColor : AppColors.grayTextColor,width: 0.6)
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(widget.topList!.title!),
      ),

    );
  }
}
