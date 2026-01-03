import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/features/home/presentation/widgets/popular_restaurants/popular_restaurants_card.dart';
import '../bloc/popular_restaurants/popular_restaurants_bloc.dart';
import '../bloc/popular_restaurants/popular_restaurants_state.dart';
import '../bloc/popular_restaurants/popular_restaurants_event.dart';

class PopularRestaurantsList extends StatefulWidget {
  const PopularRestaurantsList({super.key});

  @override
  State<PopularRestaurantsList> createState() => _PopularRestaurantsListState();
}

class _PopularRestaurantsListState extends State<PopularRestaurantsList> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels >
        _controller.position.maxScrollExtent - 200) {
      context.read<PopularRestaurantsWithPageBloc>().add(
        LoadMorePopularRestaurants(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularRestaurantsWithPageBloc, PopularRestaurantsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // return ListView.separated(
        //   controller: _controller,
        //   padding: const EdgeInsets.all(16),
        //   itemCount: state.restaurants.length +
        //       (state.isLoadingMore ? 1 : 0),
        //        separatorBuilder: (_, __) => const SizedBox(height: 16),
        //      itemBuilder: (context, index){
        //        if (index >= state.restaurants.length) {
        //       return const Center(child: CircularProgressIndicator());
        //     }

        //     return PopularRestaurantCard(
        //       restaurant: state.restaurants[index],
        //     );
        //      },
        // );

        return ListView.separated(
          controller: _controller,
          padding: const EdgeInsets.fromLTRB(
            16,
            16,
            16,
            24,
          ), // better bottom padding
          physics: const BouncingScrollPhysics(),
          itemCount: state.restaurants.length + (state.isLoadingMore ? 1 : 0),
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            if (index >= state.restaurants.length) {
              return const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator(strokeWidth: 3)),
              );
            }

            return PopularRestaurantCard(
              restaurant: state.restaurants[index],

              onTap: () {
                if (!context.mounted) return;
             
                final id = state.restaurants[index].id;
                print(id);
                // optional: small delay / loading / animation
                // await Future.delayed(Duration(milliseconds: 80));

                if (!context.mounted) return; // check again after await

                context.go('/home/popular-restaurants/$id');
              },
            );
          },
        );
      },
    );
  }
}
