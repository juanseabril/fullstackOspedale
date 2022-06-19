// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:prueba_gocho/domain/models/user.dart';
import 'package:prueba_gocho/domain/utils/constants.dart';

import '../../data/backend/users/fetch.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late User? _user = User(
      userCreation: '',
      userDateOfBorn: '',
      userDocument: 0,
      userEpsId: '',
      userId: 0,
      userName: '',
      userGenre: '',
      userPhone: 0,
      userPassword: '',
      userRoleId: null);
  int _edad = 0;
  late bool _isEditing = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController documentController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController edadController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController epsController = TextEditingController();
  TextEditingController rolController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _getData(String username) async {
    _user = (await ApiService().getUserByName(username));
    final _fechadeNac = DateTime.parse(_user!.userDateOfBorn);
    final _fechaAct = DateTime.now();
    final _diastotales = _fechaAct.difference(_fechadeNac).inDays;
    final _edaddias = _diastotales / 365;

    setState(() {
      _edad = _edaddias.toInt();
    });

    Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => setState(() {}));
  }

  void _lateDelete(int id) async {
    (await ApiService().deleteUser(id));
    Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final userName = (ModalRoute.of(context)?.settings.arguments).toString();
    _getData(userName);

    return Material(
      child: SingleChildScrollView(
        child: Container(
          color: _edad > 50
              ? Colors.red
              : _edad < 18
                  ? Colors.green
                  : kcolorBG,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Nombre",
                            style: kstyleTable,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Documento",
                            style: kstyleTable,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Genero",
                            style: kstyleTable,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Edad",
                            style: kstyleTable,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Telefono",
                            style: kstyleTable,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Eps",
                            style: kstyleTable,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Rol",
                            style: kstyleTable,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              const Divider(color: Colors.white),
              _isEditing
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 70,
                                    child: Center(
                                      child: TextField(
                                        controller: nameController,
                                        style: kstyleSubTable,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 70,
                                    child: Center(
                                      child: TextField(
                                        controller: documentController,
                                        style: kstyleSubTable,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 70,
                                    child: Center(
                                      child: TextField(
                                        controller: genreController,
                                        style: kstyleSubTable,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 70,
                                    child: Center(
                                      child: TextField(
                                        controller: edadController,
                                        style: kstyleSubTable,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 70,
                                    child: Center(
                                      child: TextField(
                                        controller: phoneController,
                                        style: kstyleSubTable,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 70,
                                    child: Center(
                                      child: TextField(
                                        controller: epsController,
                                        style: kstyleSubTable,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 70,
                                    child: Center(
                                      child: TextField(
                                        controller: rolController,
                                        style: kstyleSubTable,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ApiService().putUser(User(
                                      userId: _user!.userId,
                                      userName: nameController.text,
                                      userDocument:
                                          int.parse(documentController.text),
                                      userPassword: _user!.userPassword,
                                      userGenre: genreController.text,
                                      userDateOfBorn: _user!.userDateOfBorn,
                                      userPhone:
                                          int.parse(phoneController.text),
                                      userEpsId: epsController.text,
                                      userRoleId: rolController.text,
                                      userCreation: DateTime.now().toString()));
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: kcolorLogo,
                                ),
                                child: const Text('GUARDAR'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _lateDelete(_user!.userId);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: const Text('ELIMINAR'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        _user!.userName,
                                        style: kstyleSubTable,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        '${_user!.userDocument}',
                                        style: kstyleSubTable,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        _user!.userGenre,
                                        style: kstyleSubTable,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        '$_edad',
                                        style: kstyleSubTable,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        '${_user!.userPhone}',
                                        style: kstyleSubTable,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        _user!.userEpsId,
                                        style: kstyleSubTable,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        '${_user!.userRoleId}',
                                        style: kstyleSubTable,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isEditing = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: kcolorLogo,
                                ),
                                child: const Text('EDITAR'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _lateDelete(_user!.userId);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: const Text('ELIMINAR'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
