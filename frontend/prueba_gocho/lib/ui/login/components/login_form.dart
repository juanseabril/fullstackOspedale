// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:prueba_gocho/domain/models/user.dart';
import 'package:prueba_gocho/domain/utils/constants.dart';

import '../../../data/backend/users/fetch.dart';
import '../../../domain/utils/globals.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late User? _user;
  late String? _pass;

  @override
  void initState() {
    super.initState();
  }

  void _getUserByName(String name, String pass) async {
    _user = (await ApiService().getUserByName(name));
    _pass = pass;
    if (_pass == _user!.userPassword) {
      Navigator.of(context).pushNamed("dataPage",
          arguments: glogInFormKey.currentState!.value['name']);
    } else {
      //print("Algo salio mal");
    }
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: kstyleTitle2,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: FormBuilder(
                key: glogInFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FormBuilderTextField(
                        name: 'name',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Ingrese mas información'),
                          FormBuilderValidators.minLength(4,
                              errorText: 'Ingrese mas información'),
                        ]),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.verified_user,
                              color: Colors.black,
                              size: 30,
                            ),
                            hintText: "Ingresa tu nombre",
                            labelText: "Nombre")),
                    FormBuilderTextField(
                        name: 'password',
                        obscureText: true,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(
                                errorText: 'Ingrese mas información'),
                            FormBuilderValidators.minLength(6,
                                errorText: 'Ingrese mas información'),
                          ],
                        ),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.abc,
                              color: Colors.black,
                              size: 30,
                            ),
                            hintText: "Ingresa tu password",
                            labelText: "Password")),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (glogInFormKey.currentState!.saveAndValidate()) {
                          _getUserByName(
                              glogInFormKey.currentState!.value['name'],
                              glogInFormKey.currentState!.value['password']);

                          glogInFormKey.currentState!.reset();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: kcolorLogo,
                      ),
                      child: const Text('LOG IN'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
