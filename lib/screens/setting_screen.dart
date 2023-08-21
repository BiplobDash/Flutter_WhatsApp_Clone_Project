import 'package:flutter/material.dart';
import 'package:whatsapp_clone_project/screens/edit_profile_screen.dart';
import 'package:whatsapp_clone_project/utils/colors.dart';
import 'package:whatsapp_clone_project/widgets/common_appbar.dart';
import 'package:whatsapp_clone_project/widgets/settings_item.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CommonAppbar(
        context: context,
        title: "Setting",
        showAction: true,
        actionIcon: Icons.search,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(
                            userFullName: "Biplob Dash",
                            profilePicture: 'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=740&t=st=1692595572~exp=1692596172~hmac=96c421fb12aa83a34e82100adda8b0c604b8d3576f1fd2ecbc5926849347d3bd',
                          )));
            },
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=740&t=st=1692595572~exp=1692596172~hmac=96c421fb12aa83a34e82100adda8b0c604b8d3576f1fd2ecbc5926849347d3bd'),
            ),
            title: const Text(
              'Biplob Dash',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Before you judge me make sure you are a perfect',
              style: TextStyle(
                color: Colors.white.withOpacity(.5),
              ),
            ),
            trailing: const Icon(
              Icons.qr_code,
              color: primary,
            ),
          ),
          Divider(
            color: Colors.white.withOpacity(.1),
          ),
          settingsItemWidget(
              leadingIcon: Icons.key,
              title: "Privacy",
              subtitle: "Your privacy setting"),
          settingsItemWidget(
              leadingIcon: Icons.settings,
              title: "Account",
              subtitle: "My account setting"),
          settingsItemWidget(
              leadingIcon: Icons.emoji_emotions,
              title: "Avatar",
              subtitle: "My Avatar setting"),
          settingsItemWidget(
              leadingIcon: Icons.sd_storage_outlined,
              title: "Storage",
              subtitle: "Storage setting"),
        ],
      ),
    );
  }
}
