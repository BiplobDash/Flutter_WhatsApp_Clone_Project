import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;

  void uploadImage(ImageSource source) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    setState(() {
      _imageFile = File(pickedImage!.path);
    });
  }

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
                  _imageFile == null ? CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(widget.profilePicture),
                  ):  CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(_imageFile!),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => Container(
                          decoration: const BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              )),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          uploadImage(ImageSource.camera);
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: primary,
                                                  width: 1.5,
                                                ),
                                                shape: BoxShape.circle,
                                                color: primary.withOpacity(.5),
                                              ),
                                              child: const Padding(
                                                padding:
                                                     EdgeInsets.all(15),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.camera_alt_outlined,
                                                    size: 35,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Camera',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          uploadImage(ImageSource.gallery);
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: primary,
                                                  width: 1.5,
                                                ),
                                                shape: BoxShape.circle,
                                                color: primary.withOpacity(.5),
                                              ),
                                              child: const Padding(
                                                padding:
                                                     EdgeInsets.all(15),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.image,
                                                    size: 35,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Gallery',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: primary, shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
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
