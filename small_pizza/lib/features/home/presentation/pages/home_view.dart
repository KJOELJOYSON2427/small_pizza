import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import 'package:small_pizza/features/home/presentation/bloc/home_header/home_header_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/home_header/home_header_event.dart';
import 'package:small_pizza/features/home/presentation/bloc/home_header/home_header_state.dart';
import 'package:small_pizza/features/home/presentation/bloc/popular_food/popular_foods_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/popular_food/popular_foods_event.dart';
import 'package:small_pizza/features/home/presentation/bloc/popular_restaurants/popular_restaurants_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/popular_restaurants/popular_restaurants_event.dart';
import 'package:small_pizza/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:small_pizza/features/home/presentation/widgets/home_header.dart';
import 'package:small_pizza/features/home/presentation/widgets/home_search_bar.dart';
import 'package:small_pizza/features/home/presentation/widgets/popular_food/most_popular_horizontal_list.dart';
import 'package:small_pizza/features/home/presentation/widgets/popular_restaurants/popular_restaurants_section.dart';

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<HomeHeaderBloc>()..add(LoadHomeHeader()),
          ),
          BlocProvider(create: (_) => sl<SearchBloc>()),

          BlocProvider(
            create: (_) =>
                sl<PopularRestaurantsBloc>()..add(LoadPopularRestaurants()),
          ),

          BlocProvider(
            create: (_) => sl<PopularFoodsBloc>()..add(LoadPopularFoods()),
          ),
        ],
        child: BlocListener<HomeHeaderBloc, HomeHeaderState>(
          listenWhen: (previous, current) => current.openLocationSheet == true,
          listener: (context, state) {
            _showLocationBottomSheet(context);
          },
          child: CustomScrollView(
            slivers: [
              /// 🔹 HEADER
              SliverToBoxAdapter(child: HomeHeader()),

              /// 🔹 SPACING
              const SliverToBoxAdapter(child: SizedBox(height: 8)),

              /// 🔹 NEXT SECTIONS (placeholders for now)
              const HomeSearchBar(),

              SliverToBoxAdapter(child: PopularRestaurantsSection()),

              const SliverToBoxAdapter(
                child: MostPopularSection(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: Center(child: Text('Recent Items')),
                ),
              ),
            ],
          ),
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
