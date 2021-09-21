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

import 'myDrugsModel.dart';

class MyDrug extends StatefulWidget {
  int respons;

  MyDrug(@optionalTypeArgs this.respons);
  @override
  _MyDrug createState() => _MyDrug(this.respons);
}

class _MyDrug extends State<MyDrug> {
  final int _response;

  _MyDrug(this._response);

  Widget _loading = Center(
    child: SpinKitRing(
      size: 100,
      color: Color(0xFFc31432),
    ),
  );

  bool processing = false;

  Future<List<Mydrugs>> _getAllDrugs() async {
    setState(() {
      processing = true;
    });
    String Url =
        "https://pharmaguied555.000webhostapp.com/api/allPharmDrugs/$_response";
    final response = await http.post(Url);
    List Mydrugs = mydrugsFromJson(response.body);
    setState(() {
      processing = false;
    });
    return Mydrugs;
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
                    "My Drugs",
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
                  future: _getAllDrugs(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            Mydrugs d = snapshot.data[index];
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
                                                "${d.name}",
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
                                                "${d.form}",
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
                                      Container(alignment: Alignment.centerRight, child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Price",
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
                                              "${d.price}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'OpenSansR',
                                                  color: Color(0xFF240b36)),
                                            ),
                                          ),
                                        ],
                                      ),),
                                    ],
                                  ),
                                ));
                          });
                    }
                    return _loading;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}