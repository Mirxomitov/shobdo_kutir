import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shobdo_kutir/blocs/home/home_bloc.dart';
import 'package:shobdo_kutir/blocs/search/search_bloc.dart';
import 'package:shobdo_kutir/presentation/home/home_screen.dart';

import '../../blocs/main/main_bloc.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';
import '../search2/search_bloc.dart';
import '../search2/search_screen.dart';
import 'bottom_nav_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: IndexedStack(
              index: state.screenIndex,
              children: [
                BlocProvider(
                  create: (context) => HomeBloc(),
                  child: const HomeScreen(),
                ),
                BlocProvider(
                  create: (context) => SearchBloc(),
                  child: SearchScreen(),
                ),
                const Placeholder(),
                const ProfileScreen(),
              ],
            ),
          ),
          floatingActionButton: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Visibility(
              visible: !keyboardIsOpen,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  size: 42,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.white24,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBottomNavigationItem(Icons.home, 'Home', 0, (int index) => _updateIndex(index, context), state.screenIndex),
                buildBottomNavigationItem(Icons.search, 'Search', 1, (int index) => _updateIndex(index, context), state.screenIndex),
                const SizedBox(width: 36),
                buildBottomNavigationItem(Icons.library_books, 'Library', 2, (int index) => _updateIndex(index, context), state.screenIndex),
                buildBottomNavigationItem(Icons.person, 'Profile', 3, (int index) => _updateIndex(index, context), state.screenIndex),
              ],
            ),
          ),
        );
      },
    );
  }

  _updateIndex(int index, BuildContext context) {
    context.read<MainBloc>().add(MainChangeScreenEvent(screenIndex: index));
  }
}
