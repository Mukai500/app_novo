import 'package:app_novo/models/repository.dart';
import 'package:app_novo/providers/theme_provider.dart';
import 'package:flutter/material.dart';

class ListRepository extends StatelessWidget {
  const ListRepository({Key? key, required this.repositories});

  final List<Repository> repositories;

  Widget retornaLinguagem(String? linguagem) {
    if (linguagem == 'Dart') {
      return Container(
        width: 50,
        height: 20,
        color: Color(0xFF00B4AB),
        child: Text(
          linguagem!,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    } else if (linguagem == 'PHP') {
      return Container(
        width: 50,
        height: 20,
        color: Color(0xFF4F5D95),
        child: Text(
          linguagem!,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    } else if (linguagem == 'HTML') {
      return Container(
        width: 50,
        height: 20,
        color: Color(0xFFe44b23),
        child: Text(
          linguagem!,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    } else if (linguagem == 'Java') {
      return Container(
        width: 50,
        height: 20,
        color: Color(0xFFb07219),
        child: Text(
          linguagem!,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    } else if (linguagem == 'CSS') {
      return Container(
        width: 50,
        height: 20,
        color: Color(0xFF563d7c),
        child: Text(
          linguagem!,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    return Container(
      width: 50,
      height: 20,
      color: Colors.red,
      child: Text(
        "-",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LighTheme';

    ThemeProvider teste = ThemeProvider();

    print(teste.isDarkMode);

    return Column(
      children: [
        _buildHeader(context),
        _buildTitle("Skills"),
        _buildRow("Flutter", 0.8),
        _buildRow("Dart", 0.85),
        _buildRow("JavaScript", 0.5),
        _buildRow("PHP", 0.55),
        Expanded(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                bottom: TabBar(tabs: [
                  Tab(
                    text: "GitHub",
                  ),
                  Tab(
                    text: "Teste",
                  )
                ]),
              ),
            ),
            body: TabBarView(children: [
              Flexible(
                child: Container(
                  color: Colors.black26,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: repositories.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(children: [
                              Card(
                                elevation: 5.0,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Image.network(
                                          "${repositories[index].owner?.avatarUrl}"),
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${repositories[index].name}      ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      subtitle: Text(repositories[index]
                                                  .description ==
                                              null
                                          ? "Descrição: Sem descrição"
                                          : "Descrição: ${repositories[index].description}"),
                                    ),
                                    Column(
                                      children: [
                                        ButtonBar(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {},
                                                child:
                                                    Text("Abrir Repositório")),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  left: 300,
                                  child: retornaLinguagem(
                                      repositories[index].language)),
                            ]),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Container(),
            ]),
          ),
        ),
      ],
    );
  }
}

Padding _buildTitle(String titulo) {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0),
    child: Text(
      titulo.toUpperCase(),
      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
    ),
  );
}

Row _buildRow(String skill, double valor) {
  return Row(
    children: [
      SizedBox(
        width: 10.0,
      ),
      Expanded(
          flex: 2,
          child: Text(
            skill,
            textAlign: TextAlign.right,
          )),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
          flex: 4,
          child: LinearProgressIndicator(
            value: valor,
          ))
    ],
  );
}

Row _buildHeader(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 110.0,
        height: 110.0,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Color.fromRGBO(186, 104, 200, 1),
          child: CircleAvatar(
            radius: 49,
            backgroundImage: AssetImage('assets/nathan_picture.jpg'),
          ),
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nathan Suzano Sineiro",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.email),
                ),
                Text("nathan.suzano@gmail.com")
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.location_on),
                ),
                Text("Rio de Janeiro, Brazil")
              ],
            ),
            Row(
              children: [Container()],
            )
          ],
        ),
      ),
    ],
  );
}
