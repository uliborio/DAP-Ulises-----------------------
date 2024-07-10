import 'package:projecto2/presentation/screens/home_screen.dart';
import 'package:projecto2/presentation/screens/login_screen.dart';
import 'package:projecto2/presentation/screens/card_screen.dart';
import 'package:projecto2/core/app/entities/Post.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
  GoRoute(
    path: '/login',
    builder: ((context, state) => const LoginScreen())
  ),
  GoRoute(
    path: '/home/:usuario',
    builder: (context, state) {
        final usuario = state.pathParameters['usuario'] as String; 
        return HomeScreen(usuario: usuario); 
      }
  ),
  GoRoute(
      path: '/card',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final list = extra['list'] as List<Post>;
        final pressed = extra['pressed'] as int;
        return CardScreen(list: list, pressed: pressed);
      },
    ),
  ],
);