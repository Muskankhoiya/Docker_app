import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyAppLW());

String x;

class MyAppLW extends StatefulWidget {
  @override
  _MyAppLWState createState() => _MyAppLWState();
}

class _MyAppLWState extends State<MyAppLW> {
  var cmd;
  var webdata;

  myweb(cmd) async {
    var url = "http://13.127.192.240/cgi-bin/web.py?x=${cmd}";
    var r = await http.get(url);

    setState(() {
      webdata = r.body;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('DOCKER APP'),
        backgroundColor: Colors.orange
      ),
      // floatingActionButton: FloatingActionButton(backgroundColor: Colors.orange,onPressed: null,child: Text('Press'),),
      bottomNavigationBar:new BottomNavigationBar(fixedColor: Colors.orange,items: [
        new BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text("Home"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.message),
          title: new Text("message"),
        )
      ]),
      persistentFooterButtons: <Widget>[new Text('docker application                      '),
      new Icon(Icons.ac_unit),],
      drawer: Drawer(
  child: Column(
    children: <Widget>[
      UserAccountsDrawerHeader(
      arrowColor: Colors.black,
      decoration: BoxDecoration(
              color: Colors.orange,
            ),
        
        accountName: Text("MUSKAN"),
        accountEmail: Text("muskan@gmail.com"),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.black,
          child: Text("MK"),
        ),
        otherAccountsPictures: <Widget>[
          CircleAvatar(
            
            backgroundColor: Colors.black,
            child: Text("MK"),
          )
        ],
      ),
      ListTile(
        title: new Text("All Inboxes"),
        leading: new Icon(Icons.mail),
      ),
      Divider(
        height: 0.1,
        color: Colors.black,
      ),
      ListTile(
        title: new Text("Primary"),
        leading: new Icon(Icons.inbox),
      ),
       Divider(
        height: 0.1,
        color: Colors.black,
        
      ),
      ListTile(
        title: new Text("Social"),
        leading: new Icon(Icons.people),
      ),
       Divider(
        height: 0.1,
        color: Colors.black,
      ),
      ListTile(
        title: new Text("Promotions"),
        leading: new Icon(Icons.local_offer),
      ),
       Divider(
        height: 0.1,
        color: Colors.black,
      ),
    ],
  ),
),
      body: Center(
      //  child: Text('commands'),        
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueAccent
              
            ),
            borderRadius: BorderRadius.circular(10)
            
          ),
          
        // padding: EdgeInsets.symmetric(horizontal: 40),
          width: 300,
          height: 400,
         //color: Colors.black,
          child: Column(
            children: <Widget>[
              Text("Enter linux or docker  commands: "),
              Card(
                child: TextField(

                  onChanged: (value) {
                    cmd = value;
                   // print(value);
                  },
                ),
              ),
               Card(
                child: FlatButton(
                  onPressed: () {
                     //print(x); // x=date
                    myweb(cmd);
                  },
                  child: Text('submit'),
                ),
               ),
                Text(webdata ?? "output is will come here...."),
              
            ],
          ),
        ),
      ),
    ));
  }
}
