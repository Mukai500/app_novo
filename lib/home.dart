import 'dart:async';

import 'package:app_novo/lista_repositorio.dart';
import 'package:app_novo/models/repository.dart';
import 'package:app_novo/widgets/change_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Future<All> fetchRepos() async {
//   if (response.statusCode == 200) {
//     print(response.body);
//     return All.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Falha ao recuperar');
//   }
// }

class _HomeState extends State<Home> {
  var _repositorios = <Repository>[];
  var _owner = <Owner>[];

  Future<void> searchRepositories() async {
    final response =
        await http.get(Uri.parse('http://api.github.com/users/NSuzano/repos'));
    var data = jsonDecode(response.body);

    debugPrint("DATA: ${data[0]['owner']}");

    setState(() {
      _repositorios =
          (data as List).map((e) => Repository.fromJson(e)).toList();
      _repositorios.forEach((elements) {
        print(elements.name);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchRepositories();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Row(
                children: [
                  Icon(Icons.dark_mode),
                  BotaoMudarTema(),
                ],
              )
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(child: ListRepository(repositories: _repositorios))
              ],
            ),
          )),
    );
  }
}
