part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBooksByCategory extends HomeEvent {
  final String category;

  LoadBooksByCategory(this.category);

  @override
  List<Object> get props => [category];
}

class LoadCategories extends HomeEvent {
  @override
  List<Object> get props => [];
}
