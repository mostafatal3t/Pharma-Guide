import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_guide/Guest/asGuest.dart';
import 'package:pharma_guide/Guest/mapView.dart';
import 'package:pharma_guide/sign/sign_in.dart';
import 'file:///F:/Flutter%20Projects%20test/pharma_guide/lib/sp_constants.dart';
import 'package:pharma_guide/sign/sign_up.dart';

class WelcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [s2_color1, s2_color2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/S1_BG.png",
              fit: BoxFit.fill,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: (295*h)/788,
                    ),
                    Text(
                      "Join Our World",
                      style: TextStyle(
                        fontFamily: 'OpenSans3',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: (10*h)/788,
                    ),
                    Text(
                      "By Creating an Account, you Will",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Have All Options In The App",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: (106*h)/788,
                    ),
                    Container(
                      height: 45,
                      width: 225,
                      padding: EdgeInsets.all(0.0),
                      child: FlatButton(
                        onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginAsGuest())),
                      //  onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MapView())),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             Text("Login As Guest",style: TextStyle(fontSize: 14,fontFamily: 'OpenSans3',color: Colors.white),),
                            SvgPicture.asset("assets/icons/guist.svg"),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(52),
                          side: BorderSide(width: 2,color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: (23*h)/788,),
                    Text("---------------------------------------------------------------------------------------------- ",style: TextStyle(
                      fontSize: 9,
                      fontFamily: 'OpenSansR',
                      color: Colors.white,
                    ),),
                    SizedBox(height: (18*h)/788,),
                    Container(
                      padding: EdgeInsets.all(0.0),
                      height: 52,
                      width:195 ,
                      child: FlatButton(
                        onPressed: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>SignUp())),
                        color: Color(0xFFFF7976),
                        child: Center(child: Text("Sign Up",style: TextStyle(
                          fontFamily: 'OpenSansR',
                          color: Colors.white,
                          fontSize: 21,
                        ),)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(52),
                        ),
                      ),
                    ),
                    SizedBox(height: (18*h)/788,),
                    Container(
                      padding: EdgeInsets.all(0.0),
                      height: 52,
                      width:195 ,
                      child: FlatButton(
                        onPressed: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>SignIn())),
                        child: Center(child: Text("Sign In",style: TextStyle(
                          fontFamily: 'OpenSansR',
                          color: Colors.white,
                          fontSize: 21,
                        ),)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(52),
                          side: BorderSide(width: 2,color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
