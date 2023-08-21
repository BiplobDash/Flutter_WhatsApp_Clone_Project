import 'package:flutter/material.dart';
import 'package:whatsapp_clone_project/screens/setting_screen.dart';
import 'package:whatsapp_clone_project/utils/colors.dart';
import 'package:whatsapp_clone_project/utils/strings.dart';

import 'chat_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> usersList = [
    {
      'name': 'Maktab',
      'profile_picture':
          'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=740&t=st=1692604164~exp=1692604764~hmac=6287312498941fb2c8ffad2801ed915610a6765d76fa343e4e7dafd5a3014550',
      'time': '9:34 PM',
      'last_msg': 'Hello, how are you?',
      'isRead': true,
      'count': '4',
      'status': 0,
      'type': 'audio',
      'number': '017090909098'
    },
    {
      'name': 'Azizul Hakim',
      'profile_picture':
      'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=740&t=st=1692595572~exp=1692596172~hmac=96c421fb12aa83a34e82100adda8b0c604b8d3576f1fd2ecbc5926849347d3bd',
      'time': '7:34 PM',
      'last_msg': 'Vai valo acen?',
      'isRead': true,
      'count': '9',
      'status': 0,
      'type': 'video',
      'number': '017090909034'
    },
    {
      'name': 'Tanvir Parvez',
      'profile_picture':
          'https://as2.ftcdn.net/v2/jpg/00/67/20/79/1000_F_67207980_5jNk6I3KFlJjOXY73c3FlfvssaxY5N51.jpg',
      'time': '04:31 AM',
      'last_msg': 'Assalamu alaikum vai.',
      'isRead': false,
      'count': '5',
      'status': 1,
      'type': 'video',
      'number': '017013909098'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: appBarBg,
          title: const Text(
            appName,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            PopupMenuButton(
                onSelected: (value) {
                  if (value == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingScreen(),
                      ),
                    );
                  }
                },
                color: Colors.white,
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 0,
                      child: Text('New Group'),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: Text('New Broadcast'),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('Settings'),
                    ),
                  ];
                }),
          ],
          bottom: TabBar(
              indicatorColor: primary,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.white.withOpacity(.5),
              labelColor: Colors.white,
              dividerColor: background,
              tabs: const [
                Tab(
                  child: Icon(Icons.group_add_outlined),
                ),
                Tab(
                  child: Text('Chats'),
                ),
                Tab(
                  child: Text('Status'),
                ),
                Tab(
                  child: Text('Calls'),
                ),
              ]),
        ),
        body: TabBarView(children: [
          const Text('1st Tex'),
          ListView.builder(
              itemCount: usersList.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (_, index) {
                final data = usersList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatDetailsScreen(
                            name: data['name'],
                            image: data['profile_picture'],
                            number: data['number'],
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        data['profile_picture'],
                      ),
                    ),
                    title: Text(
                      data['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      data['last_msg'],
                      style: TextStyle(color: Colors.white.withOpacity(.5)),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          data['time'],
                          style: TextStyle(
                              color: data['isRead'] == true
                                  ? Colors.white
                                  : primary),
                        ),
                        data['isRead'] == true
                            ? const SizedBox()
                            : Container(
                                decoration: const BoxDecoration(
                                  color: primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    data['count'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                );
              }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              ListTile(
                leading: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://static.vecteezy.com/system/resources/previews/000/439/863/original/vector-users-icon.jpg'),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          )),
                    )
                  ],
                ),
                title: const Text(
                  myStatus,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  addStatus,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Recent Update',
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ),
              ListView.builder(
                  itemCount: usersList.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (_, index) {
                    final data = usersList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: primary,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                data['profile_picture'],
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          data['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          data['last_msg'],
                          style: TextStyle(color: Colors.white.withOpacity(.5)),
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              data['time'],
                              style: TextStyle(
                                  color: data['isRead'] == true
                                      ? Colors.white
                                      : primary),
                            ),
                            data['isRead'] == true
                                ? const SizedBox()
                                : Container(
                                    decoration: const BoxDecoration(
                                      color: primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        data['count'],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: primary, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.link_outlined,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Create call line',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  'Share a link for your $appName',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Recent Update',
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ),
              ListView.builder(
                  itemCount: usersList.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (_, index) {
                    final data = usersList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: primary,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                data['profile_picture'],
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          data['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            data['status'] == 1
                                ? const Icon(
                                    Icons.call_received,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.call_made,
                                    color: primary,
                                  ),
                            Text(
                              data['time'],
                              style: TextStyle(
                                color: Colors.white.withOpacity(.5),
                              ),
                            )
                          ],
                        ),
                        trailing: data['type'] == 'video'
                            ? const Icon(Icons.video_call)
                            : const Icon(
                                Icons.call,
                                color: primary,
                              ),
                      ),
                    );
                  }),
            ],
          ),
        ]),
      ),
    );
  }
}
