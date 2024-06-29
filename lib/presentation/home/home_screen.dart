import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shobdo_kutir/presentation/home/components/book_item.dart';

import '../../blocs/home/home_bloc.dart';
import 'components/category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(LoadCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  Navigator.pushNamed(context, '/search');
                },
              ),
            ],
            centerTitle: true,
            title: Text(
              'Explore',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // text category
                  // list of categories
                  const SizedBox(height: 12.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < context.read<HomeBloc>().state.allCategories.length; ++i)
                          state.allCategories.isEmpty
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Row(
                                    children: List.generate(
                                        5,
                                        (index) => Container(
                                              width: 100,
                                              height: 40,
                                              margin: const EdgeInsets.only(right: 8),
                                              color: Colors.white,
                                            )),
                                  ),
                                )
                              : CategoryItem(
                                  colorIndex: i,
                                  category: context.read<HomeBloc>().state.allCategories[i],
                                  onClick: () {
                                    context.read<HomeBloc>().add(LoadBooksByCategory(context.read<HomeBloc>().state.allCategories[i]));
                                  },
                                  isChosen: context.read<HomeBloc>().state.allCategories[i] == context.read<HomeBloc>().state.chosenCategory,
                                ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Expanded(
                    child: state.booksByCategory.isEmpty
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: GridView.builder(
                              itemCount: 6,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 3 / 5,
                              ),
                              itemBuilder: (_, i) => Container(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : GridView.builder(
                            itemCount: context.read<HomeBloc>().state.booksByCategory.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 3 / 5,
                            ),
                            itemBuilder: (_, i) => BookItem(
                              path: context.read<HomeBloc>().state.booksByCategory[i].image,
                              onClick: () {
                                Navigator.pushNamed(context, '/play', arguments: context.read<HomeBloc>().state.booksByCategory[i]);
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
