// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shobdo_kutir/blocs/search/search_bloc.dart';
// import 'package:shobdo_kutir/presentation/home/components/book_item.dart';
// import 'package:shobdo_kutir/presentation/search/search_item.dart';
//
// import '../../domain/main_repository.dart';
//
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController searchController = TextEditingController();
//
//     return BlocConsumer<SearchBloc, SearchState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             flexibleSpace: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               color: Colors.grey[800],
//               child: TextField(
//                 controller: searchController,
//                 style: const TextStyle(color: Colors.white),
//                 cursorColor: Colors.white,
//                 onTap: () async {
//                   final list = await MainRepository().allBooks();
//                   print('search screen all books $list}');
//                 },
//                 decoration: const InputDecoration(
//                   hintText: 'search books...',
//                   hintStyle: TextStyle(color: Colors.white54),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(8)),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 onChanged: (value) {
//                   context.read<SearchBloc>().add(OnSearchQueryChangeEvent(value));
//                 },
//               ),
//             ),
//           ),
//           body: Expanded(
//             child: ListView.builder(
//               itemBuilder: (_, i) => state.showHistory
//                   ? SearchItem(title: state.searchHistory[i])
//                   : BookItem(
//                       path: context.read<SearchBloc>().state.searchResult[i].image,
//                       onClick: () {
//                         Navigator.pushNamed(
//                           context,
//                           '/play',
//                           arguments: context.read<SearchBloc>().state.searchResult[i],
//                         );
//                       },
//                     ),
//               itemCount: state.searchResult.length,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
