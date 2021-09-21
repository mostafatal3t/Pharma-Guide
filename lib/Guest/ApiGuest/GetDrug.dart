

import 'package:http/http.dart' as http;
import 'package:pharma_guide/Guest/ApiGuest/DrugModel.dart';
Future<List<Drug>> Search(String s) async{
  String url="https://pharmaguied555.000webhostapp.com/api/drugs";
  final response =await http.post(url,body:{"search":s});
  return DrugFromJson(response.body);
}
