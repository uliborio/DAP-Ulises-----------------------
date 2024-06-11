import 'package:projecto2/presentation/screens/home_screen.dart';
import 'package:projecto2/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
  GoRoute(
    path: '/login',
    builder: ((context, state) => LoginScreen())
  ),
  GoRoute(
    path: '/home',
    builder: ((context, state) => HomeScreen())
  ),
]);