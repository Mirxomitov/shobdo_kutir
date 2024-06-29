import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shobdo_kutir/utils/ui/registration_button.dart';
import 'package:shobdo_kutir/utils/ui/registration_field.dart';

import '../../blocs/login/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginState == LoginEnum.success) {
          Navigator.pushReplacementNamed(context, '/main');
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 45,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/bg_splash.png'),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('assets/ic_logo.png'),
                          const SizedBox(height: 20),
                          Text('Welcome back', style: textTheme.headlineMedium),
                          const SizedBox(height: 10),
                          Text(
                            'Sign in to continue',
                            style: textTheme.headlineSmall?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 55,
                    child: Column(
                      children: [
                        RegistrationField(controller: emailController, hintText: "Email Address"),
                        const SizedBox(height: 10),
                        RegistrationField(controller: passwordController, hintText: "Password"),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                        ),
                        state.loginState != LoginEnum.loading
                            ? RegistrationButton(
                                buttonText: 'SIGN IN',
                                onClick: () {
                                  context.read<LoginBloc>().add(LoginWithEmailEvent(email: emailController.text, password: passwordController.text));
                                },
                              )
                            : const SizedBox(
                                height: 48,
                                width: 48,
                                child: CircularProgressIndicator(),
                              ),
                        const SizedBox(height: 20),
                        Text(
                          'on sign in using',
                          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // TODO not implemented
                              },
                              child: Image.asset(
                                'assets/ic_google.png',
                                height: 36,
                                width: 36,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                // TODO not implemented
                              },
                              child: Image.asset(
                                'assets/ic_facebook.png',
                                height: 36,
                                width: 36,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            text: 'Do not have an account? ',
                            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(context, '/register');
                                  },
                                text: 'Register',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
