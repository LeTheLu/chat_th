import 'package:app_chat_th/go_routers/routers.dart';
import 'package:app_chat_th/ui/home/home_page.dart';
import 'package:app_chat_th/ui/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

import '../ui/chats/chat_page.dart';

class AppRouter {
  AppRouter._();

  static GoRouter route = GoRouter(
    routes: [
      GoRoute(
        path: Routers.splash,
        name: Routers.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Routers.home,
        name: Routers.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routers.chat,
        name: Routers.chat,
        builder: (context, state) => const ChatPage(),
      ),
      //ShellRoute()
    ],
  );
}
