import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_guide/splash/splashContent.dart';
import 'package:pharma_guide/welcome2/screen2.dart';


import '../sp_constants.dart';

// class Screen112 extends StatefulWidget {
//   @override
//   _Screen1State createState() => _Screen1State();
// }

class Screen112 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFc31432),
                Color(0xFF240b36)
              //   sp_color1,
              //   sp_color2,
              //   sp_color3,
              //   sp_color4,
              //   sp_color5,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                child: Image.asset(
                  "assets/images/S1_BG.png",
                  height: 812,
                  width: 375,
                  fit: BoxFit.fill,
                ),
                height: 812,
                width: 375,
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 319,
                    ),
                    Text(
                      "Welcome",
                      style: (TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans2',
                          color: Colors.white)),
                    ),
                    Text(
                      "Search and know about your drugs",
                      style: (TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'OpenSans',
                          color: Colors.white)),
                    ),
                    SizedBox(
                      height: 253,
                    ),
                    Container(
                      width: 195,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcScreen())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Let's Start ",
                                style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(52),
                          ),
                          color: Color(0xFFFFBD77),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
