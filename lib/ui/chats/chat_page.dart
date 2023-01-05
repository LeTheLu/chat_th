import 'package:app_chat_th/commons/app_colors.dart';
import 'package:app_chat_th/commons/app_text_style.dart';
import 'package:app_chat_th/ui/chats/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../commons/app_background.dart';
import '../../commons/app_bar.dart';
import '../widgets/icon_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: const ChatChildPage(),
    );
  }
}

class ChatChildPage extends StatefulWidget {
  const ChatChildPage({Key? key}) : super(key: key);

  @override
  State<ChatChildPage> createState() => _ChatChildPageState();
}

class _ChatChildPageState extends State<ChatChildPage> {
  final String url = "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTH(
        titleWidget: _titleWidget(),
        actionFirst: IconWidget(icon: FontAwesomeIcons.video, iconColor: Colors.white, backGroundColor: Colors.pinkAccent.shade100),
        actionSecond: const IconWidget(icon: FontAwesomeIcons.phone, iconColor: Colors.white),
      ),
      body: AppBackground(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: _chats(),
                  ),
                ),
              ),
            ),
            _messageChat(context),
          ],
        ),
      ),
    );
  }

  Widget _titleWidget({List<String>? listPathFriend, String? pathUser}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _itemTitle(path: url, height: 15),
        Column(
          children: [
            _itemTitle(path: url, height: 20),
            _itemTitle(path: url, height: 20),
          ],
        ),
        _itemTitle(path: url),
        Column(
          children: [
            _itemTitle(path: url, height: 20),
            _itemTitle(path: url, height: 20),
          ],
        ),
        _itemTitle(path: url, height: 15),
      ],
    );
  }

  Widget _itemTitle({required String path, double height = 45}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle, image: DecorationImage(image: NetworkImage(path), fit: BoxFit.fitHeight)),
      //child: Image.network(path),
    );
  }

  List<Map<String,String>> listData = [
    {"user": "1dfgklsdjfhkl;sjfdg;kos;kjfghskl;fhjkdfhiufsdhiuwrhgiuwert"},
    {"friend": "2"},
    {"user": "3"},
    {"friend": "4"},
    {"user": "5"},
    {"friend": "6"},
    {"friend": "1dfgklsdjfhkl;sjfdg;kos;kjfghskl;fhjkdfhiufsdhiuwrhgiuwert"},
    {"friend": "2"},
    {"user": "3"},
    {"friend": "4"},
    {"user": "5"},
    {"friend": "6"},
    {"user": "1dfgklsdjfhkl;sjfdg;kos;kjfghskl;fhjkdfhiufsdhiuwrhgiuwert"},
    {"friend": "2"},
    {"user": "3"},
    {"friend": "4"},
    {"user": "5"},
    {"friend": "6"},
    {"user": "1dfgklsdjfhkl;sjfdg;kos;kjfghskl;fhjkdfhiufsdhiuwrhgiuwert"},
    {"friend": "2"},
    {"user": "3"},
    {"friend": "4"},
    {"user": "5"},
    {"friend": "6"},
    {"user": "1dfgklsdjfhkl;sjfdg;kos;kjfghskl;fhjkdfhiufsdhiuwrhgiuwert"},
    {"friend": "2"},
    {"user": "3"},
    {"friend": "4"},
    {"user": "5"},
    {"friend": "6"},
    {"user": "1dfgklsdjfhkl;sjfdg;kos;kjfghskl;fhjkdfhiufsdhiuwrhgiuwert"},
    {"friend": "2"},
    {"user": "3"},
    {"friend": "4"},
    {"user": "5"},
    {"friend": "6"},
    {"user": "1dfgklsdjfhkl;sjfdg;kos;kjfghskl;fhjkdfhiufsdhiuwrhgiuwert"},
    {"friend": "2"},
    {"user": "3"},
    {"friend": "4"},
    {"user": "5"},
    {"friend": "6"},

  ];

  List<Widget> _chats() {
    return listData.map((e) {
     if(e.keys.first == "user"){
       return _messageUser(message: e.values.first);
     } else{
       return _messageFriend(message: e.values.first);
     }
    }).toList();
  }

  Widget _messageChat(BuildContext context) {
    return Container(
      color: Colors.white60,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: const [
              IconWidget(icon: Icons.add, backGroundColor: Colors.pinkAccent, height: 30, padding: 5),
              SizedBox(
                width: 10,
              ),
              IconWidget(icon: Icons.image, backGroundColor: Colors.pinkAccent, height: 30, padding: 5),
            ],
          ),

          /// input
          Container(
            constraints: const BoxConstraints(
              minHeight: 30,
              //maxHeight: 40,
            ),
            width: MediaQuery.of(context).size.width - 130,
            margin: const EdgeInsets.only(top: 10, left: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(25)),
            alignment: Alignment.center,
            child: const TextField(
              maxLength: null,
              maxLines: null,
              cursorColor: Colors.pinkAccent,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration.collapsed(
                hintText: '',
              ),
            ),
          ),

          /// send message
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(Icons.send, color: Colors.pinkAccent,),
          )
        ],
      ),
    );
  }

  Widget _messageFriend({String message = ""}){
    return Align(
      alignment: const Alignment(-1,0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width *0.75,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(message),
      ),
    );
  }

  Widget _messageUser({String message = ""}){
    return Align(
      alignment: const Alignment(1,0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width *0.75,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.pinkAccent[100],
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(message, style: AppTextStyle.white,),
      ),
    );
  }
}
