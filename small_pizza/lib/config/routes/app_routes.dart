// 🔁 App Router
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/di/injection_container.dart';
import 'package:small_pizza/features/auth/presentation/bloc/UserProfileBloc/user_profile_bloc.dart';
import 'package:small_pizza/features/auth/presentation/bloc/login_bloc.dart';
import 'package:small_pizza/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:small_pizza/features/auth/presentation/pages/login_page.dart';
import 'package:small_pizza/features/auth/presentation/pages/regiater_pages.dart';
import 'package:small_pizza/features/auth/presentation/pages/splash_pages.dart';
import 'package:small_pizza/features/onboarding/presentation/pages/onboarding_pages.dart';
import 'package:small_pizza/features/shell/presentation/pages/app_shell_page.dart';
import 'package:small_pizza/features/welcome/presentation/pages/welcome_page.dart';
// 🔹 TEMP pages (we’ll replace with real ones later)
// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Splash")));
//   }
// }

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Register")));
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home"));
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
        builder: (context, state) => const OnboardingPage(),
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
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<RegisterBloc>()),
              BlocProvider(create: (_) => sl<UserProfileBloc>()),
            ],
            child: const RegisterPage(),
          );
        },
      ),



    //  StatefulShellRoute.indexedStack(
    //     builder:(context, state, navigationShell){

    //     },
    //     branches: <StatefulShellBranch>[
    //       // Home
    //       StatefulShellBranch(
    //         routes: [
    //           GoRoute(path: '/home',
    //            pageBuilder: (context, state) => const NoTransitionPage(child: HomePage()),
    //           )
    //         ]
    //       ),
    //        // Offers
    //       StatefulShellBranch(
    //         routes: [
    //           GoRoute(
    //             path: '/offers',
    //             pageBuilder: (context, state) =>
    //                 const NoTransitionPage(child: HomePage()),
    //           ),
    //         ],
    //       ),

    //       // Profile
    //       StatefulShellBranch(
    //         routes: [
    //           GoRoute(
    //             path: '/profile',
    //             pageBuilder: (context, state) =>
    //                 const NoTransitionPage(child: HomePage()),
    //           ),
    //         ],
    //       ),

    //       // More
    //       StatefulShellBranch(
    //         routes: [
    //           GoRoute(
    //             path: '/more',
    //             pageBuilder: (context, state) =>
    //                 const NoTransitionPage(child: HomePage()),
    //           ),
    //         ],
    //       ),
    //     ]
    //  )






      /// 🏠 App Shell
      // ShellRoute(
      //   builder: (context, state, child) {
      //     return AppShellPage(child: child);
      //   },

      //   routes: [
      //     GoRoute(path: '/menu', builder: (_, __) => const HomePage()),
      //     GoRoute(path: '/offers', builder: (_, __) => const HomePage()),
      //     GoRoute(path: '/home', builder: (_, __) => const HomePage()),
      //     GoRoute(path: '/profile', builder: (_, __) => const HomePage()),
      //     GoRoute(path: '/more', builder: (_, __) => const HomePage()),
      //   ],
      // ),

      // GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      // GoRoute(
      //   path: '/food',
      //   builder: (context, state) => const FoodDetailPage(),
      // ),
      // GoRoute(path: '/cart', builder: (context, state) => const CartPage()),
      // GoRoute(
      //   path: '/checkout',
      //   builder: (context, state) => const CheckoutPage(),
      // ),
    ],
  );
}
