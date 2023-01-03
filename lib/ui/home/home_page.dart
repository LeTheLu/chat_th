import 'package:app_chat_th/commons/app_bar.dart';
import 'package:app_chat_th/ui/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _infoUser(),
            _itemStoryFriend()
          ],
        ),
      ),
    );
  }

  Widget _infoUser() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _itemTitle(path: url, height: 40),
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
              _buttonCallVideo(),
              const SizedBox(
                width: 10,
              ),
              _buttonCallPhone(),
            ],
          ),
        ],
      ),
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

  Widget _buttonCallVideo() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.pinkAccent.shade100),
      alignment: Alignment.center,
      child: const FaIcon(
        FontAwesomeIcons.magnifyingGlass,
        color: Colors.white,
        size: 15,
      ),
    );
  }

  Widget _buttonCallPhone() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 40,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      alignment: Alignment.center,
      child: const FaIcon(
        FontAwesomeIcons.plus,
        color: Colors.white,
        size: 15,
      ),
    );
  }

  Widget _itemStoryFriend() {
    return Container(
      height: 95,
      width: 85,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(Icons.add, color: Colors.white,size: 15,),
                ),
              )
            ],
          ),
          Text(
            "Add Story",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          )
        ],
      ),
    );
  }
}
