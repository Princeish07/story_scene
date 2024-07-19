import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:story_scene/core/other/general_utils.dart';
import 'package:story_scene/core/shared_pref/shared_preference.dart';
import 'package:story_scene/presentation/common_widgets/common_error_screen.dart';
import 'package:story_scene/presentation/common_widgets/common_loader.dart';
import 'package:story_scene/presentation/theme/app_assets.dart';
import 'package:story_scene/presentation/ui/login/screen/login_screen.dart';
import 'package:story_scene/presentation/ui/story/provider/story_provider.dart';
import 'package:story_scene/presentation/ui/story/screens/story_list_item.dart';

import '../../../../core/other/resource.dart';
import '../../../common_widgets/app_bar.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_dimen.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<StoryProvider>(context, listen: false).fetchStory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            color: AppColors.mainBgColor,
            child: Column(
              children: [
                const SizedBox(height: 15),
                CommonAppBar(
                  enableLogo: true,
                  enableSetting: true,
                  onSettingClick: () async {
                    await PreferenceUtils.clearPref();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    // showToast("Setting Clicked");
                  },
                ),
                if (provider.storyResponse?.status == Status.LOADING) ...[
                  //Common Loader
                  Expanded(
                    child: CommonLoader(
                      constraints: constraints,
                    ),
                  )
                ] else if (provider.storyResponse?.status ==
                    Status.FAILURE) ...[
                  //Error UI
                  Expanded(
                    child: ErrorScreen(
                      message: provider.storyResponse?.message,
                      constraints: constraints,
                    ),
                  )
                ] else ...[
                  //Main UI
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: provider.storyList!,
                    ),
                  )
                ]
              ],
            ),
          );
        }),
      );
    });
  }
}
