import 'package:flutter/material.dart';
import '../sp_constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height:h,
        width: w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFc31432),
              Color(0xFF240b36)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: (205*h)/788,
            ),
            SizedBox(
              height: 215,
              width: 215,
              child: CircleAvatar(
                child: Image.asset(
                  "assets/images/Logo2.png",
                  height: 215,
                  width: 215,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              sp_titile,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'OpenSans2'),
            ),
            SizedBox(
              height: (200.0*h)/788,
            ),
            SpinKitFadingCube(
              size: 60,
              color: Color(0xFFEFEFEF),
              duration: Duration(seconds: 2),
            )
          ],
        ),
      ),
    );
  }
}
