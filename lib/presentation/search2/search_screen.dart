import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shobdo_kutir/presentation/search2/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              SizedBox(height: 36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  onChanged: (value) {
                    context.read<SearchBloc>().add(SearchBooks(value: value));
                  },
                  decoration: InputDecoration(
                    hintText: 'search books',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF26B6C), width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.65,
                ),
                itemCount: state.list!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/play',
                        arguments: state.list![index],
                      );
                    },
                    child: Container(
                      width: double.maxFinite,
                      color: Colors.white,
                      child: Center(
                          child: Image.network(
                        state.list![index].image,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }
                        },
                      )),
                    ),
                  );
                },
              )
            ],
          )),
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
