import 'package:flutter/material.dart';
import 'package:story_scene/presentation/theme/app_colors.dart';
class ErrorScreen extends StatefulWidget {
  String? message;
  BoxConstraints? constraints;

  ErrorScreen({super.key,this.message,this.constraints});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.constraints?.maxHeight,
      color: AppColors.mainBgColor,
      child: Center(
        child: Text("Opps! ${widget.message}"),
      ),
    );
  }
}
