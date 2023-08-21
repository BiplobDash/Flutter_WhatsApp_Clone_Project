import 'package:flutter/material.dart';

Widget settingsItemWidget({
  required IconData leadingIcon,
  required String title,
  required String subtitle,
}){
  return  ListTile(
    leading: Icon(leadingIcon, size: 40, color: Colors.white.withOpacity(.5),),
    title: Text(title, style: TextStyle(
        color: Colors.white,
        fontSize: 17
    ),),
    subtitle: Text(subtitle, style: TextStyle(
      color: Colors.white.withOpacity(.5),
    ),),
  );
}