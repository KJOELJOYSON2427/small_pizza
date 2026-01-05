import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:small_pizza/config/theme/app_theme.dart';
import 'package:small_pizza/features/menu/presentation/bloc/menu_bloc.dart';
import 'package:small_pizza/features/menu/presentation/bloc/menu_sate.dart';
import 'package:small_pizza/features/menu/presentation/widgets/menu_category_card.dart';
import 'package:small_pizza/features/menu/presentation/widgets/menu_header.dart';
import 'package:small_pizza/features/menu/presentation/widgets/menu_search_bar.dart';

class MenuPage extends StatelessWidget {
   final String restaurantId;

  const MenuPage({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Full-height left orange accent (recommended – looks much better)
          Positioned(
              top: 230,
  bottom: 200,
  left: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: screenWidth * 0.20, // good balance
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.92),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.elliptical(140, 300),
                      bottomRight: Radius.elliptical(220, 480),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: CustomScrollView(
              primary: false,
              slivers: [
                SliverToBoxAdapter(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                      child: Column(
                        children: [
                          MenuHeader(
                            onCartTap: () {
                              // TODO: Navigate to cart
                            },
                          ),
                          const SizedBox(height: 16),
                          MenuSearchBar(
                            onTap: () {
                              // TODO: open search
                            },
                          ),
                          const SizedBox(height: 28),
                        ],
                      ),
                    ),
                  ),
                ),

                // ← Fixed: wrapped with SliverToBoxAdapter
                const SliverToBoxAdapter(
                  child: SizedBox(height: 24),
                ),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: BlocBuilder<MenuBloc, MenuState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final categories = state.categories ?? [];

                      if (categories.isEmpty) {
                        return const SliverToBoxAdapter(
                          child: Center(child: Text('No menu available')),
                        );
                      }

                      return SliverList(                  
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final item = categories[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: MenuCategoryCard(
                                category: item.category,
                                count: item.count,
                                onTap: () {
                                  context.go(
                                    '/menu/items/${item.category.name.toLowerCase()}',
                                    extra: {
                                      'restaurantId': restaurantId,
                                      'category': item.category,
                                    },
                                  );
                                },
                              ),
                            );
                          },
                          childCount: categories.length,
                        ),
                      );
                    },
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}