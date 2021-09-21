
import 'package:http/http.dart' as http;
import 'package:pharma_guide/Guest/ApiGuest/pharmacyModel.dart';
Future<List<Pharmacy>> getpharmacies(int id,String lat,String long) async {

   String uri="https://pharmaguied555.000webhostapp.com/api/getLoc/$id";
  //String uri="https://pharmaguied555.000webhostapp.com/api/getAllLoc/$id";
  var data={
    "latitude":lat,
    "longtude":long
  };
  final response=await http.post(uri,body:data);
  List pharmacys=pharmacyFromJson(response.body);
  return pharmacys;
}