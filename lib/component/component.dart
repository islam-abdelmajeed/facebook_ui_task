import 'package:flutter/material.dart';

Widget appBarIcon({
  @required IconData icon,
  @required Function function,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: IconButton(
            icon: Icon(
              icon,
              color: Colors.black,
            ),
            onPressed:function,
          ),
        ),
      ),
    );

Widget homeMoreOptions({
  @required String text,
  @required IconData icon,
  @required Function onTap,
  @required Color color,
  @required double width,
})=>InkWell(
  onTap: onTap,
  child: Container(
    child: Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          width: width,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  ),
);

Widget myDivider({
  @required height,
})=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    height: height,
    width: 1.0,
    color: Colors.grey,
  ),
);

Widget divider()=>Padding(
  padding: const EdgeInsets.only(bottom: 10.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
