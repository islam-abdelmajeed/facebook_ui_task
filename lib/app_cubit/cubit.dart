import 'package:facebook_ui_task/app_cubit/states.dart';
import 'package:facebook_ui_task/modules/home/home_screen.dart';
import 'package:facebook_ui_task/modules/web/web_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  Widget tabBar() => TabBar(
        indicatorColor: Colors.indigo,
        tabs: [
          Tab(
            icon: Icon(
              MdiIcons.home,
            ),
          ),
          Tab(
            icon: Icon(
              MdiIcons.accountCircle,
            ),
          ),
          Tab(
            icon: Icon(
              MdiIcons.playBoxOutline,
            ),
          ),
          Tab(
            icon: Icon(
              MdiIcons.bell,
            ),
          ),
          Tab(
            icon: Icon(
              MdiIcons.menu,
            ),
          ),
        ],
      );

  Widget tabBarBody() => TabBarView(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if(constraints.minWidth > 800)
                return HomeWebScreen();

              return HomeMobileScreen();
            },
          ),
          Icon(
            MdiIcons.accountCircle,
          ),
          Icon(
            MdiIcons.playBox,
          ),
          Icon(
            MdiIcons.bell,
          ),
          Icon(
            MdiIcons.menu,
          ),
        ],
      );

  bool isLike = false;

  void changeLike() {
    isLike = !isLike;
    emit(ChangeLikeAppState());
  }
}
