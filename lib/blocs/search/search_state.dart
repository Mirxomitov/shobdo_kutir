// part of 'search_bloc.dart';
//
// class SearchState extends Equatable {
//   final List<String> searchHistory;
//   final String searchQuery;
//   final List<BookData> searchResult;
//   final bool showHistory;
//
//   factory SearchState.initial() {
//     return const SearchState(
//       searchHistory: [],
//       searchQuery: '',
//       searchResult: [],
//       showHistory: false,
//     );
//   }
//
//   // copy with
//   SearchState copyWith({
//     List<String>? searchHistory,
//     String? searchQuery,
//     List<BookData>? searchResult,
//     bool? showHistory,
//   }) {
//     return SearchState(
//       searchHistory: searchHistory ?? this.searchHistory,
//       searchQuery: searchQuery ?? this.searchQuery,
//       searchResult: searchResult ?? this.searchResult,
//       showHistory: showHistory ?? this.showHistory,
//     );
//   }
//
//   const SearchState({
//     required this.searchHistory,
//     required this.searchQuery,
//     required this.searchResult,
//     required this.showHistory,
//   });
//
//   @override
//   List<Object> get props => [
//         searchHistory,
//         searchQuery,
//         searchResult,
//         showHistory,
//       ];
// }
