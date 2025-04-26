import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/helper/message/display_message.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/confiqs/theme/app_colors.dart';
import 'package:netflix/data/auth/models/auth/signin_req_params.dart';
import 'package:netflix/domain/auth/usecases/signin.dart';
import 'package:netflix/presentation/auth/pages/signup.dart';
import 'package:netflix/presentation/home/pages/home.dart';
import 'package:netflix/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _obscureText = true;

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
              _signinText(),
              const SizedBox(height: 30),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(),
              const SizedBox(height: 60),
              _singinButton(context),
              const SizedBox(height: 20),
              _signupText(context),
            ],
          )),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: "Email",
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      obscureText: _obscureText,
      decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )),
    );
  }

  Widget _singinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => await sl<SigninUseCase>().call(
        params: SigninReqParams(
          email: _emailCon.text,
          password: _passwordCon.text,
        ),
      ),
      onSuccess: () {
        AppNavigation.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        print("Signin failure: $error");
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Don't you have account?"),
      TextSpan(
          text: 'Sign Up',
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigation.push(context, SignupPage());
            })
    ]));
  }
}
