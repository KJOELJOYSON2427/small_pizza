class SearchState{
 
  final String query;
  final bool isSubmitted;

  const SearchState({
    this.query = '',
    this.isSubmitted = false,
  });

  SearchState copyWith({
    String? query,
    bool? isSubmitted,
  }) {
    return SearchState(
      query: query ?? this.query,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}