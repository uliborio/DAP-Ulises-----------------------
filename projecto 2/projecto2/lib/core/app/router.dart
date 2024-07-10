import 'package:projecto2/presentation/screens/home_screen.dart';
import 'package:projecto2/presentation/screens/login_screen.dart';
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
        final usuario = state.pathParameters['usuario'] as String; // Obtén el valor del parámetro de la ruta
        return HomeScreen(usuario: usuario); // Pasa el valor del usuario a la página de inicio
      }
    )
]);