import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_bloc.dart';
import '../widgets/bottom_nav_bar.dart';

class AppShellPage extends StatelessWidget {
  final Widget child;

   AppShellPage({super.key, required this.child}){
    print('came');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=>NavigationBloc(),
        child: Scaffold(
            body: child,
            bottomNavigationBar: const BottomNavBar(),
        ),
    );
  }
}
