import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import '../bloc/navigation_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static const routes = ['/menu', '/offers', '/home', '/profile', '/more'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: SizedBox(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [],
            ),
          ),
        );
      },
    );
  }

  Widget _item(BuildContext context, int index, IconData icon, String label) {
    final selected = context.watch<NavigationBloc>().state.index == index;

    return InkWell(
      onTap: () {
        context.read<NavigationBloc>().add(TabChanged(index));
        context.go(routes[index]);
      },

      child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(icon, color: selected ? AppTheme.primaryColor: AppTheme.darkSecondaryText), 
                 Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? AppTheme.primaryColor: AppTheme.darkSecondaryText), 
                 
                
            ),
        ],
      ),
    );


    
  }


  Widget _fab(BuildContext context){
      return FloatingActionButton(
      backgroundColor: Colors.orange,
      onPressed: () {
        context.read<NavigationBloc>().add(TabChanged(2));
        context.go('/home');
      },
      child: const Icon(Icons.home),
    );
    }
}
