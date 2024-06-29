part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String chosenCategory;
  final List<BookData> booksByCategory;
  final List<String> allCategories;

  const HomeState({
    required this.chosenCategory,
    required this.booksByCategory,
    required this.allCategories,
  });

  factory HomeState.initial() {
    return const HomeState(chosenCategory: '', booksByCategory: [], allCategories: []);
  }

  @override
  List<Object> get props => [chosenCategory, booksByCategory];

  HomeState copyWith({
    String? category,
    List<BookData>? booksByCategory,
    List<String>? allCategories,
  }) {
    return HomeState(
      chosenCategory: category ?? this.chosenCategory,
      booksByCategory: booksByCategory ?? this.booksByCategory,
      allCategories: allCategories ?? this.allCategories,
    );
  }

  @override
  String toString() => 'HomeState(category: $chosenCategory, booksByCategory: $booksByCategory)';
}
