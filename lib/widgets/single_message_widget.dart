

import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget singleMessageWidget({
  required BuildContext context,
  required Map<dynamic, dynamic> data,
  bool? isMe,
}){
  final size = MediaQuery.sizeOf(context);
  return Column(
    crossAxisAlignment: isMe == true ? CrossAxisAlignment.start : CrossAxisAlignment.end,
    children: [
      Column(
        crossAxisAlignment: isMe == true ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * .7,
              ),
              decoration: BoxDecoration(
                color: isMe == true ? appBarBg : primary.withOpacity(.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 10),
                child: Text(data['message'], style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),),
              ),
            ),
          ),
          Text(data['time'], style: TextStyle(
            color: Colors.white,
          ),)
        ],
      )
    ],
  );
}