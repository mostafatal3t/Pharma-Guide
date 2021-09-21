import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_guide/Guest/aboutUs.dart';
import 'package:pharma_guide/sign/sign_up.dart';
class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color:Color(0xFFEFEFEF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70,),
            Container(child: Image.asset("assets/images/Logo2.png",height:150,width: 150, fit: BoxFit.fill,)),
            SizedBox(height: 20,),
            Text("Pharma Guide",style: TextStyle(fontSize: 18 , fontFamily: 'OpenSans2',color: Colors.black),),
            SizedBox(height: 33,),
            Container(
              height:40 ,
              width: 115,
              child: FlatButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SignUp())), child: Center(child: Text("Sign Up",style:TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'OpenSans3') ,)),
              color: Color(0xFFFF7976),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
            ),
            SizedBox(height: 60,),
            ListTile(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AboutUs

                ())),
              leading: Icon(Icons.error,color: Colors.black,),
              title: Text("About Us",style: TextStyle(fontSize: 18,fontFamily: 'OpenSans3' , color: Colors.black),),
            ),
            ListTile(
              onTap: (){},
              leading: SvgPicture.asset("assets/icons/BackIcon.svg"),
              title: Text("Exit",style: TextStyle(fontSize: 18,fontFamily: 'OpenSans3' , color: Colors.black),),
            ),
          ],
      ),
      ),
    );
  }
}
