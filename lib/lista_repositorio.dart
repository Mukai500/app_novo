import 'package:app_novo/models/repository.dart';
import 'package:flutter/material.dart';

class ListRepository extends StatelessWidget {
  const ListRepository({Key? key, required this.repositories});

  final List<Repository> repositories;

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LighTheme';

    return Column(
      children: [
        Center(
          child: Column(children: []),
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: repositories.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    elevation: 5.0,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.network(
                              "${repositories[index].owner?.avatarUrl}"),
                          title: Text("${repositories[index].name}"),
                          subtitle: Text("${repositories[index].description}"),
                        ),
                        ButtonBar(
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: Text("Abrir Repositório"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
