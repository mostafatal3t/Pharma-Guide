import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_guide/TextFieldDesign.dart';
import 'package:pharma_guide/sign/Api/userModel.dart';

class ProfilePage extends StatefulWidget {
  final User _user;
   ProfilePage( this._user);
  @override
  _ProfilePageState createState() => _ProfilePageState(_user);
}

class _ProfilePageState extends State<ProfilePage> {
  final User _user;
  _ProfilePageState(this._user);
  String s1,s2,s3,s4,s5;
  Icon _a = Icon(
    Icons.edit,
    size: 20,
  );
  bool t1=false,t2=false,t3=false,t4=false,t5=true,processing=false;
  Widget _widget1=SpinKitWave(
    size: 30,
    color: Color(0xFF240b36),
  );
  TextEditingController tName=new TextEditingController();
  TextEditingController tPhone=new TextEditingController();
  TextEditingController tPharmaName=new TextEditingController();
  TextEditingController tAdress=new TextEditingController();
  TextEditingController tPassword=new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s1=tName.text;
    s2=tPhone.text;
    s3=tPharmaName.text;
    s4=tAdress.text;
    tName.text=_user.name;
    tPhone.text=_user.phone;
    tPharmaName.text=_user.pharmName;
    tAdress.text=_user.adress;
  }
  void changeState(bool s){
    if(s==false)
      setState(() {
        s=true;
      });
    else
      setState(() {
        s=false;
      });
  }
  void Update()async{
    if(tPassword.text==""){
      Fluttertoast.showToast(
          msg: "Enter your Password", toastLength: Toast.LENGTH_SHORT);
    }else{
      if(s1==_user.name && s2==_user.phone && s3==_user.pharmName && s4==_user.adress)
      {
        Fluttertoast.showToast(
            msg: "No Changes to Edit", toastLength: Toast.LENGTH_SHORT);
      }else if(tName.text==""||tPharmaName.text==""||tPhone.text==""||tAdress.text==""){
        Fluttertoast.showToast(
            msg: "You Can't Save with null values", toastLength: Toast.LENGTH_SHORT);
      }
      else{
        setState(() {
          processing=true;
        });
        var uri="https://pharmaguied555.000webhostapp.com/api/updateUserInfo/${_user.id}";
        var Userdata={
          "name": tName.text,
          "phone":tPhone.text,
          "pharm_name":tPharmaName.text,
          "adress":tAdress.text,
          "password":tPassword.text
        };
        var res = await http.post(uri, body: Userdata);
        if(jsonDecode(res.body)=="not password"){
          Fluttertoast.showToast(
              msg: "InCorrect Password", toastLength: Toast.LENGTH_SHORT);
          setState(() {
            processing=false;
          });
        }
        else if(res.statusCode==200){
          setState(() {
            processing=false;
          });
          User u=userFromJson(res.body);
          Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>ProfilePage(u)));
        }else{
          Fluttertoast.showToast(
              msg: "Error", toastLength: Toast.LENGTH_LONG);
          setState(() {
            processing=false;
          });
        }
    }
    }
    setState(() {
      processing=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: Color(0xFFEFEFEF),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Container(
                width: double.infinity,
                height: 36,
                alignment: Alignment.center,
                child: Text(
                  "Edit your Profile",
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'OpenSans2',
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 30,),
              SUtextFieldDesign(
                  "${_user.name}",
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: ()=>changeState(t1),
                  ),
                  false,
                  TextInputType.name,
                  tName,t1),
              SizedBox(height: 30,),
              SUtextFieldDesign(
                  "${_user.phone}",
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: ()=>changeState(t2),
                  ),
                  false,
                  TextInputType.phone,
                  tPhone,t2),
              SizedBox(height: 30,),
              SUtextFieldDesign(
                  "${_user.pharmName}",
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: ()=>changeState(t3),
                  ),
                  false,
                  TextInputType.text,
                  tPharmaName,t3),
              SizedBox(height: 30,),
              SUtextFieldDesign(
                  "${_user.adress}",
                  IconButton(
                    icon: _a,
                    onPressed: (){
                      changeState(t4);
                    },
                  ),
                  false,
                  TextInputType.text,
                  tAdress,t4),
              SizedBox(height: 30,),
              SUtextFieldDesign(
                  "Your Password",
                  IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: ()=>changeState(t5),),
                  t5,
                  TextInputType.visiblePassword,
                  tPassword,true),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(0.0),
                height: 53,
                width:195 ,
                child: FlatButton(
                  onPressed:Update,
                  color: Color(0xFFc31432),
                  child: Center(child: Text("Save",style: TextStyle(
                    fontFamily: 'OpenSansR',
                    color: Colors.white,
                    fontSize: 21,
                  ),)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(52),
                  ),
                ),
              ),
              SizedBox(height: 20,),
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

class _SUtextFieldDesign extends StatelessWidget {
  final String hint;
  final bool check;
  final  type;
  final TextEditingController _textEditingController;
  final IconButton _icon;
final bool enabled;
   _SUtextFieldDesign(this.hint,this._icon, this.check, this.type, this._textEditingController,this.enabled);
//  final IconButton _icon;


  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Container(

      padding: EdgeInsets.only(left: 31,right: 10,top: 6,),

      height: (57*h)/788,
      width: (333*w)/374,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(35), color: Colors.white,boxShadow: [
        BoxShadow(
          offset: Offset(5, 7),
          blurRadius: 6,
          color: Colors.black.withOpacity(0.16),
        )
      ]),
      child: Expanded(
        child: TextField(
          controller: _textEditingController,
          keyboardType: type ,
          enabled: enabled,
          obscureText: check,
          onChanged: (value) {},
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans3',
            fontSize: 18,
          ),
          decoration: InputDecoration(
              suffixIcon: _icon,
              hintText: hint,
              hintStyle: TextStyle(
                  color: Color(0xFF0F0B0B),
                  fontSize: 14,
                  fontFamily: 'OpenSans'),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}