import 'package:flutter/material.dart';
import 'package:whatsapp_clone_project/utils/colors.dart';

PreferredSizeWidget CommonAppbar({
  required String title,
  bool? showAction,
  IconData? actionIcon,
}) {
  return AppBar(
    backgroundColor: appBarBg,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    actions: [
      showAction == true ?  IconButton(
        onPressed: null,
        icon: Icon(
          actionIcon!,
          color: Colors.white,
        ),
      ) : const SizedBox(),
    ],
  );
}
