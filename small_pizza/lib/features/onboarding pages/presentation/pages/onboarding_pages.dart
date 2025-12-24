import 'package:flutter/material.dart';
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

  int _index = 0;

  void _next() async {
    if (_index < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    } else {
      await AppStorage.setIntroSeen();
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightBg,
      body: PageView(
        controller: _controller,
        onPageChanged: (i) => setState(() => _index + 1),
        children: [
          IntroPageWidget(
            image: 'assets/img/intro1.png',
            title: 'Find Food You Love',
            subtitle: 'Discover the best foods from over 1,000 restaurants',
            onNext: _next,
          ),
          IntroPageWidget(
            image: 'assets/img/intro2.png',
            title: 'Fast Delivery',
            subtitle: 'Fast food delivery to your home or office',
            onNext: _next,
          ),
          IntroPageWidget(
            image: 'assets/img/intro3.png',
            title: 'Live Tracking',
            subtitle: 'Real time tracking of your food once ordered',
            onNext: _next,
          ),
        ],
      ),
    );
  }
}
