import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SearchCardUser extends StatefulWidget {
  final int x;
  final int y;
  final String medicine_name;
  final double price;
  final String form;
  final String status;

  const SearchCardUser({@required this.x,@required this.y,@required this.medicine_name , @required this.price,@required this.form,@required this.status});

  @override
  _SearchCardUserState createState() => _SearchCardUserState( this.medicine_name , this.price,this.form,this.status,this.x,this.y);
}

class _SearchCardUserState extends State<SearchCardUser> {
  final int x;
  final int y;
  final String medicine_name;
  final double price;
  final String form;
  final String status;
_SearchCardUserState( this.medicine_name ,  this.price, this.form, this.status,this.x,this.y);
bool process=false;
Widget _icon;
String _string="";
Color _color;
Function _function;

  Text t;
  Text t1=Text(
    "add",
    style: TextStyle(
      fontFamily: 'OpenSansR',
      color: Colors.white,
      fontSize: 21,
    ),
  );
  Text t2=Text(
    "Delete",
    style: TextStyle(
      fontFamily: 'OpenSansR',
      color: Colors.white,
      fontSize: 21,
    ),
  );

  Color a=Color(0xFFc31432);
  Color d=Color(0xFF240b36);
  Icon i1=Icon(Icons.check_outlined,size: 20,color: Colors.green,);
  Icon i2=Icon(Icons.cancel_outlined,size: 20,color: Colors.red,);
  void _Addone() async {
    setState(() {
      _icon=SpinKitCircle(
        color: Color(0xFF240b36),
        size: 20,
      );
    });
    String uri = "https://pharmaguied555.000webhostapp.com/api/addDrug/$x/$y";
    final res=await http.post(uri);
    if(jsonDecode(res.body)=="done"){
      setState(() {
        _icon=i1;
      });
    }
  }
  void _Removeone() async {
    setState(() {
      _icon=Container(
        alignment: Alignment.centerRight,
        child: SpinKitCircle(
          color: Color(0xFF240b36),
          size: 20,
        ),
      );
    });
    String uri =
        "https://pharmaguied555.000webhostapp.com/api/deleteDrug/$x/$y";
    final res=await http.post(uri);
    if(jsonDecode(res.body)=="done"){
      setState(() {
        _icon=i2;
      });
    }
  }
  void onClick()async{
    if(_icon==i2){
      setState(() {
        _icon=SpinKitCircle(
          color: Color(0xFF240b36),
          size: 20,
        );
      });
      String uri = "https://pharmaguied555.000webhostapp.com/api/addDrug/$x/$y";
      var res=await http.post(uri);
      if(jsonDecode(res.body)=="Done"){
        setState(() {
          _icon=i1;
          _color=d;
          t=t2;
        });
      }
    }else if(_icon==i1){
      setState(() {
        _icon=Container(
          alignment: Alignment.centerRight,
          child: SpinKitCircle(
            color: Color(0xFF240b36),
            size: 20,
          ),
        );
      });
      String uri =
          "https://pharmaguied555.000webhostapp.com/api/deleteDrug/$x/$y";
      var res=await http.post(uri);
      if(jsonDecode(res.body)=="Done"){
        setState(() {
          _icon=i2;
          _color=a;
          t=t1;
        });
      }
    }

  }

  @override
  void initState() {
    if(status=="y"){
      setState(() {
        _icon=i1;
        _color=d;
        t=t2;
      });
    }else if(status=="n"){
      setState(() {
        _icon=i2;
        _color=a;
        t=t1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    return Card(
      borderOnForeground: true,

      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 2,
            left: 10,
            right: 10,
            bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: _icon,
            ),
            Text('${medicine_name}',style: TextStyle(
              color: Color(0xFFFF0A0A),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),),
            SizedBox(height:15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price',style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.underline
                    ),
                    ),
                    SizedBox(height:10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('EGY : ',maxLines: 5,style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        ),
                        Text('${price}',maxLines: 2,style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          //decoration: TextDecoration.underline
                        ),
                        ),
                      ],
                    ),

                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 80),
                  margin: EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Text('Form',style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          decoration: TextDecoration.underline
                      ),
                      ),
                      SizedBox(height:10),
                      Text('${form}',maxLines: 2,style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        //decoration: TextDecoration.underline
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(0.0),
                  height: 40,
                  width: 100,
                  child: FlatButton(
                    onPressed: onClick,
                    color: _color,
                    //color: _icon==i1 ? d:a,
                    //color: status=="y" ?d:a,
                    child: Center(
                      child: t ,
                        //child: _icon==i1 ? t2:t1
                    ),
                      //child: status == "y" ? t2:t1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(52),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}





// class CardView extends StatelessWidget {
//   final String medicine_name;
//   final double price;
//   final String form;
//   final Function press;
//
//   const CardView({@required this.medicine_name , @required this.price,@required this.form, @required this.press});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       borderOnForeground: true,
//       shadowColor: Colors.black,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//
//       ),
//       margin: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
//       child: FlatButton(
//         height: 150,
//         minWidth: double.infinity,
//         onPressed: press,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 15,
//               left: 10,
//               right: 10,
//               bottom: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('${medicine_name}',style: TextStyle(
//                 color: Color(0xFFFF0A0A),
//                 fontStyle: FontStyle.normal,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),),
//               SizedBox(height:15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Price',style: TextStyle(
//                           color: Colors.black,
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           decoration: TextDecoration.underline
//                       ),
//                       ),
//                       SizedBox(height:10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text('EGY : ',maxLines: 5,style: TextStyle(
//                             color: Colors.black,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                           ),
//                           Text('${price}',maxLines: 2,style: TextStyle(
//                             color: Colors.black,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             //decoration: TextDecoration.underline
//                           ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 80),
//                     margin: EdgeInsets.all(0.0),
//                     child: Column(
//                       children: [
//                         Text('Form',style: TextStyle(
//                             color: Colors.black,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                             decoration: TextDecoration.underline
//                         ),
//                         ),
//                         SizedBox(height:10),
//                         Text('${form}',maxLines: 2,style: TextStyle(
//                           color: Colors.black,
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           //decoration: TextDecoration.underline
//                         ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Click to Read More',style: TextStyle(
//                     color: Color(0xFFFF0A0A),
//                     fontStyle: FontStyle.normal,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







