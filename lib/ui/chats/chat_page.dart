import 'package:app_chat_th/ui/chats/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../commons/app_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ChatCubit(),child: const ChatChildPage(),);
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
        actionFirst: _buttonCallVideo(),
        actionSecond: _buttonCallPhone(),
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }

  Widget _titleWidget({List<String>? listPathFriend, String? pathUser}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _itemTitle(path: url,height: 15),
        Column(
          children: [
            _itemTitle(path: url,height: 20),
            _itemTitle(path: url , height: 20),
          ],
        ),
        _itemTitle(path: url),
        Column(
          children: [
            _itemTitle(path: url,height: 20),
            _itemTitle(path: url , height: 20),
          ],
        ),
        _itemTitle(path: url,height: 15),
      ],
    );
  }

  Widget _itemTitle({required String path, double height = 45}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(path),
              fit: BoxFit.fitHeight
          )
      ),
      //child: Image.network(path),
    );
  }

  Widget _buttonCallVideo() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 20,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.pinkAccent.shade100),
      alignment: Alignment.center,
      child: const FaIcon(
        FontAwesomeIcons.video,
        color: Colors.white,
        size: 15,
      ),
    );
  }

  Widget _buttonCallPhone() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 20,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
      alignment: Alignment.center,
      child: const FaIcon(
        FontAwesomeIcons.phone,
        color: Colors.white,
        size: 15,
      ),
    );
  }
}

