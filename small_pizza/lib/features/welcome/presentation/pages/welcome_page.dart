import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import '../bloc/welcome_bloc.dart';
import '../bloc/welcome_event.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => WelcomeBloc(),
      child: Builder(
        builder: (innerContext) {
          return Scaffold(
            backgroundColor: AppTheme.lightBg,
            body: FadeTransition(
              opacity: _fade,
              child: SlideTransition(
                position: _slide,
                child: Column(
                  children: [
                    // 🔶 TOP ORANGE CARD WITH LOGO
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        // 🐵 LOGO (BEHIND) - Now first in Stack
                        Positioned(
                          bottom: 16,
                          child: Container(
                            padding: const EdgeInsets.all(60),

                            child: Image.asset(
                              'assets/img/app_logo.png',
                              height: 130,
                            ),
                          ),
                        ),

                        // 🎨 ORANGE SHAPE (IN FRONT) - Now second in Stack, overlays on top
                        Image.asset(
                          'assets/img/welcome_top_shape.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),

                    const SizedBox(height: 90),

                    // 🧾 DESCRIPTION
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Discover the best foods from over 1,000 restaurants\nand fast delivery to your doorstep',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),

                    const Spacer(),

                    // 🔘 LOGIN
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            innerContext.read<WelcomeBloc>().add(
                              LoginPressed(),
                            );
                            context.go('/login');
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 🔘 REGISTER
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            innerContext.read<WelcomeBloc>().add(
                              RegisterPressed(),
                            );
                            context.go('/register');
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.primaryColor,
                            side: const BorderSide(
                              color: AppTheme.primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Create an Account'),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
