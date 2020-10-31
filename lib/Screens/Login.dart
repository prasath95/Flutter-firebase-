

//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sam/Screens/Home.dart';
import 'package:flutter_sam/Screens/Register.dart';

class Login extends StatefulWidget {
   static final String id='login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
final FirebaseAuth _auth = FirebaseAuth.instance;
   bool _success;
  String _email, _password;
  String _userEmail;
  final formkey = GlobalKey<FormState>();
  

  String validateUname(String uname) {
    if (uname.isEmpty) {
      return "User Name is Empty.";
    } else if (uname.length <= 2) {
      return "Username is too short.";
    } else if (uname.length > 12) {
      return "Username is too long.";
    } else {
      return null;
    }
  }

  String validatePwd(String pwd) {
    if ((pwd.isEmpty)) {
      return "Password is Empty.";
    } else if (pwd.length <= 2) {
      return "Password is too short.";
    } else if (pwd.length > 12) {
      return "Password is too long.";
    } else {
      return null;
    }
  }

void _login() async {

 if (formkey.currentState.validate()) 
 {
   formkey.currentState.save();

   final User user = (await 
      _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      )
  ).user;
  if (user != null) {

    Navigator.pushReplacementNamed(context, Home.id);
    setState(() {
      _success = true;
      _userEmail = _email;
     //  Navigator.pushReplacementNamed(context, "/Home");
      //   Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
    });
  } else {
    setState(() {
      _success = false;
    });
  }
 }
    
}

  // getInput() {
  //   if (formkey.currentState.validate()) {
  //     formkey.currentState.save();

  //     if ((username == "admin") && (password == "123")) {
  //       print("username - " + username + "  Password -" + password);
  //       //  Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
  //      // Navigator.pushReplacementNamed(context, "/Home");
       
  //     } else {
  //       print('wong password');
  //       print(username);
  //       print(password);

        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return Dialog(
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(40)),
        //         elevation: 16,
        //         child: Container(
        //           height: 100.0,
        //           width: 60.0,
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: <Widget>[
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Center(
        //                   child: Text('Enter Correct User name and Password\n Admin\n 123',textAlign: TextAlign.center,),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       );
        //     });
  //     }
  //   }
  // }

  // navigateToRegister()
  // {
  // //  Navigator.pushReplacementNamed(context, "/Register");
  // //Navigator.push(context,MaterialPageRoute(builder: (context) => Register()));
  // // Future.delayed(Duration.zero, () {
  // // Navigator.pushReplacementNamed(context, "/Register");
  // // print('work inside route'); 
  // // });
  // //Navigator.of(context).popUntil((route) => );
  // Navigator.pushNamed(context, '/Register');
  //   print('work'); 

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login here'),
      
      ),
      // body: Center(
      //   child: MaterialButton(onPressed: (){
      //       DatabaseReference db=FirebaseDatabase.instance.reference().child('path');
      //       db.set('Done');
      //   },
      //   height: 200,
      //   minWidth: 200,
      //   child: Text('test'),
      //   ),
      // ),
        body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Well Come',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30.0, left: 30.0, bottom: 20.0),
                child: TextFormField(
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: 'Username here',
                  ),
                  validator: (input) => validateUname(input),
                  onSaved: (input) => _email = input,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30.0, left: 30.0, bottom: 20.0),
                child: TextFormField(
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: 'Password here',
                  ),
                  obscureText: true,
                  validator: (input) => validatePwd(input),
                  onSaved: (input) => _password = input,
                ),
              ),
              ButtonTheme(
                height: 35.0,
                minWidth: 180.0,
                child: RaisedButton(
                  onPressed: () => _login(),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              OutlineButton(
                child: Text('Register Here'),
                onPressed:(){

                  Navigator.pushNamed(context, Register.id);
                //   Navigator.of(context).pushNamedAndRemoveUntil('/Register', (Route<dynamic> route) => false); 
                } //navigateToRegister(),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}