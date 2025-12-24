import 'package:flutter/material.dart';

class IntroPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onNext;
  final int currentPage;
  final int totalPages;

  const IntroPageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onNext,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Column(
        children: [
          const Spacer(flex: 2),

          /// Image with animation
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.8, end: 1.0),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutBack,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: Image.asset(
              image,
              height: 250,
              fit: BoxFit.contain,
            ),
          ),

          const Spacer(flex: 1),

          /// Page Indicators (dots)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalPages,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? theme.primaryColor
                      : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          /// Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A4B4D),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          /// Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF7C7D7E),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const Spacer(flex: 2),

          /// Next Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Next',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}