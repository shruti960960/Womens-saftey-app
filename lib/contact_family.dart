import 'dart:async';
import 'package:flutter_contact/contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(ReadContacts());
}

class ReadContacts extends StatefulWidget {


  @override
  _ReadContactsState createState() => _ReadContactsState();
}

class _ReadContactsState extends State<ReadContacts> {
  List<Contact>listContacts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listContacts=new List();
    readContacts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.white],
            ),
          ),
        ),
        title: Text('Contacts',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black54
          ),
        ),),
      body: Container(

        child:(listContacts.length>0)?
        ListView.builder(
            itemCount: listContacts.length,
            itemBuilder: (context,index){
              Contact contact=listContacts.get(index);
              return Card(
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      child:  Center(child: (contact.avatar!=null)?Image.memory(contact.avatar,height: 28,width: 28,):Icon(Icons.face),),)
                    ,
                    title: Text("${contact.displayName}"),
                    subtitle: Text((contact.phones.length>0)?"${contact.phones.get(0)}":"No contact"),
                    trailing:InkWell(child:  Icon(Icons.call,color: Colors.green,),
                      onTap: (){
                      _makePhoneCall("tel:${contact.phones.length.gcd(0)}");
                    },)
                ),
              );

            }):Center(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CircularProgressIndicator(backgroundColor: Colors.red,),Text("reading Contacts...")],),),
      ),
    );
  }
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  readContacts() async
  {

    final PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Contacts.streamContacts().forEach((contact) {
        print("${contact.displayName}");
        setState(() {
          listContacts.add(contact);
        });
      });
    }

    // You can manually adjust the buffer size
    //return  Contacts.streamContacts(bufferSize: 10);

  }

  //Check contacts permission
  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
      await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }
}
