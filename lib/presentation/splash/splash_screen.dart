import 'package:flutter/material.dart';
import 'package:shobdo_kutir/utils/commons/commons.dart';

import '../../data/local/pref_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4E4E4),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 40,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      'assets/bg_splash.png',
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Image.asset('assets/logo.png'),
                ),
              ),
            ),
            Expanded(
              flex: 60,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/book_splash.png',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      margin: const EdgeInsets.all(24.0),
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        borderRadius: circularBorder24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          PrefHelper.setIsLoggedIn(true);
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Row(
                          children: [
                            Text(
                              'Get Started',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              size: 24,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
