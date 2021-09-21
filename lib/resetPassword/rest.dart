import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_guide/TextFieldDesign.dart';
import 'package:pharma_guide/resetPassword/isReseted.dart';
class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _Password,_ConfirmPassword;
  @override
  Widget build(BuildContext context) {
    Icon a = Icon(Icons.remove_red_eye,size: 20,);

    bool SHpass=true;
    change(){
      setState(() {
        if(SHpass == true)
        {
          SHpass=false;
          a=Icon(Icons.remove_red_eye_outlined,size: 20,);
        }
        else
        {
          SHpass=true;
          a=Icon(Icons.remove_red_eye,size: 20,);
        }
      });
    }
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
                SizedBox(height: (64*h)/788,),
                Container(
                  height: (144*h)/788,
                  width: 165*h/357,
                  child: CircleAvatar(
                    backgroundColor:Color(0xFFEFEFEF),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height:108*h/788 ,
                            width: 114*w/357,
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF369F44),
                            ),
                          ),
                        ),
                        Center(
                          child: SvgPicture.asset("assets/icons/resetLock.svg"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 17*h/788,),
                Text("Reset Password",style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'OpenSans3',
                  color: Colors.black,
                ),),
                SizedBox(height: 9*h/788,),
                Text("Enter your new password below, we're",style: TextStyle(fontSize: 17,fontFamily: 'OpenSansR',color: Colors.black),),
                Text("just being extra safe",style: TextStyle(fontSize: 17,fontFamily: 'OpenSansR',color: Colors.black),),
                SizedBox(height: 65*h/788,),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 46 , bottom: 7),
                  child: Text("New Password",style: TextStyle(fontSize: 13 , fontFamily: 'OpenSans3', ),),
                ),
                SUtextFieldDesign("New Password",IconButton(icon:a,color: Colors.black.withOpacity(0.5),onPressed:change,),SHpass,TextInputType.visiblePassword,_Password,true),
                SizedBox(height: 15*h/788,),
                Container(

                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 46 , bottom: 7),
                  child: Text("Confirm Password",style: TextStyle(fontSize: 13 , fontFamily: 'OpenSans3', ),),
                ),
                SUtextFieldDesign("Confirm New Password",IconButton(icon:a,color: Colors.black.withOpacity(0.5),onPressed:change,),SHpass,TextInputType.visiblePassword,_ConfirmPassword,true),
                SizedBox(height: (71*h)/788,),
                Container(
                  padding: EdgeInsets.all(0.0),
                  height: 53,
                  width:195 ,
                  child: FlatButton(
                    onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>IsReseted())),
                    color: Color(0xFFFF7976),
                    child: Center(child: Text("Done",style: TextStyle(
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

