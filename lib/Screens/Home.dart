import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sam/Screens/Login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () async {
              // do something
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/Login');

                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (context) => Login()),
                //     (Route<dynamic> route) => false);

            },
          )
        ],
      ),
      body: Center(child: Text('hiiii')),
    );
  }
}
