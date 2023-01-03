import 'package:app_chat_th/go_routers/go_routers.dart';
import 'package:app_chat_th/ui/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../go_routers/routers.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SplashCubit(),child: const SplashChildPage(),);

  }
}

class SplashChildPage extends StatefulWidget {
  const SplashChildPage({Key? key}) : super(key: key);

  @override
  State<SplashChildPage> createState() => _SplashChildPageState();
}

class _SplashChildPageState extends State<SplashChildPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1),() => context.go(Routers.home),);
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
            "Splash"
        ),
      ),
    );
  }
}

