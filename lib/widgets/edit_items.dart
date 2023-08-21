import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget editItemWidget(
{
  required IconData leadingIcon,
  required String label,
  required String title,
  String? subtitle,
  bool? isEdit,
}
    ){
  return  ListTile(
    leading: Icon(leadingIcon, color: Colors.white.withOpacity(.5),),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(
          color: Colors.white.withOpacity(.5),
          fontSize: 12,
        ),),
        Text(title, style: const TextStyle(
          color: Colors.white,
        ),),
      ],
    ),
    subtitle: subtitle == null ? const SizedBox() : Text(subtitle!, style: TextStyle(
      color: Colors.white.withOpacity(.5),
      fontSize: 12,
    ),),
    trailing: isEdit == true ? const Icon(Icons.edit,color: primary,) : const SizedBox()
  );
}