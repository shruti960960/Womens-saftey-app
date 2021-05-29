import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main_drawer.dart';

class Register extends StatefulWidget {
  final fieldText = TextEditingController();



  static const String idScreen = "register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  final fb = FirebaseDatabase.instance;
  var retrievedName="";
  String name = "";
  var retrievedNumber="";
  String number = "";
  var retrievedName2="";
  String name2 = "";
  var retrievedNumber2="";
  String number2 = "";



  _makingPhoneCall() async {
    String url = 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _makingPhone() async {
    String url = 'tel:$number2';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    final ref=fb.reference().child("Student");
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.white],
            ),
          ),
        ),
        title: Text('Add Contact',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),),
      drawer: MainDrawer(),
      body: ListView(children: <Widget>[Expanded(child: Container(
      height: 900,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white]),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
        Padding(
        padding: const EdgeInsets.only(top: 20,),
        child: Text(
          'Add Contact',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 38,
            fontWeight: FontWeight.w900,
          ),),),
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
          SizedBox(height: 35.0,),
        TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(50.0),
              ),
              borderSide: new BorderSide(
                color: Colors.black,
                width: 100.0,
              ),
            ),
            labelText: "Name",
            prefixIcon: Icon(Icons.drive_file_rename_outline, color:Colors.cyan),
            labelStyle: TextStyle(
              fontSize: 14.0,
            ),
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10.0,
            ),
          ),
          style: TextStyle(fontSize: 14.0),
             onChanged: (val){
              setState(() {
            name=val;
            });
          },
          controller: _controller1,

        ),
        SizedBox(height: 9.0,),
        TextField(
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(50.0),
              ),
              borderSide: new BorderSide(
                color: Colors.black,
                width: 100.0,
              ),
            ),
            labelText: "Contact Number",
            prefixIcon: Icon(Icons.contact_phone_outlined, color:Colors.cyan),
            labelStyle: TextStyle(
              fontSize: 14.0,
            ),
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10.0,
            ),
          ),
          style: TextStyle(fontSize: 14.0),
          onChanged: (val){
          setState(() {
           number=val;
           });
           },
          controller: _controller2,
        ),
                  // SizedBox(height: 35.0,),
                  // TextField(
                  //   keyboardType: TextInputType.text,
                  //   decoration: InputDecoration(
                  //     border: new OutlineInputBorder(
                  //       borderRadius: const BorderRadius.all(
                  //         const Radius.circular(50.0),
                  //       ),
                  //       borderSide: new BorderSide(
                  //         color: Colors.black,
                  //         width: 100.0,
                  //       ),
                  //     ),
                  //     labelText: "Name",
                  //     prefixIcon: Icon(Icons.drive_file_rename_outline, color:Colors.cyan),
                  //     labelStyle: TextStyle(
                  //       fontSize: 14.0,
                  //     ),
                  //     hintStyle: TextStyle(
                  //       color: Colors.grey,
                  //       fontSize: 10.0,
                  //     ),
                  //   ),
                  //   style: TextStyle(fontSize: 14.0),
                  //   onChanged: (val){
                  //     setState(() {
                  //       name2=val;
                  //     });
                  //   },
                  // ),
                  // SizedBox(height: 9.0,),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     border: new OutlineInputBorder(
                  //       borderRadius: const BorderRadius.all(
                  //         const Radius.circular(50.0),
                  //       ),
                  //       borderSide: new BorderSide(
                  //         color: Colors.black,
                  //         width: 100.0,
                  //       ),
                  //     ),
                  //     labelText: "Contact Number",
                  //     prefixIcon: Icon(Icons.contact_phone_outlined, color:Colors.cyan),
                  //     labelStyle: TextStyle(
                  //       fontSize: 14.0,
                  //     ),
                  //     hintStyle: TextStyle(
                  //       color: Colors.grey,
                  //       fontSize: 10.0,
                  //     ),
                  //   ),
                  //   style: TextStyle(fontSize: 14.0),
                  //   onChanged: (val){
                  //     setState(() {
                  //       number2=val;
                  //     });
                  //   },
                  // ),

                  SizedBox(height: 40.0,),
        RaisedButton(
          color: Colors.cyan,
          textColor: Colors.black54,
          child: Container(
            height: 50.0,
            child: Center(
              child: Text(
                "Add Contact",
                style: TextStyle(fontSize: 18.0, fontFamily: "Brand Bold"),
              ),
            ),
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(24.0),
          ),
          onPressed: () => {
           ref.child("name").set(name),
           ref.child("number").set(number),
           // ref.child("name2").set(name2);
           // ref.child("number2").set(number2);
          _controller1.clear(),
            _controller2.clear(),

          },
          ),
           SizedBox(height: 10.0,),
           RaisedButton(
             color: Colors.cyan,
            textColor: Colors.black54,
             child: Container(
               height: 50.0,
               child: Center(
                   child: Text(
                    "Retrieve Contact",
                    style: TextStyle(fontSize: 18.0, fontFamily: "Brand Bold"),
                   ),
                   ),
                       ),
                   shape: new RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(24.0),
                ),
                  onPressed: (){
                   ref.child("name").once().then((DataSnapshot data){
                   setState(() {
                  retrievedName=data.value;
                });
             });
                  ref.child("number").once().then((DataSnapshot data){
                  setState(() {
                  retrievedNumber=data.value;
                });
              });
                   ref.child("name2").once().then((DataSnapshot data){
                     setState(() {
                       retrievedName2=data.value;
                     });
                   });
                   ref.child("number2").once().then((DataSnapshot data){
                     setState(() {
                       retrievedNumber2=data.value;
                     });
                   });
           },
            ),
            SizedBox(height: 30.0,),
            ListTile(
              title:Text(retrievedName,  style: TextStyle(fontSize: 20.0, fontFamily: "Brand Bold", fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 1.0,),
            Slidable(key:ValueKey(ListTile()),
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(caption: 'Call',
                  color: Colors.green,
                  icon: Icons.call,
                  closeOnTap: false,
                  onTap: (_makingPhoneCall),
                )
              ],
              dismissal: SlidableDismissal(child: SlidableDrawerDismissal()),
              child:  ListTile(
                title:Text(retrievedNumber,  style: TextStyle(fontSize: 20.0, fontFamily: "Brand Bold", fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 10.0,),
            ListTile(
              title:Text(retrievedName2,  style: TextStyle(fontSize: 20.0, fontFamily: "Brand Bold", fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 1.0,),
            Slidable(key:ValueKey(ListTile()),
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(caption: 'Call',
                  color: Colors.green,
                  icon: Icons.call,
                  closeOnTap: false,
                  onTap: (_makingPhone),
                )
              ],
              dismissal: SlidableDismissal(child: SlidableDrawerDismissal()),
              child:  ListTile(
                title:Text(retrievedNumber2,  style: TextStyle(fontSize: 20.0, fontFamily: "Brand Bold", fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    ],
        ),
      ),
      ),
      ),
      ],
      ),
    );
  }

}

