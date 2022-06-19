import 'package:flutter/material.dart';

import '../../../domain/utils/constants.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: kcolorBG,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "g8_logo.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Plataforma Usuarios",
                style: kstyleTitle,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Consulta información de pacientes en nuestra base de datos.",
                style: kstyleSubtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
