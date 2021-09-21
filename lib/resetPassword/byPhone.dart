import 'package:flutter/material.dart';
import 'package:pharma_guide/resetPassword/byMail.dart';
import 'package:pharma_guide/resetPassword/reseveCode.dart';
import 'package:pharma_guide/sign/sign_in.dart';

class ByPhone extends StatelessWidget {
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
                 width: double.infinity,
                 child: IconButton(
                   onPressed: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>SignIn())),
                   icon: Icon(
                     Icons.arrow_back_outlined,
                     color: Colors.black,
                     size: 40,
                   ),
                 ),
               ),
               SizedBox(height: (133*h)/788,),
               Text("Enter Your Phone Number",style: TextStyle(fontSize: 26,fontFamily: 'OpenSans3'),),
               SizedBox(height: (59*h)/788,),
               // SUtextFieldDesign("Phone", IconButton(icon:Icon(Icons.phone,size: 20,),color: Colors.black.withOpacity(0.5),onPressed: (){}), false, TextInputType.phone),
               Container(

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
                     keyboardType: TextInputType.phone ,
                     obscureText: false,
                     onChanged: (value) {},
                     style: TextStyle(
                       color: Colors.black,
                       fontFamily: 'OpenSans3',
                       fontSize: 25,
                     ),
                     decoration: InputDecoration(
                         suffixIcon: Icon(Icons.phone,size: 20,color: Colors.black.withOpacity(0.5),),
                         hintText: "Phone",
                         hintStyle: TextStyle(
                             color: Color(0xFF0F0B0B),
                             fontSize: 14,
                             fontFamily: 'OpenSans'),
                         enabledBorder: InputBorder.none,
                         focusedBorder: InputBorder.none),
                   ),
                 ),
               ),
               SizedBox(height: (19*h)/788,),
               Container(
                 alignment: Alignment.centerRight,
                 height: 24,
                 margin: EdgeInsets.only(right: 15),
                 child: InkWell(
                     onTap:()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ByMail())),
                     child: Text("Send Reset Link to your Mail" ,
                     style: TextStyle(
                     fontFamily: 'OpenSansR',
                     decoration: TextDecoration.underline,
                     fontSize: 16,
                     color: Color(0xFF1C28D6)),)),
               ),
               SizedBox(height: (90*h)/788,),
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
