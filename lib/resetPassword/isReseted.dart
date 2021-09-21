import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_guide/sign/sign_in.dart';

class IsReseted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        color: Color(0xFFEFEFEF),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                SizedBox(height: 150.68*h/788,),
                Container(
                    height: 48.45*h/788,
                    child: SvgPicture.asset("assets/icons/restOk.svg",)),
                SizedBox(height: 25.87*h/788,),
                Text("Password reset",style: TextStyle(fontSize: 24 ,fontFamily: 'OPenSans3' , color: Colors.black),),
                Text("successful",style: TextStyle(fontSize: 24 ,fontFamily: 'OPenSans3' , color: Colors.black),),
                SizedBox(height: 26*h/788,),
                Text("You have successfully reset your password, ",style: TextStyle(fontSize: 15 ,fontFamily: 'OPenSansR' , color: Colors.black),),
                Text("please use your new password when",style: TextStyle(fontSize: 15 ,fontFamily: 'OPenSansR' , color: Colors.black),),
                Text("logging ",style: TextStyle(fontSize: 15 ,fontFamily: 'OPenSansR' , color: Colors.black),),
                SizedBox(height: 105*h/788,),
                Container(
                  padding: EdgeInsets.all(0.0),
                  height: 53,
                  width:195 ,
                  child: FlatButton(
                    onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SignIn())),
                    color: Color(0xFFFF7976),
                    child: Center(child: Text("Login",style: TextStyle(
                      fontFamily: 'OpenSansR',
                      color: Colors.white,
                      fontSize: 21,
                    ),)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(52),
                    ),
                  ),
                )

              ]
          ),
        ),
      ),
    );
  }
}
