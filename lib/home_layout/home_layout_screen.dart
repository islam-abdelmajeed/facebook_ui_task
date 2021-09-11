import 'package:facebook_ui_task/app_cubit/cubit.dart';
import 'package:facebook_ui_task/component/component.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: AppCubit.get(context).tabBar(),
          title: Text(
            'facebook',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w900,
                fontSize: 30.0),
          ),
          actions: [
            appBarIcon(icon: Icons.search,function: (){}),
            appBarIcon(icon: MdiIcons.facebookMessenger,function: (){}),
          ],
        ),
        body: AppCubit.get(context).tabBarBody(),
      ),
    );
  }
}
