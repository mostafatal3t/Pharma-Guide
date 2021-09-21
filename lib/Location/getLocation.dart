import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:pharma_guide/AfterRegister/addDrugs.dart';
import 'package:pharma_guide/AfterRegister/responseModel.dart';
import 'package:http/http.dart' as http;
class GetLocatioon extends StatefulWidget {
   final String _name;
   final int _id;
  GetLocatioon(this._name,this._id);
  @override
  _GetLocatioonState createState() => _GetLocatioonState(this._name,this._id);
}
class _GetLocatioonState extends State<GetLocatioon> {
  final String _name;
  final int _id;
  _GetLocatioonState(this._name,this._id);

  String name;
  int id;
  int state=0;
  String lat , lon;
  Widget _widget1=SpinKitWave(
    size: 30,
    color: Color(0xFF240b36),
  );
  Widget _widget2=SpinKitCircle(
    size: 30,
    color: Color(0xFF240b36),
  );
  TextEditingController _Name,_Address;
  var locationadress="";
  bool processing=false;
  bool preeprocessing=false;
  double x,y;
  @override
  void initState() {
    _Name=new TextEditingController();
    _Address=new TextEditingController();
    super.initState();
  }
  void getCurrentLocation () async{
    setState(() {
      preeprocessing=true;
    });
    final  position =await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      x=position.latitude;
      y=position.longitude;
      lat=x.toString();
      lon=y.toString();
      state++;
    });
    //30.1318834,31.2480245
    final cor=new Coordinates(x, y);
    var address=await Geocoder.local.findAddressesFromCoordinates(cor);
    var a=address.first.addressLine;
    setState(() {
      locationadress=a;
      preeprocessing=false;
    });
  }

  void addLocation()async{
    if(_Name.text==""){
      Fluttertoast.showToast(msg: "Pharmacy name is Required",toastLength: Toast.LENGTH_SHORT);
    }else if(_Address.text==""){
      Fluttertoast.showToast(msg: "Address is Required",toastLength: Toast.LENGTH_SHORT);
    }else if(state==0){
      Fluttertoast.showToast(msg: "Get your Current Location",toastLength: Toast.LENGTH_SHORT);
    }
    else{
      setState(() {
        processing=true;
      });
      var apiUri= "https://pharmaguied555.000webhostapp.com/api/pharmadd/"+"${_id}";
      var locationData ={
        "pharm_name":_Name.text,
        "pharm_adress":_Address.text,
        "latitude":lat,
        "longtude":lon
      };
      var Query=await http.post(apiUri,body: locationData);
      if(jsonDecode(Query.body)=="true")
      {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>AddDrug(_id)));
      }else{
        Fluttertoast.showToast(msg: "No",toastLength: Toast.LENGTH_SHORT);
      }
      setState(() {
        processing=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: h,
        width: w,
        color: Color(0xFFFFFFFF),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 235,
                width: w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFc31432),
                      Color(0xFF240b36)
                    ]
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF240b36),
                      blurRadius: 20,
                      offset: Offset(5.0,5.0),
                    ),
                  ]
                ),
                 child: Center(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         height: 100,
                         width: 100,
                         child: CircleAvatar(
                          backgroundColor: Color(0xFFEFEFEF),
                           child: Center(
                              child:SvgPicture.asset("assets/icons/location.svg",height: 90 ,width: 90,)
                              //Image.asset("assets/icons/location.svg"),
                           )
                         ),
                       ),
                   AnimatedTextKit(
                     totalRepeatCount: 100,
                     animatedTexts: [
                       WavyAnimatedText('Hello, ${_name}', textStyle: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'OpenSans2',
                         fontSize: 35,
                         fontStyle: FontStyle.italic,
                           ),
                       ),
                       FadeAnimatedText('Complete Your Data Please ',textStyle:TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'OpenSans2',
                         fontSize: 25,
                       ),),
                       FadeAnimatedText('Put Your Pharmacy Name ',textStyle:TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'OpenSans2',
                         fontSize: 25,
                       ),),
                       FadeAnimatedText('Put Your Pharmacy Address ',textStyle:TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'OpenSans2',
                         fontSize: 25,
                       ),),
                       FadeAnimatedText('You Must Be on Your pharmacy ',textStyle:TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'OpenSans2',
                         fontSize: 25,
                       ) ,
                       ),
                       FadeAnimatedText('Click On',textStyle:TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'OpenSans2',
                         fontSize: 25,
                       ) ,

                       ),
                       FadeAnimatedText('Get My Current Location..',textStyle:TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'OpenSans2',
                         fontSize: 25,
                       ) ,
                       ),
                       FadeAnimatedText('Finally, Click On Add Button',textStyle:TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'OpenSans2',
                         fontSize: 25,
                       ),),
                     ],
                  ),
                     ],
                   ),
                 ),
              ),
              Container(
                height: 470,
                margin: EdgeInsets.only(top: 20,left: 10,right:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color:Color(0xFFEEEFEF),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF240b36).withOpacity(0.5),
                        blurRadius: 30,
                        offset: Offset(0.0,5),
                      ),
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 31,right: 10,top: 6,),
                      height: (57*h)/788,
                      width: (220*w)/374,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35), color: Colors.white,boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 7),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.16),
                        )
                      ]),
                      child: Expanded(
                        child: TextField(
                          controller: _Name,
                          onChanged: (value) {},
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans3',
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                              hintText: "Pharmacy Name",
                              hintStyle: TextStyle(
                                  color: Color(0xFF0F0B0B),
                                  fontSize: 14,
                                  fontFamily: 'OpenSans'),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.all(10),
                    //   alignment: Alignment.centerLeft,
                    //  child: Text("You must be on your pharmacy before get your Location (Before click On the 'Get My Current Location' Button).",style: TextStyle(
                    //    color:Color(0xFF240b36) ,
                    //    fontWeight: FontWeight.normal,
                    //    fontFamily: 'OpenSansR2',
                    //    fontSize: 20,
                    //  ),
                    //  maxLines: 3,
                    //  ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 31,right: 10,top: 6,),
                      height: (57*h)/788,
                      width: (220*w)/374,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35), color: Colors.white,boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 7),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.16),
                        )
                      ]),
                      child: Expanded(
                        child: TextField(
                          controller: _Address,
                          onChanged: (value) {},
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans3',
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                              hintText: "Pharmacy Address In Arabic",
                              hintStyle: TextStyle(
                                  color: Color(0xFF0F0B0B),
                                  fontSize: 14,
                                  fontFamily: 'OpenSans'),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0.0),
                      height: 53,
                      width:100 ,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF240b36).withOpacity(0.5),
                              blurRadius: 30,
                              offset: Offset(1.0,1.0),
                            ),
                          ]
                      ),
                      margin: EdgeInsets.only(top: 20,left: 40,right: 40),
                      child: FlatButton(
                        splashColor: Colors.white,
                        onPressed: getCurrentLocation,
                        color: Color(0xFF240b36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Get My Current Location",style: TextStyle(
                              fontFamily: 'OpenSansR',
                              color: Colors.white,
                              fontSize: 16,
                            ),),
                            Icon(Icons.add_location,color: Colors.white,size: 25,)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(52),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: preeprocessing==true ? _widget2:Text("$locationadress",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'OpenSans3'),),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(0.0),
                height: 53,
                width:195 ,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF240b36),
                        blurRadius: 20,
                        offset: Offset(5.0,5.0),
                      ),
                    ]
                ),
                margin: EdgeInsets.only(top: 10),
                child: FlatButton(
                  splashColor: Colors.white,
                  onPressed: addLocation,
                  color: Color(0xFFc31432),
                  child: Center(child:
                  Text("Add",style: TextStyle(
                    fontFamily: 'OpenSansR',
                    color: Colors.white,
                    fontSize: 21,
                  ),)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(52),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: processing==true ? _widget1 : Container(),),
            ],
          ),
        ),
      ),
    );
  }
}
