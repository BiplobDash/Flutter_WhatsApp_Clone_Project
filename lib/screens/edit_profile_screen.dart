import 'package:flutter/material.dart';
import 'package:whatsapp_clone_project/utils/colors.dart';
import 'package:whatsapp_clone_project/widgets/common_appbar.dart';
import 'package:whatsapp_clone_project/widgets/edit_items.dart';

class EditProfileScreen extends StatefulWidget {
  final String userFullName;
  final String profilePicture;
  const EditProfileScreen(
      {Key? key, required this.userFullName, required this.profilePicture})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CommonAppbar(context: context, title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(widget.profilePicture),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: primary, shape: BoxShape.circle),
                    child: const Padding(
                      padding:  EdgeInsets.all(8),
                      child:  Icon(Icons.camera_alt_outlined, color: Colors.white,),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              editItemWidget(
                leadingIcon: Icons.person,
                label: 'Name',
                title: widget.userFullName,
                subtitle: 'This is my profile section',
                isEdit: true,
              ),
              editItemWidget(
                leadingIcon: Icons.info,
                label: 'About',
                title: 'Before you judge me.Make sure you are a perfect',
                isEdit: true,
              ),
              editItemWidget(
                leadingIcon: Icons.phone,
                label: 'Phone',
                title: '01708080877',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
