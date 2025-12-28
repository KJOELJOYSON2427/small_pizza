import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/core/storage/app_storage.dart';
import 'package:small_pizza/features/auth/presentation/bloc/splash/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  final sl = GetIt.instance;
  late final SplashBloc _splashBloc;

  @override
  void initState() {
    super.initState();
    // Get the factory-created instance from get_it
    _splashBloc = sl<SplashBloc>();

    // Trigger the event right after frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _splashBloc.add(const SplashStarted());
    });
    // Future.microtask(() async {
    //   final isIntoSeen = await AppStorage.isIntroSeen();
    // });
    // // ⏳ Auto navigate after 2 seconds

    // Timer(const Duration(seconds: 2), () {
    //   context.go('/welcome');
    // });
  }

  @override
  void dispose() {
    // Optional: only close if you want to dispose this specific instance
    // When using registerFactory, next time get_it will create a fresh one anyway
    _splashBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // ← Now using the theme!

    return BlocProvider.value(
      value: _splashBloc,
      child: Scaffold(
        backgroundColor:
            theme.scaffoldBackgroundColor, // Uses AppTheme.lightBg (pure white)
        body: Stack(
          children: [
            // Light background pattern (subtle overlay)
            Positioned.fill(
              child: Image.asset(
                'assets/img/splash_bg.png',
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(
                  0.03,
                ), // Minor: withOpacity is more common than withValues
                colorBlendMode: BlendMode.srcIn,
              ),
            ),

            // Center content
            BlocConsumer<SplashBloc, SplashState>(
              listener: (context, state) {
                // We only navigate when loading is finished
                if (!state.isLoading) {
                  _navigateBasedOnState(state);
                }
              },
              builder: (context, state) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/img/app_logo.png', height: 120),

                      const SizedBox(height: 48),

                      // Loading state
                      if (state.isLoading) ...[
                        const CircularProgressIndicator(),
                        const SizedBox(height: 24),
                        Text(
                          'Checking authentication...',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateBasedOnState(SplashState state) async {
    final isIntroSeen = await AppStorage.isIntroSeen();
   

   // Very important safety check
  if (!mounted) return;
    if (!isIntroSeen) {
      context.go('/onboarding'); // or '/onboarding' — whatever your route is
      return;
    }

    if (state.isAuthenticated) {
      context.go('/home'); // main screen / tabs
    } else {
      context.go('/login'); // login / register screen
    }
  }
}


/**
 * The Flow of the Splash Page is here
 * 
 * App opens → SplashPage
├── Shows logo + loading indicator
└── SplashBloc checks auth state
    ├── Loading finished
    ├── Intro not seen? → /intro
    ├── Intro seen?
    │   ├── Logged in?    → /home
    │   └── Not logged in → /welcome
 */