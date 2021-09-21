import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class MyBottomBar extends StatelessWidget {
  final Function _f1;
  final Function _f2;
  final Function _f3;
  final double _h;
  final double _w;

  const MyBottomBar( this._h, this._w,this._f1, this._f2, this._f3 ) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _w,
      height: 62*_h/788,
      color: Color(0xFFEFEFEF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlatButton(onPressed: _f1, child: SvgPicture.asset("assets/icons/HomeIcon.svg")),
          FlatButton(onPressed: _f2, child: SvgPicture.asset("assets/icons/BackIcon.svg")),
          FlatButton(onPressed: _f3, child: SvgPicture.asset("assets/icons/MenuIcon.svg")),
        ],
      ),
    );
  }
}
