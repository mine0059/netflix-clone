import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/helper/message/display_message.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/confiqs/theme/app_colors.dart';
import 'package:netflix/data/auth/models/auth/signup_req_params.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';
import 'package:netflix/presentation/auth/pages/signin.dart';
import 'package:netflix/presentation/home/pages/home.dart';
import 'package:netflix/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscureText = false;
  final TextEditingController _emailCon = TextEditingController();

  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signupText(),
            const SizedBox(
              height: 30,
            ),
            _emailField(),
            const SizedBox(
              height: 20,
            ),
            _passwordField(),
            const SizedBox(
              height: 60,
            ),
            _signupButton(context),
            const SizedBox(
              height: 20,
            ),
            _signinText(context)
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign Up',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        hintText: 'Password',
      ),
    );
  }

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
        title: 'Sign Up',
        activeColor: AppColors.primary,
        onPressed: () async => await sl<SignupUseCase>().call(
                params: SignupReqParams(
              email: _emailCon.text,
              password: _passwordCon.text,
            )),
        onSuccess: () {
          AppNavigation.pushAndRemove(context, const HomePage());
        },
        onFailure: (error) {
          DisplayMessage.errorMessage(error, context);
        });
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Do you have account?"),
      TextSpan(
          text: ' Sign In',
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigation.push(context, const SigninPage());
            })
    ]));
  }
}
