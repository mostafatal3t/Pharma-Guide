import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_guide/Cards/cardOfPharmacy.dart';
import 'package:pharma_guide/Cards/cardView.dart';
import 'package:pharma_guide/Guest/ApiGuest/MoreModel.dart';
import 'package:pharma_guide/Guest/ApiGuest/SimilersModel.dart';
import 'package:pharma_guide/Guest/ApiGuest/getMoreInfo.dart';
import 'package:pharma_guide/Guest/ApiGuest/getSimelers.dart';
import 'package:pharma_guide/Guest/ApiGuest/pharmacyModel.dart';
import 'package:pharma_guide/Guest/mapView.dart';
import 'package:pharma_guide/Guest/myDrawer.dart';
import 'package:pharma_guide/myBottomBar.dart';
import 'package:pharma_guide/Guest/ApiGuest/GetDrug.dart';
import 'package:pharma_guide/Guest/ApiGuest/DrugModel.dart';

import 'ApiGuest/getPharmsies.dart';


class LoginAsGuest extends StatefulWidget {
  @override
  _LoginAsGuestState createState() => _LoginAsGuestState();
}


class _LoginAsGuestState extends State<LoginAsGuest> {

  Widget y = Container();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TextEditingController _search;
  String searchText="";
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      key: _globalKey,
      drawer: MyDrawer(),
      body: Container(
          color: Color(0xFFEFEFEF),
          height: h,
          width: w,
          child: Stack(
            children: [
              Container(
                height: 217 * h / 788,
                width: w,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/pharma.png", height: 200 * h / 788,
                      width: w,
                      fit: BoxFit.fill,),
                    Positioned(
                      bottom: 0,
                      top: 197,
                      right: 17,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 31, right: 10, bottom: 6),

                        height: (40 * h) / 788,
                        width: (341 * w) / 375,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(35),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 7),
                                blurRadius: 6,
                                color: Colors.black.withOpacity(0.16),
                              )
                            ]),
                        child: Expanded(
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            controller: _search,
                            onChanged: (value) {
                              setState(() {
                                if(value==""){
                                  searchText=null;
                                }else{
                                searchText = value;}
                              });
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans3',
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              ////////////////////////////////////////////////////////////////////////////////////////////////
                                suffixIcon:Icon(Icons.search),
                                hintText: "Search Your Drug",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'OpenSanR'),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 250,
                left: 0,
                right: 0,
                bottom: 0,
                child:Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: FutureBuilder(
                      future: Search(searchText),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context , index){
                               Drug datum = snapshot.data[index];
                                return  CardView(medicine_name: datum.name , price: datum.price , form: datum.form, press:()=>Navigator.push(context, new MaterialPageRoute(builder: (context)=>More2(snapshot.data[index]))),);
                              });
                        }
                        return  Center(child: Text("No Drugs" , style: TextStyle(fontSize: 35 , fontFamily: 'OpenSans3' , fontStyle: FontStyle.italic , color: Color(0xFFFF7777)),),);
                      },
                    )
                ) ,
              )
            ],
          )
      ),
      bottomNavigationBar: MyBottomBar(
          h, w, () {}, () {}, () => _globalKey.currentState.openDrawer()),
    );
  }
}


/*****************************************Page of More Information *****************************************/


class More2 extends StatefulWidget {
  Drug datum;

  More2(this.datum);
  @override
  _More2State createState() => _More2State(datum);
}

class _More2State extends State<More2> {
  final Drug datum;
   int _id;
   String _name;
   String _form;
   double _price;
   String lat;
  String long;
  LatLng _latLng;
  _More2State(this.datum);
  Widget showSimilers(int id) {
    return Container(
        child: FutureBuilder(
          future: getSimiler(id),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context , index){
                    Similer similer = snapshot.data[index];
                    return  CardView(medicine_name: similer.name , price: similer.price , form: similer.form, press:(){setState(() {
                      _name=similer.name;
                      _form=similer.form;
                      _price=similer.price;
                      _id=similer.id;
                    });});
                  });
            }

