// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../shared/data/shoe_model.dart';
import '../../../../../shared/theme/app_colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/body.dart';

class DetailScreen extends StatelessWidget {
  ShoeModel model;
  bool isComeFromMoreSection;
  DetailScreen({required this.model,required this.isComeFromMoreSection});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppConstantsColor.backgroundColor,
          appBar: customAppBarDe(
            context,
          ),
          body: DetailsBody(
            model: model,
            isComeFromMoreSection: isComeFromMoreSection,
          )),
    );
  }
}