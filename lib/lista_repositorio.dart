import 'package:MyResumeApp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/repository.dart';

class ListRepository extends StatelessWidget {
  const ListRepository({Key? key, required this.repositories});

  final List<Repository> repositories;

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
                bottom: TabBar(
                    indicatorColor: Theme.of(context).backgroundColor,
                    tabs: [
                      Tab(
                        text: "GitHub",
                      ),
                      Tab(
                        text: "Currículo",
                      )
                    ]),
              ),
            ),
            body: TabBarView(children: [
              Flexible(
                child: Container(
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
                                                onPressed: () async {
                                                  var url = repositories[index]
                                                      .htmlurl;
                                                  try {
                                                    await launchUrl(
                                                        Uri.parse(url));
                                                  } catch (e) {}

                                                  // if (await canLaunchUrl(
                                                  //     Uri.parse(url))) {
                                                  //   await launchUrl(
                                                  //       Uri.parse(url));
                                                  // } else {
                                                  //   ScaffoldMessenger.of(
                                                  //           context)
                                                  //       .showSnackBar(SnackBar(
                                                  //           duration:
                                                  //               const Duration(
                                                  //                   seconds: 4),
                                                  //           content: Text(
                                                  //               "Url Inválida $url")));
                                                  // }
                                                },
                                                child:
                                                    Text("Abrir Repositório")),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                DateFormat(
                                                        "'Criado em' : dd/MM/yyyy")
                                                    .format(repositories[index]
                                                        .created_at)
                                                    .toString(),
                                                style: TextStyle(fontSize: 12),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                DateFormat(
                                                        "'Última Atualização' : dd/MM/yyyy")
                                                    .format(repositories[index]
                                                        .updated_at)
                                                    .toString(),
                                                style: TextStyle(fontSize: 12),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 300,
                                child: Container(
                                  width: 80,
                                  height: 20,
                                  color:
                                      retornaCor(repositories[index].language),
                                  child: Text(
                                    repositories[index].language == null
                                        ? "-"
                                        : "${repositories[index].language}",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ]),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Experiências",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).backgroundColor),
                        ),
                      ),
                      Divider(
                          thickness: 5,
                          color: Theme.of(context).backgroundColor),
                      RichText(
                          text: TextSpan(
                              text: "",
                              style: TextStyle(fontSize: 16),
                              children: [
                            TextSpan(
                                text: "Junior Mobile Developer ",
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: " - Datka (2021 - 2022)",
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor)),
                          ])),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Theme.of(context).canvasColor,
                          child: Text(
                              "Desenvolvedor de 3 apps publicados na google play utilizando a linguagem Flutter, elaboração de documentações, Desenvolvedor Web adicionando novas funções ao site da empresa e fui gerenciador do Google Console onde publica o app."),
                        ),
                      ),
                      RichText(
                          text: TextSpan(
                              text: "",
                              style: TextStyle(fontSize: 16),
                              children: [
                            TextSpan(
                                text: "Jovem Aprendiz",
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: " - NEWE Seguros (2019 - 2020)",
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor)),
                          ])),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: Theme.of(context).canvasColor,
                          child: Text(
                              "Aprendiz na área de administração e suporte de TI. Foram várias atividades administrativas, organização de documentos, problemas na impressora, impressão de documentos, utilização de exel eword para documentação, suporte aos usuários com problemas na máquina"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Formação Acadêmica",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).backgroundColor),
                        ),
                      ),
                      Divider(
                          thickness: 5,
                          color: Theme.of(context).backgroundColor),
                      Container(
                          color: Theme.of(context).canvasColor,
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                  "UNOPAR - Análise e Desenvolvimento de Sistemas (2019 - 2022)"),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Certificados e Cursos",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).backgroundColor),
                        ),
                      ),
                      Divider(
                          thickness: 5,
                          color: Theme.of(context).backgroundColor),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                                "Desenvolvendo Mobile com Android Studio -  2023"),
                            Text("Udemy Flutter -  2021"),
                            Text("Língua Inglesa: Basic Review -  2019"),
                            Text("Curso Técnico Senac -  2017"),
                            Text("Curso Montagem e Manutenção -  2015"),
                            Text("FIRJAN SENAI -  2016"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
          backgroundColor: Theme.of(context).backgroundColor,
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.phone),
                ),
                Text("(21) 991157104"),
              ],
            )
          ],
        ),
      ),
    ],
  );
}

Color retornaCor(String? linguagem) {
  if (linguagem == 'Dart') {
    return Color(0xFF00B4AB);
  } else if (linguagem == 'PHP') {
    return Color(0xFF4F5D95);
  } else if (linguagem == 'HTML') {
    return Color(0xFFe44b23);
  } else if (linguagem == 'Java') {
    return Color(0xFFb07219);
  } else if (linguagem == 'CSS') {
    return Color(0xFF563d7c);
  }

  return Colors.red;
}
