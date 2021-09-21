import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
class CardOfAdd extends StatefulWidget {
  final String drugName;
  final String drugForm;
  final int x;
  final int y;
  final String status;
  CardOfAdd(this.drugName,  this.drugForm, this.x, this.y,this.status);
  @override
  _CardOfAddState createState() => _CardOfAddState(this.drugName,  this.drugForm, this.x, this.y ,this.status );
}

class _CardOfAddState extends State<CardOfAdd> {
  final String drugName;
  final String drugForm;
  final int x;
  final int y;
  final String status;


  _CardOfAddState(@required this.drugName, @required this.drugForm,@required this.x,@required this.y , @required this.status);


  Widget _widget=Icon(
    Icons.add,
    color: Color(0xFF240b36),
    size: 40,
  );
  Widget _s1 =Icon(
    Icons.add,
    color: Color(0xFF240b36),
    size: 40,
  );
  Widget _s2 =Icon(
    Icons.delete,
    color: Color(0xFFc31432),
    //Color(0xFF240b36)
    //Color(0xFFc31432)
    size: 40,
  );
  Widget _s3 = SpinKitWave(
    size: 20,
    color: Color(0xFF240b36),
  );
  void Addone() async {
    setState(() {
      _widget=_s3;
    });
    String uri = "https://pharmaguied555.000webhostapp.com/api/addDrug/$x/$y";
    final res=await http.post(uri);
    if(jsonDecode(res.body)=="Done"){
      setState(() {
        _widget=_s2;
      });
    }

    else{
      setState(() {
        _widget=_s2;
      });
    }
  }
  void Removeone() async {
    setState(() {
      _widget=_s3;
    });
    String uri =
        "https://pharmaguied555.000webhostapp.com/api/deleteDrug/$x/$y";
    final res=await http.post(uri);
    if(jsonDecode(res.body)=="Done"){
      setState(() {
        _widget=_s1;
      });
    }else{
      setState(() {
        _widget=_s1;
      });
    }
  }
  //Function select;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(status=="n"){
      setState(() {
        _widget=_s1;
        //    select=Addone;
      });
    }else{
      setState(() {
        _widget=_s2;
        //  select = Removeone;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    double w = MediaQuery.of(context).size.width;
    return Card(
        color: Color(0xFFEFEFEF),
        borderOnForeground: true,
        shadowColor: Colors.black,
        margin: EdgeInsets.only(left: 15, right: 15, top: 6),
        child: Container(
          width: w - 30,
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$drugName",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'OpenSansR',
                            color: Color(0xFFc31432)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$drugForm",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'OpenSansR',
                            color: Color(0xFF240b36)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(alignment: Alignment.centerRight, child:IconButton(icon:_widget, onPressed: _widget==_s1 ? Addone:Removeone,)),
            ],
          ),
        ));
  }
}



// class CardOfAdd extends StatefulWidget {
//   final String drugName;
//   final String drugForm;
//   final int x;
//   final int y;
//
//   CardOfAdd(this.drugName, this.drugForm, this.x, this.y);
//
//   @override
//   _CardOfAddState createState() =>
//       _CardOfAddState(this.drugName, this.drugForm, this.x, this.y);
// }
//
// class _CardOfAddState extends State<CardOfAdd> {
//   final String drugName;
//   final String drugForm;
//   final int x;
//   final int y;
//
//   _CardOfAddState(@required this.drugName, @required this.drugForm,
//       @required this.x, @required this.y);
//   int s = 0;
//   Widget  _d2=Icon(
//     Icons.delete,
//     color:Color(0xFFc31432) ,
//     size: 40,
//   );
//   Widget _d1=Icon(
//   Icons.delete,
//   color:Colors.white ,
//   size: 40,
//   );
//   Widget _widget = Icon(
//     Icons.add,
//     color: Color(0xFF240b36),
//     size: 40,
//   );
//   Widget _widget2 = Icon(
//     Icons.delete,
//     color:Colors.white ,
//     size: 40,
//   );
//   Widget _s1 = Icon(
//     Icons.add,
//     color: Color(0xFF240b36),
//     size: 40,
//   );
//   Widget _s4 = Icon(
//     Icons.check_outlined,
//     color: Color(0xFF240b36),
//     size: 40,
//   );
//
//   Widget _s3 = SpinKitWave(
//     size: 20,
//     color: Color(0xFF240b36),
//   );
//
//   void Addone() async {
//     setState(() {
//       _widget = _s3;
//     });
//     String uri = "https://pharmaguied555.000webhostapp.com/api/addDrug/$x/$y";
//     final res = await http.post(uri);
//     if (jsonDecode(res.body) == "done") {
//       Fluttertoast.showToast(msg: "Done", toastLength: Toast.LENGTH_SHORT);
//       setState(() {
//         _widget2=_d2;
//         _widget = _s4;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     return Card(
//         color: Color(0xFFEFEFEF),
//         borderOnForeground: true,
//         shadowColor: Colors.black,
//         margin: EdgeInsets.only(left: 10, right: 10, top: 6),
//         child: Container(
//           width: w - 30,
//           padding: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "$drugName",
//                         maxLines: 2,
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontFamily: 'OpenSansR',
//                             color: Color(0xFFc31432)),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "$drugForm",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontFamily: 'OpenSansR',
//                             color: Color(0xFF240b36)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Container(alignment: Alignment.centerRight, child:IconButton(icon: _widget, onPressed: Addone,)),
//               Container(
//                   alignment: Alignment.centerRight,
//                   child: Row(
//                     children: [
//                       IconButton(
//                         icon: _widget2 ,
//                         onPressed: null,
//                       ),
//                       IconButton(
//                         icon: _widget,
//                         onPressed: Addone,
//                       ),
//                     ],
//                   )),
//             ],
//           ),
//         ));
//   }
// }