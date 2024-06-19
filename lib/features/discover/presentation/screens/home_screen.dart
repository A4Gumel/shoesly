import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBar(),
        body: const DashboardBody(),
      ),
    );
  }
}