import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App(

  ));
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.hasError);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(debugShowCheckedModeBanner: false,
            home: MyAwesomeApp(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
class MyAwesomeApp extends StatefulWidget {
  @override
  _MyAwesomeAppState createState() => _MyAwesomeAppState();
}

class _MyAwesomeAppState extends State<MyAwesomeApp> {
  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final db = FirebaseFirestore.instance;

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Form'),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: Name,
                    validator: (_val) {
                      if (_val.isEmpty) {
                        return " Can't be empty ";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => Name.clear()),
                      hintText: 'Enter Your Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: Phone,
                    validator: (_val) {
                      if (_val.length <= 10) {
                        return "must be 10 digit";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Phone No',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => Phone.clear()),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Cloud'),
        ),
        body: Column(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createAlertDialog(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
