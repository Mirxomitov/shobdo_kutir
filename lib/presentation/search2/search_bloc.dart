import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shobdo_kutir/domain/main_repository.dart';

import '../../../data/model/book_data.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState(list: [])) {
    on<GetAllBooksS>((event, emit) async {
      var ls = await MainRepository().allBooks();
      emit(state.copyOf(list: ls));
    });

    on<SearchBooks>((event, emit) async {
      var ls = await MainRepository().allBooks();
      final filtered = ls.where((e) => e.name.toLowerCase().contains(event.value.toLowerCase())).toList();
      emit(state.copyOf(list: filtered));
    });
  }
}
