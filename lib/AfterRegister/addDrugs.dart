import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_guide/AfterRegister/AllDrugsModels.dart';
// import 'package:pharma_guide/AfterRegister/responseModel.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_guide/AfterRegister/cardOfAdd.dart';
import 'package:pharma_guide/AfterRegister/responseModel.dart';
import 'package:pharma_guide/sign/sign_in.dart';

class AddDrug extends StatefulWidget {
  int respons;

  AddDrug(@optionalTypeArgs this.respons);
  @override
  _AddDrug createState() => _AddDrug(this.respons);
}

class _AddDrug extends State<AddDrug> {
  final int _response;

  _AddDrug(this._response);

  Widget _loading = Center(
    child: SpinKitRing(
      size: 100,
      color: Color(0xFFc31432),
    ),
  );

  bool processing = false;

  Future<List<Drug>> getAllDrugs() async {
    setState(() {
      processing = true;
    });
    String Url =
        "https://pharmaguied555.000webhostapp.com/api/allDrugs/${_response}";
    final response = await http.post(Url);
    List AllDrugs = drugFromJson(response.body);
    setState(() {
      processing = false;
    });
    return AllDrugs;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        color: Color(0xFFD0CCCC),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150,
                width: w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFc31432), Color(0xFF240b36)]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF240b36),
                        blurRadius: 20,
                        offset: Offset(5.0, 5.0),
                      ),
                    ]),
                child: Center(
                  child: Text(
                    "Available Drugs To Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans2',
                      fontSize: 35,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: w,
                height: h - 210,
                child: FutureBuilder(
                  future: getAllDrugs(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            Drug d = snapshot.data[index];
                            return CardOfAdd(
                                d.name, d.form, _response, d.id, d.status);
                          });
                    }
                    return _loading;
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(0.0),
                height: 40,
                width: 120,
                child: FlatButton(
                  onPressed: (){Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>SignIn()));},
                  color: Color(0xFFc31432),
                  child: Center(
                      child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: 'OpenSansR',
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  )),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(52),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}