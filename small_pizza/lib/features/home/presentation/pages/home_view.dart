import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import 'package:small_pizza/features/home/presentation/bloc/home_header/home_header_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/home_header/home_header_event.dart';
import 'package:small_pizza/features/home/presentation/bloc/home_header/home_header_state.dart';
import 'package:small_pizza/features/home/presentation/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final sl = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 26, 0, 0),
      child: BlocProvider(
        create: (_) => sl<HomeHeaderBloc>()..add(LoadHomeHeader()),
        child: BlocListener<HomeHeaderBloc, HomeHeaderState>(
          listenWhen: (previous, current) => current.openLocationSheet == true,
          listener: (context, state) {
            _showLocationBottomSheet(context);
          },
          child: const HomeHeader(),
        ),
      ),
    );
  }

  void _showLocationBottomSheet(BuildContext context) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.38,
        minChildSize: 0.38,
        maxChildSize: 0.6,
        expand: false,
        builder: (_, scrollController) {
          return ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.my_location_rounded,
                  color: AppTheme.primaryColor,
                ),
                title: const Text('Use current location'),
                subtitle: Text(
                  'Using GPS',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                onTap: () {
                  context.read<HomeHeaderBloc>().add(
                    LocationSelectedEvent('Current location'),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.home_rounded,
                  color: AppTheme.primaryColor,
                ),
                title: const Text('Home'),
                subtitle: const Text('Koramangala / MG Road / ...'),
                onTap: () {
                  context.read<HomeHeaderBloc>().add(
                    LocationSelectedEvent('Home'),
                  );
                  Navigator.pop(context);
                },
              ),
              // Add more saved locations here later
            ],
          );
        },
      ),
    );
  }
}
