import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:story_scene/presentation/theme/app_assets.dart';
import 'package:story_scene/presentation/theme/app_colors.dart';
import 'package:story_scene/presentation/theme/app_dimen.dart';
import 'package:story_scene/presentation/theme/app_style.dart';

class CommonAppBar extends StatefulWidget {
  bool? enableSetting = false;
  bool? enableStates = false;
  bool? centerTitle = false;

  bool? backButton = false;
  bool? enableLogo = false;
  Function()? onSettingClick;
  Function()? onBackButtonClick;
  Function()? onThreeDotMenuClick;
  Function()? onStatsClick;

  CommonAppBar(
      {this.onSettingClick,
      this.enableSetting,
      this.enableLogo,
      this.backButton,
      this.onBackButtonClick,
      this.enableStates,
      this.onThreeDotMenuClick,
      this.onStatsClick,
      this.centerTitle,
      super.key});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimen.mainVerticalPadding,
          horizontal: AppDimen.mainHorizontalPadding),
      color: AppColors.mainBgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.enableLogo == true) ...[
            SvgPicture.asset(AppAssets.icAppBarLogo)
          ],
          if (widget.backButton == true) ...[
            IconButton(
                onPressed: () {
                  widget.onSettingClick!();
                },
                icon: const Icon(Icons.arrow_back_ios))
          ],
          if (widget.enableSetting == true) ...[
            IconButton(
                onPressed: () {
                  widget.onSettingClick!();
                },
                icon: const Icon(Icons.settings))
          ],
          if (widget.centerTitle == true) ...[
            Spacer(),
            Spacer(),
            Spacer(),
            Center(
                child: Text(
              "Scene",
              style: AppStyles().mainHeadingStyle(Colors.black),
            )),
            Spacer(),
          ],
          if (widget.enableStates == true) ...[
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onStatsClick!();
                  },
                  style: AppStyles().mainButtonStyle(),
                  child: Text(
                    "Stats",
                    style: AppStyles().smallDescSemiBoldStyle(Colors.white),
                  ),

                ),
                GestureDetector(
                    onTap: () {
                      widget.onThreeDotMenuClick!();
                    },
                    child: SvgPicture.asset(AppAssets.icThreeDots)),
              ],
            )
          ],
        ],
      ),
    );
  }
}
