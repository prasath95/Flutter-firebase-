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
 //List<Todo> list=[];
 List<Map> list = [];

  // getTododata() {
  //   getdata();
  // }

  getdata() async {
    String userid = FirebaseAuth.instance.currentUser.uid;

    DatabaseReference db =
        FirebaseDatabase.instance.reference().child("todo").child(userid);
    await db.once().then((DataSnapshot snapshot) {

      Map<dynamic, dynamic> values = snapshot.value;
  
      // setState(() {
      //   for(Todo td in list)
      //   {
      //     list.add(td);
      //   }
      // });
     

        setState(() {
          values.forEach((key, values) {
                //print(values["note"]);
                // List<Todo> list = List();
                list.add(values);
              });
        });

      


    });
  }

  @override
  void initState() {
    super.initState();
   // getTododata();
    getdata();
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
      body: Container(
        
        child: list.length < 1
                ? Center(
                  child: Column(
                    children: [
                      ListTile(
                          leading: CircularProgressIndicator(), title: Text('Loading...')),
                    ],
                  ),
                )
                : 
        ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index)
          {
              return GestureDetector(
                              child: Card(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:CrossAxisAlignment.start, 
                  children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${list[index]['note']}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Status - "+'${list[index]['status']}'),
                      )
                ],),),
                onTap: ()
                
                   => Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text(index.toString()))),
                
              );
          })
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
