import 'package:http/http.dart' as http;
import 'package:pharma_guide/Guest/ApiGuest/MoreModel.dart';

Future<more> getMore(int id) async{
  String uri="https://pharmaguied555.000webhostapp.com/api/drug/"+"$id";
  final response=await http.get(uri);
  return moreFromJson(response.body);
}