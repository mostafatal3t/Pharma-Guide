import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_guide/AfterLogin/myDrugs.dart';
import 'package:pharma_guide/AfterLogin/profilePage.dart';
import 'package:pharma_guide/AfterRegister/addDrugs.dart';
import 'package:pharma_guide/Guest/aboutUs.dart';
import 'package:pharma_guide/photo.dart';
import 'package:pharma_guide/sign/Api/userModel.dart';
import 'package:pharma_guide/sign/sign_in.dart';
import 'package:http/http.dart' as http;
class MyDrawerAfterLogin extends StatefulWidget {
  final User _user;
  MyDrawerAfterLogin(this._user);
  @override
  _MyDrawerAfterLoginState createState() => _MyDrawerAfterLoginState(_user);
}

class _MyDrawerAfterLoginState extends State<MyDrawerAfterLogin> {

  FileImage fileImage;
  final User user;
  _MyDrawerAfterLoginState( this.user);
   String data=null;
   MemoryImage _image;
  void getImage()async{
      // var uri="https://pharmaguied555.000webhostapp.com/api/updateUserInfo";
     // var rasult=await http.post(uri);
    // Image2 image2=imageFromJson(rasult.body);
    setState(() {

      //_image=MemoryImage(base64Decode(data));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFEFEFEF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70,),
             //Container(child: Image.asset("assets/images/Logo2.png",height:150,width: 150, fit: BoxFit.fill,)),
            // Container(child: Image.asset("assets/images/profile-user.png",height:150,width: 150, fit: BoxFit.fill,)),
            CircleAvatar(
              radius: 100,
              child: Image.asset("assets/images/Logo2.png"),),

            SizedBox(height: 20,),
            Text(user.name, style: TextStyle(
                fontSize: 18, fontFamily: 'OpenSans2', color: Colors.black),),
            SizedBox(height: 60,),
            ListTile(
              onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>ProfilePage(user))),
              leading: Icon(Icons.person, color: Colors.black,),
              title: Text("My Profile", style: TextStyle(
                  fontSize: 18, fontFamily: 'OpenSans3', color: Colors.black),),
            ),
            SizedBox(height: 15,),
            ListTile(
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyDrug(user.id))),
              leading: SvgPicture.asset(
                "assets/icons/drugg.Svg", height: 20, width: 20,),
              title: Text("My Drugs", style: TextStyle(
                  fontSize: 18, fontFamily: 'OpenSans3', color: Colors.black),),
            ),
            SizedBox(height: 15,),
            ListTile(
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddDrug(user.id))),
              leading: SvgPicture.asset(
                "assets/icons/drugg.Svg", height: 20, width: 20,),
              title: Text("Available Drugs ", style: TextStyle(
                  fontSize: 18, fontFamily: 'OpenSans3', color: Colors.black),),
            ),
            SizedBox(height: 15,),
            ListTile(
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                      AboutUs

                        ())),
              leading: Icon(Icons.error, color: Colors.black,),
              title: Text("About Us", style: TextStyle(
                  fontSize: 18, fontFamily: 'OpenSans3', color: Colors.black),),
            ),
            SizedBox(height: 15,),
            ListTile(
              onTap: () =>
                  Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(builder: (context) => SignIn())),
              leading: Icon(
                Icons.power_settings_new_outlined, color: Colors.black,),
              // leading: SvgPicture.asset("assets/icons/BackIcon.svg"),
              title: Text("Sign Out", style: TextStyle(
                  fontSize: 18, fontFamily: 'OpenSans3', color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}






