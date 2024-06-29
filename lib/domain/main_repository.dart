import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shobdo_kutir/data/local/pref_helper.dart';

import '../data/model/book_data.dart';

class MainRepository {
  static final MainRepository _instance = MainRepository._internal();

  factory MainRepository() => _instance;

  MainRepository._internal();

  final _firestore = FirebaseFirestore.instance;

  Future<List<String>> getCategories() async {
    QuerySnapshot querySnapshot = await _firestore.collection('books').get();
    Set<String> categories = {};

    for (var doc in querySnapshot.docs) {
      if (doc['category'] != null) {
        categories.add(doc['category']);
      }
    }

    return categories.toList();
  }

  Future<List<BookData>> getBooksByCategory(String category) async {
    QuerySnapshot querySnapshot = await _firestore.collection('books').where('category', isEqualTo: category).get();
    return querySnapshot.docs.map((doc) => BookData.fromFirestore(doc)).toList();
  }

  List<String> getSearchHistory() => PrefHelper.getSearchHistory();

  Future<void> saveSearchHistory(String search) async => PrefHelper.saveSearchHistory(search);

  Future<List<BookData>> allBooks() async {
    QuerySnapshot querySnapshot = await _firestore.collection('books').get();
    return querySnapshot.docs.map((doc) => BookData.fromFirestore(doc)).toList();
  }
}
