import 'package:flutter/material.dart';
import 'package:prueba_gocho/ui/login/components/info_widget.dart';

import '../../domain/utils/constants.dart';
import 'components/login_widget.dart';
import 'components/signup_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLogin = true;

  void _changeBool() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Row(
          children: [
            _isLogin
                ? Expanded(
                    child: Column(
                      children: [
                        const LogInWidget(),
                        TextButton(
                            onPressed: _changeBool,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Ó REGISTRATE",
                                style: TextStyle(color: kcolorLogo),
                              ),
                            ))
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        const SignUpWidget(),
                        TextButton(
                            onPressed: _changeBool,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Ó INICIA SESION",
                                style: TextStyle(color: kcolorLogo),
                              ),
                            ))
                      ],
                    ),
                  ),
            const Expanded(child: InfoWidget()),
          ],
        ),
      ),
    );
  }
}
