import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import '../../../../core/storage/app_storage.dart';
import '../../../../core/utils/intro_page_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _currentPage = 0;
  static const int _totalPages = 3;

  void _next() async {
    if (_currentPage < _totalPages - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      await AppStorage.setIntroSeen();
      if (mounted) {
        context.go('/login');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightBg,
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          IntroPageWidget(
            image: 'assets/img/on_boarding_1.png',
            title: 'Find Food You Love',
            subtitle:
            'Discover the best foods from over 1,000\nrestaurants and fast delivery to your doorstep',
            onNext: _next,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
          IntroPageWidget(
            image: 'assets/img/on_boarding_2.png',
            title: 'Fast Delivery',
            subtitle:
            'Fast food delivery to your home, office\nwherever you are',
            onNext: _next,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
          IntroPageWidget(
            image: 'assets/img/on_boarding_3.png',
            title: 'Live Tracking',
            subtitle:
            'Real time tracking of your food on the app\nonce you placed the order',
            onNext: _next,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        ],
      ),
    );
  }
}