              return Center(
                child: SpinKitCircle(
                  size: 70,
                  color: Color(0xFF240b36),
                ),
              );
          },
        )
    );
  }
 String ListToString(List<Composition> list)  {
    String str="";
    int i=list.length;
    for(int a=0;a<i;a++){
      str+="${a+1}"+"--> "+"${list[a].name}"+" With Size  -> "+"${list[a].size}"+"\n";
    }
    return str;
 }
  Widget moreInformation(int id){
    return Container(
      padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: getMore(id),
          builder: (context, snapshot){
               if(snapshot.hasData){
                 more _mo=snapshot.data;
                 String compo=ListToString(_mo.composition);
                 return  ListView(
                   children: [
                     Text(
                       "SideEffects",
                       style: TextStyle(
                         fontSize: 20,
                         color: Color(0xFFFF7777),
                         fontFamily: 'OpenSans2',
                         decoration: TextDecoration.underline,
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.only(left: 10),
                       child: Text(
                         "${_mo.sideEffects}",
                         maxLines: 6,
                         style: TextStyle(
                           fontSize: 15,
                           fontFamily: 'OpenSans3',
                           color: Colors.black,

                         ),
                       ),
                     ),
                     SizedBox(height: 15,),
                     Text(
                       "NotUse",
                       style: TextStyle(
                         fontSize: 20,
                         color: Color(0xFFFF7777),
                         fontFamily: 'OpenSans2',
                         decoration: TextDecoration.underline,
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.only(left: 10),
                       child: Text(
                         "${_mo.notUse}",
                         maxLines: 6,
                         style: TextStyle(
                           fontSize: 15,
                           fontFamily: 'OpenSans3',
                           color: Colors.black,

                         ),
                       ),
                     ),
                     SizedBox(height: 15,),
                     Text(
                       "Uses",
                       style: TextStyle(
                         fontSize: 20,
                         color: Color(0xFFFF7777),
                         fontFamily: 'OpenSans2',
                         decoration: TextDecoration.underline,
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.only(left: 10),
                       child: Text(
                         "${_mo.uses}",
                         maxLines: 6,
                         style: TextStyle(
                           fontSize: 15,
                           fontFamily: 'OpenSans3',
                           color: Colors.black,

                         ),
                       ),
                     ),
                     SizedBox(height: 15,),
                     Text(
                       "Composition",
                       style: TextStyle(
                         fontSize: 20,
                         color: Color(0xFFFF7777),
                         fontFamily: 'OpenSans2',
                         decoration: TextDecoration.underline,
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.only(left: 10),
                       child: Text(
                         "$compo",
                         maxLines: _mo.composition.length,
                         style: TextStyle(
                           fontSize: 15,
                           fontFamily: 'OpenSans3',
                           color: Colors.black,

                         ),
                       ),
                     ),
                     SizedBox(height: 15,),
                   ],
                 );
               }else{
                 return Center(
                   child: SpinKitCircle(
                     size: 70,
                     color: Color(0xFF240b36),
                   ),
                 );
               }
          },
        )
    );

  }
  void cruntLoc()async{
    final  position =await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _latLng=LatLng(position.latitude, position.longitude);
      lat=position.latitude.toString();
      long=position.longitude.toString();
    });
  }
  @override
  Future<void> initState()  {
    _name=datum.name;
    _form=datum.form;
    _price=datum.price;
    _id=datum.id;
    super.initState();
    cruntLoc();
  }
  Widget NearestPharmacies(int id) {
    return Container(
        child: FutureBuilder(
          future: getpharmacies(id, lat, long),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context , index){
                    Pharmacy pharmacy = snapshot.data[index];
                    return  CardOfPharmacy(pharmacy.pharmName, pharmacy.adress,pharmacy.userPhone,()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>MapView(pharmacy,_latLng))));
                  });
            }

            return Center(
              child: SpinKitCircle(
                size: 70,
                color: Color(0xFF240b36),
              ),
            );
          },
        )
    );

  }
  @override
  Widget build(BuildContext context) {

    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        body:
        Container(
          height: h,
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: h/3,
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 180,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF7777),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150),bottomRight: Radius.circular(150)),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset("assets/images/Logo2.png"),
                              height: 100 * h / 788,
                              width: 100 * w / 375,
                            ),
                            SizedBox(height: 10,),
                            Text("${_name}" , style: TextStyle(
                                color: Color(0xFFEFEFEF),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'OpenSans3'
                            ), ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Price" , style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              decoration: TextDecoration.underline
                          ), ),
                          Text("${_price}  EGY " , style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ), ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Form" , style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              decoration: TextDecoration.underline
                          ), ),
                          Text("${_form}" , style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              wordSpacing: 0.0
                          ), ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              Container(
                height:h-(h/3)-16 ,
                width: w,
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) ),
                        side: BorderSide(width: 2,color: Colors.white),
                      ),
                      titleTextStyle: TextStyle(
                        fontFamily: 'OpenSans3',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      backgroundColor: Color(0xFFFF7777),
                      backwardsCompatibility: false,
                      toolbarTextStyle:TextStyle(
                        fontFamily: 'OpenSans3',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      foregroundColor: Color(0xFFFF7777),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(0),
                        child: TabBar(
                          labelStyle:TextStyle(
                            fontFamily: 'OpenSans3',
                            fontSize: 16,
                            color: Colors.white,
                          ) ,
                          tabs: [
                            Tab(text: "More Info",),
                            Tab(text: "Similers",),
                            Tab(text: "Pharmacies",),
                          ],
                        ),
                      ),
                    ),
                    body:TabBarView(
                      children: [
                        moreInformation(_id),
                        showSimilers(_id),
                        NearestPharmacies(_id),

                       // Center(child: Text("No Pharmasies" , style: TextStyle(fontSize: 35 , fontFamily: 'OpenSans3' , fontStyle: FontStyle.italic , color: Color(0xFFFF7777)),),),
                      ],
                    ) ,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}




















