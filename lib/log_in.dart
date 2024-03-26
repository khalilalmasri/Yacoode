// ignore: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:yacoode/ui/splash/splash_page.dart';
// import 'package:yacoode/ui/splash/splash_page.dart';

// import 'DashBoard.dart';
// import 'PlayList.dart';

bool success = false;
String errorMessage = '';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<void> _login(String email, String password) async {
    final Uri url = Uri.parse('http://api.feesolution.com/api/client/login');
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{
        'phone_number': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json; charset=UTF-8",
      },
    );
    final responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      success = true;
      errorMessage = '';
    } else {
      success = false;
      errorMessage = responseData['message'].toString();
    }
  }

  Future<String?> _authUser(LoginData data) {
    _login(data.name, data.password);
    return Future.delayed(loginTime).then((_) {
      if (!success) {
        return errorMessage;
      } else {
        return null;
      }
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Email: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'BUDDY login',
      userValidator: (value) {
        return null;
      },

      onLogin: _authUser,
      userType: LoginUserType.phone,
      onSignup: _signupUser,

      // loginProviders: <LoginProvider>[
      //   LoginProvider(
      //     // icon: FontAwesomeIcons.google,
      //     icon: Icons.abc_outlined,
      //     label: 'Google',
      //     callback: () async {
      //       debugPrint('start google sign in');
      //       await Future.delayed(loginTime);
      //       debugPrint('stop google sign in');
      //       return "null";
      //     },
      //   ),
      // ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const SplashPage(
              // title: 'play',
              ),
        ));
      },
      // ignore: avoid_types_as_parameter_names
      onRecoverPassword: (string) {
        return null;
      },
    );
  }
}
