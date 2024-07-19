import 'package:flutter/material.dart';
import 'package:story_scene/presentation/theme/app_colors.dart';
class CommonLoader extends StatefulWidget {
  BoxConstraints? constraints;
   CommonLoader({super.key,this.constraints});

  @override
  State<CommonLoader> createState() => _CommonLoaderState();
}

class _CommonLoaderState extends State<CommonLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.constraints?.maxHeight ?? null,
      color: AppColors.mainBgColor,
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.mainButtonColor,),
      ),
    );
  }
}
