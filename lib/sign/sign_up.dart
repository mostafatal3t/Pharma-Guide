import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_guide/AfterRegister/addDrugs.dart';
import 'package:pharma_guide/AfterRegister/responseModel.dart';
import 'package:pharma_guide/Location/getLocation.dart';
import 'package:pharma_guide/welcome2/screen2.dart';
import '../TextFieldDesign.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _Name,_Phone,_Email,_Password,_ConfirmPassword;
  bool processing= false;
  Widget _widget1=SpinKitWave(
    size: 30,
    color: Color(0xFF240b36),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Name=TextEditingController();
    _Phone=TextEditingController();
    _Email=TextEditingController();
    _Password=TextEditingController();
    _ConfirmPassword=TextEditingController();
  }

//Fluttertoast.showToast(msg: "Account exists,Please login",toastLength: Toast.LENGTH_SHORT);
  void registerUser() async {
    if(_Name.text=="")
      Fluttertoast.showToast(msg: "Name is Required",toastLength: Toast.LENGTH_SHORT);
    else if(_Phone.text=="")
      Fluttertoast.showToast(msg: "Phone is Required",toastLength: Toast.LENGTH_SHORT);
    else if(_Email.text=="")
      Fluttertoast.showToast(msg: "Email is Required",toastLength: Toast.LENGTH_SHORT);
    else if(_Password.text=="")
      Fluttertoast.showToast(msg: "Password is Required",toastLength: Toast.LENGTH_SHORT);
    else if(_ConfirmPassword.text=="")
      Fluttertoast.showToast(msg: "Confirm Password",toastLength: Toast.LENGTH_SHORT);
    else if(_Password.text.length<9)
      Fluttertoast.showToast(msg: "Password is short",toastLength: Toast.LENGTH_SHORT);
    else if(_ConfirmPassword.text != _Password.text)
      Fluttertoast.showToast(msg: "Passwords aren't same",toastLength: Toast.LENGTH_SHORT);
    else{
      setState(() {
        processing = true;
      });
      var url = "https://pharmaguied555.000webhostapp.com/api/register";
      var data = {
        "name":_Name.text,
        "phone":_Phone.text,
        "email":_Email.text,
        "password":_Password.text,
        "password_confirmation":_ConfirmPassword.text
      };
      var res = await http.post(url, body: data);
      if(res.statusCode==200){
        String resString = res.body;
        Response response= emptyFromJson(resString);
        // Fluttertoast.showToast(msg: "$response ",toastLength: Toast.LENGTH_LONG);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>GetLocatioon(response.name,response.id)));
      }
      else{
        if(jsonDecode(res.body) == "account already exists"){
          Fluttertoast.showToast(msg: "Account exists,Please login",toastLength: Toast.LENGTH_SHORT);
        }
        else{
          Fluttertoast.showToast(msg: "Error",toastLength: Toast.LENGTH_SHORT);
        }
      }
      setState(() {
        processing = false;
      });
    }

  }

  Icon a = Icon(Icons.remove_red_eye,size: 20,);
  bool _SHCpass=true;
  change2() {
    setState(() {
      if (_SHCpass == true) {
        _SHCpass = false;
        a = Icon(
          Icons.remove_red_eye_outlined,
          size: 20,
        );
      } else {
        _SHCpass = true;
        a = Icon(
          Icons.remove_red_eye,
          size: 20,
        );
      }
    });
  }
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: (59*h)/788,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 24,
                width: double.infinity,
                child: IconButton(
                  onPressed: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>WelcScreen())),
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(
                height: (11*h)/788,
              ),
              Container(
                width: double.infinity,
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'OpenSans2',
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: (41*h)/788,
              ),
              SUtextFieldDesign("Your Name",IconButton(icon:Icon(Icons.person,size: 20,),color: Colors.black.withOpacity(0.5),onPressed: (){}),false,TextInputType.name,_Name,true),
              SizedBox(
                height: (21*h)/788,
              ),
              SUtextFieldDesign("Phone number",IconButton(icon:Icon(Icons.phone,size: 20,),color: Colors.black.withOpacity(0.5),onPressed: (){}),false,TextInputType.phone,_Phone,true),
              SizedBox(
                height: (21*h)/788,
              ),
              SUtextFieldDesign("E-mail",IconButton(icon:Icon(Icons.email,size: 20,),color: Colors.black.withOpacity(0.5),onPressed: (){}),false,TextInputType.emailAddress,_Email,true),
              SizedBox(
                height: (21*h)/788,
              ),

              SUtextFieldDesign("Password",IconButton(icon:a,color: Colors.black.withOpacity(0.5),onPressed:change,),SHpass,TextInputType.visiblePassword,_Password,true),
              SizedBox(
                height: (21*h)/788,
              ),
              SUtextFieldDesign("Confirm Password",IconButton(icon:a,color: Colors.black.withOpacity(0.5),onPressed:change2,),SHpass,TextInputType.visiblePassword,_ConfirmPassword,true),
              SizedBox(
                height: (41*h)/788,
              ),
              Container(
                padding: EdgeInsets.all(0.0),
                height: 53,
                width:195 ,
                child: FlatButton(
                  onPressed:registerUser,
                  // onPressed: (){Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>AddDrug()));},
                  color: Color(0xFFc31432),
                  child: Center(child: Text("Continue",style: TextStyle(
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
                margin: EdgeInsets.only(top: 20),
                child:  processing==true ? _widget1 : Container(), ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////
// Container(
//                 padding: EdgeInsets.all(0.0),
//                 height: 57,
//                 width:333,
//                 child: FlatButton(
//                   onPressed: () {},
//                   color: Color(0xFF4040C4),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text("Continue With Facebook",style: TextStyle(
//                         fontFamily: 'OpenSans3',
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),),
//                       SvgPicture.asset("assets/icons/face.svg"),
//                     ],
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(52),
//                   ),
//                 ),
//               ),
//               SizedBox(height: (11*h)/788,),
//               Container(
//                 padding: EdgeInsets.all(0.0),
//                 height: 57,
//                 width:333,
//                 child: FlatButton(
//                   onPressed: () {},
//                   color: Color(0xFFE22424),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text("Continue With Google",style: TextStyle(
//                         fontFamily: 'OpenSans3',
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),),
//                       SvgPicture.asset("assets/icons/gmail.svg"),
//                     ],
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(52),
//                   ),
//                 ),
//               ),


//SizedBox(height: (17*h)/788,),
//               Text("-----------------------------------------------Or----------------------------------------------- ",
//                 style: TextStyle(
//                     fontFamily: 'OpenSansR',
//                     fontSize: 9,
//                     color: Colors.black
//                 ),),
//               SizedBox(height: (23*h)/788,),
