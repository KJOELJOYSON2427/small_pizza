import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import 'package:small_pizza/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/search_bloc/search_event.dart';
import 'package:small_pizza/features/home/presentation/bloc/search_bloc/search_state.dart';


class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return Material(
              elevation: 2,
              shadowColor: Colors.black12,
              borderRadius: BorderRadius.circular(14),
              child: TextField(
                onChanged: (value) {
                  context
                      .read<SearchBloc>()
                      .add(SearchTextChanged(value));
                },
                onSubmitted: (value) {
                  context
                      .read<SearchBloc>()
                      .add(SearchSubmitted(value));
                      
                },
                decoration: InputDecoration(
                  hintText: 'Search food',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppTheme.primaryColor,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
