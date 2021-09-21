import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String medicine_name;
  final double price;
  final String form;
  final Function press;

  const CardView({@required this.medicine_name , @required this.price,@required this.form, @required this.press});

  @override
  Widget build(BuildContext context) {
    return Card(

      borderOnForeground: true,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),
      margin: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
      child: FlatButton(
        height: 150,
        minWidth: double.infinity,
        onPressed: press,
        child: Padding(
          padding: const EdgeInsets.only(top: 15,
              left: 10,
              right: 10,
              bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${medicine_name}',style: TextStyle(
                color: Color(0xFFFF0A0A),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
              SizedBox(height:15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price',style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          decoration: TextDecoration.underline
                      ),
                      ),
                      SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('EGY : ',maxLines: 5,style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                          ),
                          ),
                          Text('${price}',maxLines: 2,style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            //decoration: TextDecoration.underline
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 80),
                    margin: EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Text('Form',style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: TextDecoration.underline
                        ),
                        ),
                        SizedBox(height:10),
                        Text('${form}',maxLines: 2,style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          //decoration: TextDecoration.underline
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Click to Read More',style: TextStyle(
                      color: Color(0xFFFF0A0A),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// class CardView extends StatelessWidget {
//   final String medicine_name;
//   final double price;
//   final String form;
//   final Function press;
//
//   const CardView({@required this.medicine_name , @required this.price,@required this.form, @required this.press});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       borderOnForeground: true,
//       shadowColor: Colors.black,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//
//       ),
//       margin: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
//       child: FlatButton(
//         height: 150,
//         minWidth: double.infinity,
//         onPressed: press,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 15,
//               left: 10,
//               right: 10,
//               bottom: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('${medicine_name}',style: TextStyle(
//                 color: Color(0xFFFF0A0A),
//                 fontStyle: FontStyle.normal,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),),
//               SizedBox(height:15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Price',style: TextStyle(
//                           color: Colors.black,
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           decoration: TextDecoration.underline
//                       ),
//                       ),
//                       SizedBox(height:10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text('EGY : ',maxLines: 5,style: TextStyle(
//                             color: Colors.black,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                           ),
//                           Text('${price}',maxLines: 2,style: TextStyle(
//                             color: Colors.black,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             //decoration: TextDecoration.underline
//                           ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 80),
//                     margin: EdgeInsets.all(0.0),
//                     child: Column(
//                       children: [
//                         Text('Form',style: TextStyle(
//                             color: Colors.black,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                             decoration: TextDecoration.underline
//                         ),
//                         ),
//                         SizedBox(height:10),
//                         Text('${form}',maxLines: 2,style: TextStyle(
//                           color: Colors.black,
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           //decoration: TextDecoration.underline
//                         ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Click to Read More',style: TextStyle(
//                     color: Color(0xFFFF0A0A),
//                     fontStyle: FontStyle.normal,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