// class More extends StatefulWidget {
//    Datum datum;
//
//   More(Datum datum);
//   @override
//   _MoreState createState() => _MoreState(datum);
// }
//
// class _MoreState extends State<More> {
//   final Datum datum;
//   _MoreState(this.datum);
//
//   @override
//   Widget build(BuildContext context) {
//     double w=MediaQuery.of(context).size.width;
//     double h=MediaQuery.of(context).size.height;
//     return Scaffold(
//         backgroundColor: Color(0xFFEFEFEF),
//         body: Container(
//           margin: EdgeInsets.all(8.0),
//           height: h,
//           width: w,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 height: h/3,
//                 width: w,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Container(
//                       alignment: Alignment.center,
//                       child: Text("${datum.name}" , style: TextStyle(
//                         color: Color(0xFFFF0A0A),
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ), ),
//                     ),
//                     Container(
//                       width: w,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text("Price" , style: TextStyle(
//                             color: Colors.black,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                             decoration: TextDecoration.underline
//                           ), ),
//                           Text("------------------>" , style: TextStyle(
//                             color: Color(0xFFFF0A0A),
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             wordSpacing: 0.0,
//                             fontSize: 18,
//                           ), ),
//                           Text("${datum.price}" , style: TextStyle(
//                             color: Colors.black,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ), ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: w,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text("Form" , style: TextStyle(
//                               color: Colors.black,
//                               fontStyle: FontStyle.normal,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               decoration: TextDecoration.underline
//                           ), ),
//                           Text("------------------>" , style: TextStyle(
//                             color: Color(0xFFFF0A0A),
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             wordSpacing: 0.0,
//                             fontSize: 18,
//                           ), ),
//                           Text("${datum.form}" , style: TextStyle(
//                             color: Colors.black,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                             wordSpacing: 0.0
//                           ), ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height:h-(h/3)-16 ,
//                 width: w,
//                 child: DefaultTabController(
//                   length: 3,
//                   child: Scaffold(
//                     appBar: AppBar(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) ),
//                         side: BorderSide(width: 2,color: Colors.white),
//                       ),
//                       titleTextStyle: TextStyle(
//                         fontFamily: 'OpenSans3',
//                         fontSize: 25,
//                         color: Colors.white,
//                       ),
//                       backgroundColor: Color(0xFFFF7777),
//                       backwardsCompatibility: false,
//                       toolbarTextStyle:TextStyle(
//                         fontFamily: 'OpenSans3',
//                         fontSize: 25,
//                         color: Colors.white,
//                       ),
//                       foregroundColor: Color(0xFFFF7777),
//                       bottom: PreferredSize(
//                         preferredSize: Size.fromHeight(0),
//                         child: TabBar(
//                           labelStyle:TextStyle(
//                             fontFamily: 'OpenSans3',
//                             fontSize: 16,
//                             color: Colors.white,
//                           ) ,
//                           tabs: [
//                             Tab(text: "More Info",),
//                             Tab(text: "Similers",),
//                             Tab(text: "Pharmacies",),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//     );
//   }
// }





// setState(() {
// y = CardView(
// medicine_name: "CONGESTAL 20-TAB",
// Active_ingredients: "Acetaminophen (Paracetamol) 650 mg Chlorpheniramine maleate 4 mg Pseudoephedrine HCL 60mg",
// price: 19.50);
// }
// )


// TextField(
//                             textAlignVertical: TextAlignVertical.center,
//                             keyboardType: TextInputType.text,
//                             obscureText: false,
//                             controller: _search,
//                             onChanged: (value) {
//                               setState(() {
//                                 searchText = value;
//                               });
//                             },
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'OpenSans3',
//                               fontSize: 18,
//                             ),
//                             decoration: InputDecoration(
//                                 suffixIcon: Icon(Icons.search),
//                                 hintText: "Search Your Drug",
//                                 hintStyle: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontFamily: 'OpenSanR'),
//                                 enabledBorder: InputBorder.none,
//                                 focusedBorder: InputBorder.none),
//                           ),