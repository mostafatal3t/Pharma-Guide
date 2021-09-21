
import 'package:http/http.dart' as http;
import 'package:pharma_guide/Guest/ApiGuest/SimilersModel.dart';
Future<List<Similer>> getSimiler(int id) async {
  String uri="https://pharmaguied555.000webhostapp.com/api/similer/"+"$id";
  final response=await http.get(uri);
  List data=SimilerFromJson(response.body);
  return data;
}