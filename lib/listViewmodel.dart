import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taskapp/listdatamodel.dart';

class ListViewModel with ChangeNotifier {
  List<ListDatamodel> list = [];

  getdata() async {
    final response = await http
        .get(Uri.parse('https://date.nager.at/api/v3/PublicHolidays/2023/JP'));
    List<ListDatamodel> temp = (jsonDecode(response.body) as List)
        .map((itemWord) => ListDatamodel.fromJson(itemWord))
        .toList();
    print(temp);
    list=temp;
    return temp;
  }
  setbookmark(int index){
    ListDatamodel data= list[index];
    list.removeAt(index);

    list.insert(index,ListDatamodel(date: data.date,localName: data.localName,name: data.name,countryCode: data.countryCode,fixed: true,global: data.global,counties: data.counties,launchYear: data.launchYear,types: data.types));

  notifyListeners();
  }

  removebookmark(int index){
    ListDatamodel data= list[index];
    list.removeAt(index);

    list.insert(index,ListDatamodel(date: data.date,localName: data.localName,name: data.name,countryCode: data.countryCode,fixed: false,global: data.global,counties: data.counties,launchYear: data.launchYear,types: data.types));

    notifyListeners();
  }
}
