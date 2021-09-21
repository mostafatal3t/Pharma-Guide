import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharma_guide/AfterLogin/searchAfterLogin.dart';
import 'package:pharma_guide/AfterRegister/responseModel.dart';
import 'package:pharma_guide/Location/getLocation.dart';
import 'package:pharma_guide/sign/Api/userModel.dart';
import 'package:flutter/material.dart';
import 'package:pharma_guide/resetPassword/byPhone.dart';
import 'package:pharma_guide/welcome2/screen2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../TextFieldDesign.dart';

class SignIn extends StatefulWidget {
  @override
  _SingnInState createState() => _SingnInState();
}

class _SingnInState extends State<SignIn> {
  TextEditingController _Email, _Password;
  Widget _widget1 = SpinKitWave(
    size: 30,
    color: Color(0xFF240b36),
  );
  bool processing = false;
  Icon _a = Icon(
    Icons.remove_red_eye,
    size: 20,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Email = TextEditingController();
    _Password = TextEditingController();
  }


  // setState(() {
  // processing = false;
  // });

  void loginUser() async {
    if (_Email.text == "" || _Password.text == "") {
      Fluttertoast.showToast(
          msg: "Complete Data", toastLength: Toast.LENGTH_LONG);
    } else {
      setState(() {
        processing = true;
      });
      var url = "https://pharmaguied555.000webhostapp.com/api/login";
      var data = {
        "email": _Email.text,
        "password": _Password.text,
      };
      var res = await http.post(url, body: data);
        if (jsonDecode(res.body) == "not password" || _Password.text.length<9) {
        Fluttertoast.showToast(
            msg: "Incorrect Password", toastLength: Toast.LENGTH_LONG);
        setState(() {
          processing = false;
        });
      } else if (jsonDecode(res.body) == "not exist") {
        Fluttertoast.showToast(msg: "This Account isn't Exist,Please SignUp !",
            toastLength: Toast.LENGTH_LONG);
        setState(() {
          processing = false;
        });
      } else {
        String resString = res.body;
        User u = userFromJson(resString);

        setState(() {
          processing = false;
        });
        if(u.status=="y"){
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => SearchAfterLogin(u)));
        }
        else{
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => GetLocatioon(u.name,u.id)));
        }

      }
    }
}

bool _SHpass = true;

change() {
  setState(() {
    if (_SHpass == true) {
      _SHpass = false;
      _a = Icon(
        Icons.remove_red_eye_outlined,
        size: 20,
      );
    } else {
      _SHpass = true;
      _a = Icon(
        Icons.remove_red_eye,
        size: 20,
      );
    }
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFFEFEFEF),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 59,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 24,
                child: IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => WelcScreen())),
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 152,
              ),
              Container(
                width: double.infinity,
                height: 36,
                alignment: Alignment.center,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'OpenSans2',
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 56,
              ),
              SUtextFieldDesign(
                  "E-mail",
                  IconButton(
                    icon: Icon(Icons.email, size: 20),
                    onPressed: () {},
                  ),
                  false,
                  TextInputType.emailAddress,
                  _Email,true),
              SizedBox(
                height: 21,
              ),
              SUtextFieldDesign(
                  "Password",
                  IconButton(
                    icon: _a,
                    onPressed: change,
                  ),
                  _SHpass,
                  TextInputType.visiblePassword,
                  _Password,true),
              SizedBox(height: 45),
              Container(
                height: 19,
                margin: EdgeInsets.only(right: 15),
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () =>
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => ByPhone())),
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      color: Color(0xFF1C28D6),
                      fontSize: 14,
                      fontFamily: 'OpenSansR',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Container(
                padding: EdgeInsets.all(0.0),
                height: 53,
                width: 195,
                child: FlatButton(
                  onPressed: loginUser,
                  color: Color(0xFFc31432),
                  child: Center(
                      child: Text(
                        "Login",
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
              Container(
                margin: EdgeInsets.only(top: 20),
                child: processing == true ? _widget1 : Container(),
              ),
            ],
          ),
        ),
      ));
}}
