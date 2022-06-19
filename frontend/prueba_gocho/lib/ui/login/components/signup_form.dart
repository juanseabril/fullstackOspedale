import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:prueba_gocho/data/backend/users/fetch.dart';
import 'package:prueba_gocho/domain/models/user.dart';
import 'package:prueba_gocho/domain/utils/constants.dart';

import '../../../domain/utils/globals.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);

  final listaEps = ['Sanitas', 'Famisanar', 'Compensar', 'Otra'];
  final listaRoles = ['Paciente', 'Doctor', 'Admin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Registro",
                style: kstyleTitle2,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: FormBuilder(
                  key: gsignUpFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FormBuilderTextField(
                          name: 'name',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
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
                          name: 'document',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Ingrese mas información'),
                            FormBuilderValidators.minLength(8,
                                errorText: 'Ingrese mas información'),
                          ]),
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.document_scanner,
                                color: Colors.black,
                                size: 30,
                              ),
                              hintText: "Ingresa tu documento",
                              labelText: "Documento")),
                      FormBuilderTextField(
                          name: 'password',
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
                      FormBuilderRadioGroup<String>(
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.people,
                              color: Colors.black,
                              size: 30,
                            ),
                            hintText: "Ingresa tu genero",
                            labelText: "Genero"),
                        initialValue: null,
                        name: 'genre',
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        options: [
                          'Femenino',
                          'Masculino',
                          'No se identifica',
                          'Otro'
                        ]
                            .map((lang) => FormBuilderFieldOption(
                                  value: lang,
                                  child: Text(lang),
                                ))
                            .toList(growable: false),
                        controlAffinity: ControlAffinity.trailing,
                      ),
                      FormBuilderDateTimePicker(
                        name: 'dateofborn',
                        inputType: InputType.date,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.black,
                            size: 30,
                          ),
                          hintText: "Ingresa tu fecha de nacimiento",
                          labelText: 'Fecha de Nacimiento',
                        ),
                      ),
                      FormBuilderTextField(
                          name: 'phone',
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
                                Icons.phone,
                                color: Colors.black,
                                size: 30,
                              ),
                              hintText: "Ingresa tu telefono",
                              labelText: "Telefono")),
                      FormBuilderRadioGroup<String>(
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.numbers,
                              color: Colors.black,
                              size: 30,
                            ),
                            hintText: "Ingresa tu eps",
                            labelText: "Eps"),
                        initialValue: null,
                        name: 'eps',
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        options: listaEps
                            .map((lang) => FormBuilderFieldOption(
                                  value: listaEps.indexOf(lang).toString(),
                                  child: Text(lang),
                                ))
                            .toList(growable: false),
                        controlAffinity: ControlAffinity.trailing,
                      ),
                      FormBuilderRadioGroup<String>(
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.verified_user,
                              color: Colors.black,
                              size: 30,
                            ),
                            hintText: "Ingresa tu rol",
                            labelText: "Rol"),
                        initialValue: null,
                        name: 'rol',
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        options: listaRoles
                            .map((lang) => FormBuilderFieldOption(
                                  value: listaRoles.indexOf(lang).toString(),
                                  child: Text(lang),
                                ))
                            .toList(growable: false),
                        controlAffinity: ControlAffinity.trailing,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (gsignUpFormKey.currentState!.saveAndValidate()) {
                            ApiService().postUser(User(
                                userId: 1,
                                userName:
                                    gsignUpFormKey.currentState!.value['name'],
                                userDocument: int.parse(gsignUpFormKey
                                    .currentState!.value['document']),
                                userPassword: gsignUpFormKey
                                    .currentState!.value['password'],
                                userGenre:
                                    gsignUpFormKey.currentState!.value['genre'],
                                userDateOfBorn: gsignUpFormKey
                                    .currentState!.value['dateofborn']
                                    .toString(),
                                userPhone: int.parse(gsignUpFormKey
                                    .currentState!.value['phone']),
                                userEpsId:
                                    gsignUpFormKey.currentState!.value['eps'],
                                userRoleId:
                                    gsignUpFormKey.currentState!.value['rol'],
                                userCreation: DateTime.now().toString()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kcolorLogo,
                        ),
                        child: const Text('REGISTRARME'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
