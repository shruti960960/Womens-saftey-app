import 'package:women_safety_app/AddContact.dart';
import 'package:women_safety_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'main_drawer.dart';

class ContactList extends StatefulWidget{
  static const routeName = 'ContactList-widget';
  @override
  State<StatefulWidget> createState() => _ContactListState();



}

class _ContactListState extends State<ContactList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan,Colors.white],

            ),
          ),
        ),
        title: new Text("Contact List",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),),
      ),
      drawer: MainDrawer(),
        body: Center(
            child: Column(

            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register(),
              ),);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ) );



  }

}