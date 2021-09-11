import 'package:facebook_ui_task/app_cubit/cubit.dart';
import 'package:facebook_ui_task/component/component.dart';
import 'package:facebook_ui_task/data/data.dart';
import 'package:facebook_ui_task/models/post_model.dart';
import 'package:facebook_ui_task/models/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeMobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget buildPostItem(Post model, context, index) => Card(
          elevation: 5.0,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('${model.user.imageUrl}'),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${model.user.name}',
                            style: TextStyle(
                              height: height * 0.003,
                            ),
                          ),
                          Text(
                            '${model.timeAgo}',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  height: height * 0.002,
                                ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.more_horiz,
                          size: 19,
                        ),
                        onPressed: () {}),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  '${model.caption}',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontSize: 14,
                        height: height * 0.002,
                      ),
                ),
                if (model.imageUrl != null)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 15.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: NetworkImage('${model.imageUrl}'),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Icon(
                                  cubit.isLike
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                Text(
                                  '${model.likes}',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${model.comments} comments ',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Text(
                                  ' ${model.shares} shares',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(width: width*0.01,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    homeMoreOptions(
                      text: 'Like',
                      icon:
                          cubit.isLike ? Icons.favorite : Icons.favorite_border,
                      onTap: () {
                        cubit.changeLike();
                      },
                      color:cubit.isLike? Colors.red:Colors.grey,
                      width: width * 0.01,
                    ),
                    homeMoreOptions(
                      text: 'Comment',
                      icon: MdiIcons.commentOutline,
                      onTap: () {},
                      color: Colors.grey,
                      width: width * 0.01,
                    ),
                    homeMoreOptions(
                      text: 'Share',
                      icon: MdiIcons.share,
                      onTap: () {},
                      color: Colors.grey,
                      width: width * 0.01,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    Widget buildStoryItem(Story model, context, index) => Card(
          margin: EdgeInsets.all(5.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Stack(
            children: [
              Container(
                width: width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage('${model.imageUrl}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                  radius: model.isViewed ? 25.0 : 30.0,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage('${model.user.imageUrl}'),
                  ),
                ),
              ),
              Positioned(
                bottom: height * 0.02,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${model.user.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(currentUser.imageUrl),
                          radius: 25.0,
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30.0),
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                  30.0,
                                ),
                              ),
                              child: Text('What\'s on your mind?'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      homeMoreOptions(
                          text: 'Live',
                          onTap: () {},
                          icon: MdiIcons.video,
                          color: Colors.red,
                          width: width * 0.01),
                      myDivider(height: height * 0.05),
                      homeMoreOptions(
                        text: 'Photo',
                        icon: Icons.photo,
                        onTap: () {},
                        color: Colors.green,
                        width: width * 0.01,
                      ),
                      myDivider(height: height * 0.05),
                      homeMoreOptions(
                        text: 'Room',
                        onTap: () {},
                        icon: MdiIcons.videoPlus,
                        color: Colors.purple,
                        width: width * 0.01,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height * 0.38,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            buildStoryItem(stories[index], context, index),
                        separatorBuilder: (context, index) => SizedBox(
                          height: height * 0.001,
                        ),
                        itemCount: stories.length,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildPostItem(posts[index], context, index),
                  separatorBuilder: (context, index) => SizedBox(
                    height: height * 0.001,
                  ),
                  itemCount: posts.length,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
