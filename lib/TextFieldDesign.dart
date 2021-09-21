import 'package:flutter/material.dart';
class SUtextFieldDesign extends StatelessWidget {
  final String hint;
  final bool check;
  final  type;
  final TextEditingController _textEditingController;
  final IconButton _icon;
//  final IconButton _icon;
  final bool en;
  const SUtextFieldDesign(this.hint,this._icon, this.check, this.type, this._textEditingController,this.en);

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