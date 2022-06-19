import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:prueba_gocho/ui/data/data_page.dart';

import 'domain/utils/constants.dart';
import 'ui/login/login_page.dart';

void main() {
  runApp(const Clinica());
}

class Clinica extends StatelessWidget {
  const Clinica({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'G8 Prueba',
      theme: ThemeData(primaryColor: kcolorLogo),
      routes: {
        "loginPage": (context) => const LoginPage(),
        "dataPage": (context) => const DataPage(),
      },
      home: const LoginPage(),
    );
  }
}
