import 'package:app_chat_th/go_routers/go_routers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerDelegate: AppRouter.route.routerDelegate,
      routeInformationParser: AppRouter.route.routeInformationParser,
      routeInformationProvider: AppRouter.route.routeInformationProvider,
    );
  }
}


