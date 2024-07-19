import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:story_scene/presentation/theme/app_dimen.dart';
import 'package:story_scene/presentation/theme/app_style.dart';
import 'package:story_scene/presentation/ui/stats/provider/stats_provider.dart';
import 'package:story_scene/presentation/ui/stats/screens/radius_card_with_text.dart';
import 'package:story_scene/presentation/ui/story/provider/story_provider.dart';

import '../../../common_widgets/app_bar.dart';
import '../../../theme/app_colors.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Scene",style: AppStyles().mainTitleStyle(Colors.black),),
        backgroundColor: AppColors.mainBgColor,
      ),
      body: Consumer<StatsProvider>(
        builder: (context, provider, child) {
          return LayoutBuilder(builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.symmetric(
                  vertical: AppDimen.mainVerticalPadding),
              color: AppColors.mainBgColor,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    height: 60, // Height of the horizontal ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.topList.length, // Number of cards
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            provider.selectedTopItem(provider.topList[index]);
                          },
                          child: Container(
                              width: 120,
                              padding: EdgeInsets.all(8.0),
                              child: CardCornerRadiusWithText(
                                topList: provider.topList[index],
                              )),
                        );
                      },
                    ),
                  ),
                  provider.topList.firstWhere((element) => element.isSelected==true).screen!

                ],
              ),
            );
          });
        },
      ),
    );
  }
}
