import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'asGuest.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.only(left: 10),
        color: Color(0xFFEFEFEF),
        child: SingleChildScrollView(
            child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: (59 * h) / 788,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 24,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginAsGuest())),
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(
                height: (20 * h) / 788,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/Logo2.png"),
                height: 160 * h / 788,
                width: 160 * w / 375,
              ),
              SizedBox(
                height: 10 * h / 788,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Pharma Guide",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'OpenSans2',
                        color: Colors.black),
                  )),
              SizedBox(
                height: 70 * h / 788,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/LeftSign.svg"),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Be sure to tell your doctor or pharmacist if you have any",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans3',
                                fontSize: 13),
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "allergiesSo that they can give you the correct treatment.",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans3',
                                fontSize: 13),
                          )),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: (20 * h) / 788,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/LeftSign.svg"),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "The alternative drug must be the same active",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans3',
                                fontSize: 13),
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "substances in the same proportions.",
                            textAlign: TextAlign.left,
                            style: TextStyle(

                                color: Colors.black,
                                fontFamily: 'OpenSans3',
                                fontSize: 13),
                          )),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: (20 * h) / 788,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/LeftSign.svg"),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "If you feel tired , consult a doctor instead of taking any drug.",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans3',
                            fontSize: 13),
                      ))
                ],
              ),
              SizedBox(
                height: (20 * h) / 788,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/LeftSign.svg"),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "You should always wear a mask and always wash your hands",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans3',
                                fontSize: 13),
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "with soap to limit the spread of Corona virus.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans3',
                                fontSize: 13),
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: (20 * h) / 788,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/LeftSign.svg"),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "We hope that you will follow the precautionary measures.",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans3',
                            fontSize: 13),
                      ))
                ],
              ),
              SizedBox(
                height: (20 * h) / 788,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
