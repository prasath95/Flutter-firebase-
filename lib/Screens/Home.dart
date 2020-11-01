import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sam/Model/TodoModel.dart';
import 'package:flutter_sam/Screens/Login.dart';
import 'package:flutter_sam/Screens/TaskPage.dart';

class Home extends StatefulWidget {
  static final String id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 List<Todo> list;

  getTododata() {
    getdata();
  }

  getdata() async {
    String userid = FirebaseAuth.instance.currentUser.uid;

    DatabaseReference db =
        FirebaseDatabase.instance.reference().child("todo").child(userid);
    await db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
     

      values.forEach((key, values) {
        print(values["note"]);
        // List<Todo> list = List();
        list.add(values);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getTododata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              // do something
              await FirebaseAuth.instance.signOut();
              // Navigator.pushNamed(context, Login.id);
              Navigator.pushReplacementNamed(context, Login.id);

              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) => Login()),
              //     (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: new Container(
        child: new Column(
          children: [
            new Flexible(
              child: new ListView.builder(
                itemCount: list.length ,
                itemBuilder: (context,index)
                {
                  return new Card(
                    child: Column(
                      children: [
                        Text('ok'),
                      ],
                    ),
                  );
                }
            ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamedAndRemoveUntil(context, '/TaskPage');
          //  Navigator.pushNamed(context, '/TaskPage');
          // Navigator.of(context).pushNamedAndRemoveUntil('/TaskPage', (Route<dynamic> route) => false);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => TaskPage()),
          // );

          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskPage()));
          Navigator.pushNamed(context, TaskPage.id);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  // _Dialog() {

  // showDialog(
  //     context: context,
  //    builder: (context) {
  //      return Dialog(
  //        shape: RoundedRectangleBorder(
  //          borderRadius: BorderRadius.circular(40),
  //        ),
  //        elevation: 16,
  //        child: Container(
  //          height: 250.0,
  //          width: (MediaQuery.of(context).size.width - 50),

  //        ),
  //      );
  //    }
  // );

  // } //
}
