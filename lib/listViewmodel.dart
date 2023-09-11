import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taskapp/listdatamodel.dart';

class ListViewModel with ChangeNotifier {
  List<ListDatamodel> list = [];
List<int>_pos=[];
List<int> get pos=>_pos;
  getdata() async {

      final response = await http.get(
          Uri.parse('https://date.nager.at/api/v3/PublicHolidays/2023/JP'));
      List<ListDatamodel> temp = (jsonDecode(response.body) as List)
          .map((itemWord) => ListDatamodel.fromJson(itemWord))
          .toList();
      print(temp);
      list = temp;
      notifyListeners();
      return temp;

  }

  setbookmark(int index) {
    final exist=_pos.contains(index);
    if(exist){
      _pos.remove(index);
    }else{
      _pos.add(index);
    }

    notifyListeners();
  }

isexist(int index){
  final exist=_pos.contains(index);
return exist;
}
}
