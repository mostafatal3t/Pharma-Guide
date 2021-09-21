import 'package:flutter/material.dart';
import 'package:pharma_guide/AfterLogin/myDrawerAfterLogin.dart';
import 'package:pharma_guide/AfterLogin/pharmacyModel.dart';
import 'package:pharma_guide/AfterLogin/searchCardUser.dart';
import 'package:pharma_guide/Cards/cardView.dart';
import 'package:pharma_guide/Guest/ApiGuest/DrugModel.dart';
import 'package:pharma_guide/Guest/ApiGuest/GetDrug.dart';
import 'package:pharma_guide/myBottomBar.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_guide/sign/Api/userModel.dart';
class SearchAfterLogin extends StatefulWidget {
final User _user;

 SearchAfterLogin(this._user);
  @override
  _SearchAfterLogin createState() => _SearchAfterLogin(this._user);
}

class _SearchAfterLogin extends State<SearchAfterLogin> {
  User u;
  _SearchAfterLogin(this.u);
  Future<List<SearchDataModel>> SearchPharmacy(String s) async{
    String url="https://pharmaguied555.000webhostapp.com/api/drugs/user/${u.id}";
    final response =await http.post(url,body:{"search":s});
    return searchDataModelFromJson(response.body);
  }
  TextEditingController _search;
  String searchText="";
  Widget y = Container();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _globalKey,
      drawer: MyDrawerAfterLogin(u),
      body: Container(
          color: Color(0xFFEFEFEF),
          height: h,
          width: w,
          child: Stack(
            children: [
              Container(
                height: 217 * h / 788,
                width: w,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/pharma.png", height: 200 * h / 788,
                      width: w,
                      fit: BoxFit.fill,),
                    Positioned(
                      bottom: 0,
                      top: 197,
                      right: 17,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 31, right: 10, bottom: 6),

                        height: (40 * h) / 788,
                        width: (341 * w) / 375,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(35),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 7),
                                blurRadius: 6,
                                color: Colors.black.withOpacity(0.16),
                              )
                            ]),
                        child: Expanded(
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            controller: _search,
                            onChanged: (value) {
                              setState(() {
                                if(value==""){
                                  searchText=null;
                                }else{
                                  searchText = value;}
                              });
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans3',
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              ////////////////////////////////////////////////////////////////////////////////////////////////
                                suffixIcon:Icon(Icons.search),
                                hintText: "Search Your Drug",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'OpenSanR'),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 250,
                left: 0,
                right: 0,
                bottom: 0,
                child:Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: FutureBuilder(
                      future: SearchPharmacy(searchText),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context , index){
                                SearchDataModel model = snapshot.data[index];
                                 return  SearchCardUser(x: u.id, y: model.id, medicine_name: model.name, price: model.price, form: model.form,  status: model.status);
                              });
                        }
                        else if(!snapshot.hasData){
                          return  Center(child: Text("No Drugs" , style: TextStyle(fontSize: 35 , fontFamily: 'OpenSans3' , fontStyle: FontStyle.italic , color: Color(0xFFFF7777)),),);
                        }
                        return Container();
                  }
                  ,
                    )
                ) ,
              )
            ],
          )
      ),
      bottomNavigationBar: MyBottomBar(
          h, w, () {}, () {}, () => _globalKey.currentState.openDrawer()),
    );
  }
}
