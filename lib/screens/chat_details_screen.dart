import 'package:flutter/material.dart';
import 'package:whatsapp_clone_project/widgets/single_message_widget.dart';

import '../utils/colors.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String name;
  final String image;
  final String number;
  const ChatDetailsScreen(
      {Key? key, required this.name, required this.image, required this.number})
      : super(key: key);

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  List chatData = [
    {
      'message': 'Hi',
      'time': '08:22pm',
      'type': 'text',
      'isMe': true,
    },
    {
      'message': 'Hello',
      'time': '08:23pm',
      'type': 'text',
      'isMe': false,
    },
    {
      'message': 'How are you doing now?',
      'time': '08:24pm',
      'type': 'text',
      'isMe': true,
    },
    {
      'message': 'I\'m Good. what about you?',
      'time': '08:25pm',
      'type': 'text',
      'isMe': false,
    },
    {
      'message': 'Fine.Good bye.',
      'time': '08:26pm',
      'type': 'text',
      'isMe': true,
    },
    {
      'message': 'Hi',
      'time': '08:22pm',
      'type': 'text',
      'isMe': true,
    },
    {
      'message': 'Hello',
      'time': '08:23pm',
      'type': 'text',
      'isMe': false,
    },
    {
      'message': 'How are you doing now?',
      'time': '08:24pm',
      'type': 'text',
      'isMe': true,
    },
    {
      'message': 'I\'m Good. what about you?',
      'time': '08:25pm',
      'type': 'text',
      'isMe': false,
    },
    {
      'message': 'Fine.Good bye.',
      'time': '08:26pm',
      'type': 'text',
      'isMe': true,
    },
    {
      'message': 'Hi',
      'time': '08:22pm',
      'type': 'text',
      'isMe': true,
    },
    {
      'message': 'Hello',
      'time': '08:23pm',
      'type': 'text',
      'isMe': false,
    },
    {
      'message': 'How are you doing now?',
      'time': '08:24pm',
      'type': 'text',
      'isMe': true,
    },
    {
      'message': 'I\'m Good. what about you?',
      'time': '08:25pm',
      'type': 'text',
      'isMe': false,
    },
    {
      'message': 'Fine.Good bye.',
      'time': '08:26pm',
      'type': 'text',
      'isMe': true,
    }
  ];

  String _message = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarBg,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.image),
          ),
          title: Text(
            widget.name,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            widget.number,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Icon(
            Icons.call,
            color: Colors.white.withOpacity(.5),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.videocam,
            color: Colors.white.withOpacity(.5),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white.withOpacity(.5),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://w0.peakpx.com/wallpaper/818/148/HD-wallpaper-whatsapp-background-cool-dark-green-new-theme-whatsapp.jpg'),
                fit: BoxFit.cover,
                opacity: .5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    reverse: true,
                    itemCount: chatData.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (_, index) {
                      final data = chatData[index];
                      return Column(
                        crossAxisAlignment: data['isMe'] == true
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          data['isMe'] != true
                              ? singleMessageWidget(
                                  context: context, data: data, isMe: false)
                              : singleMessageWidget(
                                  context: context, data: data, isMe: true),
                        ],
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: appBarBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_emotions,
                              color: Colors.white.withOpacity(.5),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: TextField(
                                  onChanged: (value){
                                    setState(() {
                                      _message = value;
                                    });
                                  },
                              maxLines: 5,
                              minLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Message',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(.5))),
                            )),
                            IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.link_off_outlined,
                                  color: Colors.white.withOpacity(.5),
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white.withOpacity(.5),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                   CircleAvatar(
                    backgroundColor: primary,
                    child: Icon(
                      _message.isEmpty ?
                      Icons.mic : Icons.send, color: Colors.white,),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
