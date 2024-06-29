// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:shobdo_kutir/domain/main_repository.dart';
//
// import '../../data/model/book_data.dart';
//
// part 'search_event.dart';
// part 'search_state.dart';
//
// class SearchBloc extends Bloc<SearchEvent, SearchState> {
//   final _repository = MainRepository();
//   final _allSearches = MainRepository().getSearchHistory();
//   final _allBooks = MainRepository().allBooks();
//
//   SearchBloc() : super(SearchState.initial()) {
//     on<OnSearchQueryChangeEvent>((event, emit) async {
//       if (state.showHistory) {
//         emit(state.copyWith(searchQuery: event.query, searchHistory: [
//           ..._allSearches.where((e) => e.toLowerCase().contains(event.query.toLowerCase())),
//         ]));
//       } else {
//         final books = await _allBooks;
//         final filtered = books.where((e) => e.name.toLowerCase().contains(event.query.toLowerCase())).toList();
//
//         emit(state.copyWith(searchQuery: event.query, searchResult: filtered));
//       }
//     });
//
//     on<OnSearchedEvent>((event, emit) {
//       _repository.saveSearchHistory(event.query);
//       emit(state.copyWith(showHistory: false));
//     });
//
//     on<OnSearchFieldTapEvent>((event, emit) {
//       emit(state.copyWith(showHistory: true, searchHistory: _allSearches));
//     });
//
//     on<OnSearchedItemTapEvent>((event, emit) {});
//     on<OnSearchHistoryItemTapEvent>((event, emit) {});
//   }
// }
