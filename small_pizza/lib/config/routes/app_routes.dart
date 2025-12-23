// 🔁 App Router
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/di/injection_container.dart';
import 'package:small_pizza/features/auth/presentation/bloc/login_bloc.dart';
import 'package:small_pizza/features/auth/presentation/pages/login_page.dart';
import 'package:small_pizza/features/auth/presentation/pages/splash_pages.dart';
import 'package:small_pizza/features/welcome/presentation/pages/welcome_page.dart';
import 'package:get_it/get_it.dart';
// 🔹 TEMP pages (we’ll replace with real ones later)
// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Splash")));
//   }
// }

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Register")));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Home")));
  }
}

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Food Detail")));
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Cart")));
  }
}

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Checkout")));
  }
}

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomePage(),
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) => BlocProvider(
          create: (context) => sl<LoginBloc>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/food',
        builder: (context, state) => const FoodDetailPage(),
      ),
      GoRoute(path: '/cart', builder: (context, state) => const CartPage()),
      GoRoute(
        path: '/checkout',
        builder: (context, state) => const CheckoutPage(),
      ),
    ],
  );
}
