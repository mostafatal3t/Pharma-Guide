import 'package:flutter/material.dart';
import 'package:pharma_guide/TextFieldDesign.dart';
import 'package:pharma_guide/resetPassword/reseveCode.dart';
import 'package:pharma_guide/sign/sign_in.dart';

class ByMail extends StatelessWidget {
  TextEditingController _EmailAddress;
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
              children: [
                SizedBox(height: (59*h)/788,),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 24,
                  child: IconButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) => SignIn())),
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(height: (149*h)/788,),
                Text("Enter Your Email Address",style: TextStyle(fontSize: 26,fontFamily: 'OpenSans3'),),
                SizedBox(height: (59*h)/788,),
                SUtextFieldDesign("Email Address", IconButton(icon:Icon(Icons.email,size: 20,),color: Colors.black.withOpacity(0.5),onPressed: (){}), false, TextInputType.phone,_EmailAddress,true),

                SizedBox(height: (109*h)/788,),
                Container(
                  padding: EdgeInsets.all(0.0),
                  height: 53,
                  width:195 ,
                  child: FlatButton(
                    onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ReciveCode())),
                    color: Color(0xFFFF7976),
                    child: Center(child: Text("Send",style: TextStyle(
                      fontFamily: 'OpenSansR',
                      color: Colors.white,
                      fontSize: 21,
                    ),)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(52),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
