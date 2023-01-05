import 'package:app_chat_th/commons/app_images.dart';
import 'package:app_chat_th/commons/app_text_style.dart';
import 'package:app_chat_th/ui/chats/chat_page.dart';
import 'package:app_chat_th/ui/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../commons/app_background.dart';
import '../widgets/avatar_circle.dart';
import '../widgets/icon_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeChildPage(),
    );
  }
}

class HomeChildPage extends StatelessWidget {
  const HomeChildPage({Key? key}) : super(key: key);

  final String url = "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80";

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      body: Column(
        children: [
          /// header
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                _infoUser(context),
                _itemStoryFriend(addStory: true, userName: "AAAA"),
              ],
            ),
          ),

          /// list friendChat
          _listFriendChat(context)
        ],
      ),
    );
  }

  Widget _infoUser(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AvatarCircle(path: url, height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Good Moring",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey),
                    ),
                    Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconWidget(icon: FontAwesomeIcons.magnifyingGlass, backGroundColor: Colors.pinkAccent.shade100, iconColor: Colors.white),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    margin: EdgeInsets.only(right: 10, left: 10, bottom: MediaQuery.of(context).padding.bottom),
                    padding: const EdgeInsets.all(30),
                    //height: MediaQuery.of(context).size.height / ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Tên Nhóm", style: AppTextStyle.blackS30,),
                        Container(
                          height: 25,
                            alignment: Alignment.center,
                            child: Text("AAAA", style: AppTextStyle.blackS12,)),
                        Text("AAAA", style: AppTextStyle.greyS12,),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 20,

                        ),
                          itemCount: 10,
                          itemBuilder: (context, index) => Column(
                            children: [
                              AvatarCircle(path: url, height: 50,),
                              Text("NAme"),
                            ],
                          ),),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 30,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          alignment: Alignment.center,
                          child: Text("button"),
                        )
                      ],
                    ),
                  ),
                ),
                child: const IconWidget(
                  icon: FontAwesomeIcons.plus,
                  height: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemStoryFriend({
    String? urlAvatar,
    String userName = "",
    bool addStory = false,
  }) {
    ImageProvider imageProvider;
    if (urlAvatar != null) {
      imageProvider = NetworkImage(urlAvatar);
    } else {
      /*AppImage.avatarUnknownWoman*/
      imageProvider = AssetImage(AppImage.avatarUnknownMan);
    }
    return Container(
      height: 95,
      width: 85,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              /// avatar
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Colors.pink,
                    image: DecorationImage(
                      image: imageProvider,
                    )),
              ),

              /// add Story
              Visibility(
                visible: addStory,
                child: Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              )
            ],
          ),

          /// user name
          Text(
            userName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          )
        ],
      ),
    );
  }

  Widget _listFriendChat(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 30, left: 30),
          child: Column(
            children: [
              /// title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Chats",
                    style: AppTextStyle.blackS30,
                  ),
                  Text(
                    "Manage",
                    style: AppTextStyle.greyS14Bold,
                  ),
                ],
              ),

              /// list Friend
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: 30,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatPage(),
                            ),
                          ),
                      child: _itemFriendChat()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemFriendChat({String title = ""}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: 100,
      alignment: Alignment.center,
      child: Row(
        children: [
          /// right
          Row(
            children: [
              /// avatar
              AvatarCircle(path: url, height: 55),
              const SizedBox(
                width: 8,
              ),

              /// Text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User Name",
                    style: AppTextStyle.blackS14,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      AvatarCircle(path: url, height: 14),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "history chat",
                        style: AppTextStyle.grey,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Spacer(),

          /// left
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: Text(
                  "5",
                  style: AppTextStyle.whiteS12,
                ),
              ),
              const Text(
                "Today, 12:25",
                style: AppTextStyle.grey,
              )
            ],
          ),
        ],
      ),
    );
  }
}
