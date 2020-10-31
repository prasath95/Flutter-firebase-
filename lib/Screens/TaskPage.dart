import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaskPage extends StatefulWidget {
  static final String id = 'taskpage';
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Row(
            children: [
              
                RaisedButton(
                  onPressed: (){},
                  child: Text('hii'),
                )
            ],
          ),
        ),
      ),
    );
  }
}
