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
import 'package:small_pizza/features/home/presentation/pages/home_view.dart';
import 'package:small_pizza/features/onboarding/presentation/pages/onboarding_pages.dart';
import 'package:small_pizza/features/restaurent/presentation/pages/popular_restaurants_view.dart';
import 'package:small_pizza/features/shell/presentation/pages/app_shell_page.dart';
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

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Menu Detail")));
  }
}

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Offers")));
  }
}

class MorePage extends StatelessWidget {
  const MorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("More")));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Offers")));
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
  /// Root navigator key
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),

      // GoRoute(
      //   path: '/welcome',
      //   builder: (context, state) => const OnboardingPage(),
      // ),
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

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShellPage(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // Branch 1 → Menu (left side)
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'menuNavKey'),
            routes: [
              GoRoute(
                path: '/menu',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MenuPage(), // ← replace later
                ),
              ),
            ],
          ),

          // Branch 2 → Offers
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'offersNavKey'),
            routes: [
              GoRoute(
                path: '/offers',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: OffersPage(), // ← replace later
                ),
              ),
            ],
          ),
          // Menu
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'homeNavKey'),
            initialLocation: '/home',
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeView()),
              ),
              // You can later add nested routes here, e.g. /home/details/:id
              // Nested route under /home
              GoRoute(
                path:
                    '/home/popular-restaurants', // → full path becomes /home/popular-restaurants
                builder: (_,_) => const PopularRestaurantsView(),
                // OR use pageBuilder if you want custom transitions
                // pageBuilder: (context, state) => MaterialPage(
                //   child: PopularRestaurantsFullScreen(),
                // ),

                // You can add more nested routes later, examples:
                // GoRoute(
                //   path: 'restaurant/:id',
                //   builder: (context, state) => RestaurantDetailScreen(
                //     id: state.pathParameters['id']!,
                //   ),
                // ),
              ),
            ],
          ),
          // Branch 3 → Profile
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(
              debugLabel: 'profileNavKey',
            ),
            routes: [
              GoRoute(
                path: '/profile',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfilePage(), // ← replace later
                ),
              ),
            ],
          ),

          // Branch 4 → More
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'moreNavKey'),
            routes: [
              GoRoute(
                path: '/more',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MorePage(), // ← replace later
                ),
              ),
            ],
          ),
        ],
      ),

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
