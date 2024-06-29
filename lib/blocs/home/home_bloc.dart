import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shobdo_kutir/data/model/book_data.dart';
import 'package:shobdo_kutir/domain/main_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _mainRepository = MainRepository();

  HomeBloc() : super(HomeState.initial()) {
    on<LoadCategories>((event, emit) async {
      final categories = await _mainRepository.getCategories();
      emit(state.copyWith(allCategories: categories));

      if (categories.isNotEmpty) {
        add(LoadBooksByCategory(categories.first));
      }
    });

    on<LoadBooksByCategory>((event, emit) async {
      final books = await _mainRepository.getBooksByCategory(event.category);
      emit(state.copyWith(category: event.category, booksByCategory: books));
      print(' category ${event.category}  books by category: ${state.booksByCategory.length}');
    });
  }
}
