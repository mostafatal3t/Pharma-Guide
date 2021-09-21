import 'package:flutter/material.dart';
class CardOfPharmacy extends StatefulWidget {
  final String _Name;
  final String _Address;
  final String _phone;
  final Function _function;
  CardOfPharmacy(this._Name,this._Address,this._phone,this._function);
  @override
  _CardOfPharmacyState createState() => _CardOfPharmacyState(this._Name,this._Address,this._phone,this._function);
}

class _CardOfPharmacyState extends State<CardOfPharmacy> {
  final String _Name;
  final String _Address;
  final String _phone;
  final Function _function;
  _CardOfPharmacyState(this._Name,this._Address,this._phone,this._function);
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        side:BorderSide(
          width: 0.5,
          color: Colors.black.withOpacity(0.5)
        ) ,
        borderRadius: BorderRadius.circular(10.0),
      ),
      
      margin: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
      child: FlatButton(
        height: 150,
        minWidth: double.infinity,
        onPressed: _function,
        child: Padding(
          padding: const EdgeInsets.only(top: 15,
              left: 10,
              right: 10,
              bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('$_Name',style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSansR',
                    color: Color(0xFFc31432)),),
              ),
              SizedBox(height:15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address: ',style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'OpenSansR',
                      color: Color(0xFF240b36)),),
                  Text('$_Address',maxLines: 2,style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'OpenSansR',
                      color: Color(0xFFc31432)),),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.centerRight,
                child: Text('$_phone',style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'OpenSans2',
                    color: Color(0xFF240b36)),),

              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Click to Show Direction',style: TextStyle(
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
