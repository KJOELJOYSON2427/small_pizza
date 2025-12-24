import 'package:flutter/material.dart';

class IntroPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const IntroPageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
         const Spacer(),

         /// Image
         AnimatedScale(
          scale: 1,
           duration: const Duration(milliseconds: 600),
           child: Image.asset(
            image,
            height: 260,
          ),
           ),

            const SizedBox(height: 40),

            const SizedBox(height: 40),

        /// 📝 TITLE
        Text(
          title,
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 12,),
         /// 📄 SUBTITLE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            subtitle,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),

        const Spacer(),

        /// ➡ NEXT BUTTON
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onNext,
                 child: const Text('Next'),
                 ),
            ),
          ),
          
 const SizedBox(height: 30),
      ],
    );
  }
}
