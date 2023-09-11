import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/listViewmodel.dart';
import 'package:taskapp/listdatamodel.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Japanese Holoday 2023'),
        ),
        body: ChangeNotifierProvider(
          create: (BuildContext context) => ListViewModel(),
          child: Builder(
            builder: (context) {
              var listnviewmodel =
                  Provider.of<ListViewModel>(context, listen: false);
              return Container(
                child: FutureBuilder(
                  future: listnviewmodel.getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ListDatamodel> list =
                          snapshot.data as List<ListDatamodel>;
                      return Container(
                        child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    listnviewmodel.setbookmark(index);
                                  });
                                },
                                title: Text(list[index].name!),
                                subtitle: Text(list[index].date!),
                                trailing: (listnviewmodel.isexist(index))
                                    ? Icon(Icons.bookmark)
                                    : Icon(Icons.bookmark_border),
                              );
                            }),
                      );
                    } else {
                      return Container(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              );
            },
          ),
        ));
  }
}
