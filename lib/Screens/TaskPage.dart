import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sam/Model/TodoModel.dart';
import 'package:flutter_sam/Screens/Home.dart';

class TaskPage extends StatefulWidget {
  static final String id = 'taskpage';
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String _notes, userid, newkey;
 // Todo td;
  final _keyform = GlobalKey<FormState>();
  // DatabaseReference dbnote; //=FirebaseDatabase.instance.reference().child('path');
  // FirebaseAuth auth;
  //       db.set('Done');

  String validateNote(String note) {
    if (note.isEmpty) {
      return "User Name is Empty.";
    }else{
     return null;
    }
  }
    // saveDB() async
    // {

    //   userid = auth.currentUser.uid;
    //   dbnote = FirebaseDatabase.instance.reference().child('todo');
    //   String newkey = dbnote.push().key;


    //   Todo td = new Todo();
    //   td.idd = newkey;
    //   td.notee = _notes;
    //   td.statuss = "new";

    //   await dbnote
    //       .reference()
    //       .child(userid)
    //       .child(newkey)
    //       .set(td)
    //       .then((onValue) {

    //     print("success");
    //     // return true;

    //   }).catchError((onError) {

    //     print("failed");
    //     // return false;
    //   });
    // }

    saveTodb()
    {
        saveTodbb();
        
    }

    saveTodbb() async{

    if (_keyform.currentState.validate()) {
      _keyform.currentState.save();

      userid = FirebaseAuth.instance.currentUser.uid;
    
      DatabaseReference dbref= FirebaseDatabase.instance.reference().child('todo');
  
      String newkey = dbref.push().key;

     // dbref.set(newkey);

      //  Todo td = new Todo();
      //   td.idd = newkey;
      //   td.notee = _notes;
      //   td.statuss = "new";  

      print("userid -"+userid);
      print("new key"+newkey);
      print("notes"+_notes);
  
       await dbref
          .reference()
          .child(userid)
          .child(newkey)
          .set({
            'id':newkey,
            'note':_notes,
            'status':"new"
          })
          .then((onValue) {

        print("success");
       // return true;
       // Navigator.pushReplacementNamed(context, Home.id);
        Navigator.pushNamed(context, Home.id);

      }).catchError((onError) {

        print("failed");
       // return false;
      });

      

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _keyform,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: true,
                    maxLines: 6,
                    minLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Note here',
                    ),
                    validator: (input) => validateNote(input),
                    onSaved: (input) => _notes = input,
                  ),
                ),
                RaisedButton(
                  onPressed:()=> saveTodb(),
                  child: Text('Add Note'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
