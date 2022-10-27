import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); /*FirebaseOptions(
        apiKey: "AIzaSyCnWPBWSc0KjjuFJw0aGHmV8_C_PrDxCG0",
        authDomain: "todoapp-b0558.firebaseapp.com",
        projectId: "todoapp-b0558",
        storageBucket: "todoapp-b0558.appspot.com",
        messagingSenderId: "267280604190",
        appId: "1:267280604190:web:e48b74bec319c1c6faa20f",
        measurementId: "G-N6J71GXRBB"),
  );*/
  //FirebaseCrashlytics.instance.crash();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blueGrey,
      accentColor: Colors.blueGrey,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String todoTitle = "";

  createTodos() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc(todoTitle);

    Map<String, String> todos = {"todoTitle": todoTitle};
    documentReference
        .set(todos)
        .whenComplete(() => print("$todoTitle created"));
  }

  editTodos() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyTodos").doc(todoTitle);

    Map<String, String> todos = {"todoTitle": todoTitle};
    documentReference
        .set(todos)
        .whenComplete(() => print("$todoTitle created"));
  }

  deleteTodos(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc(item);

    documentReference.delete().whenComplete(() => print("$item deleted"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("To do"),
        ),
        floatingActionButton: FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    title: const Text('Add a task'),
                    content: TextField(
                      onChanged: (String value) {
                        todoTitle = value;
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          createTodos();
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"),
                      ),
                    ],
                  );
                });
          },
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshots) {
            // final documents = snapshots.data.docs.length;
            if (snapshots.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshots.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot =
                        snapshots.data.docs[index];
                    return Dismissible(
                        onDismissed: (direction) {
                          deleteTodos(documentSnapshot["todoTitle"]);
                        },
                        key: Key(documentSnapshot["todoTitle"]),
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text(documentSnapshot["todoTitle"]),
                            trailing: IconButton(
                              icon: Icon(Icons.delete_outlined),
                              onPressed: () {
                                deleteTodos(documentSnapshot["todoTitle"]);
                              },
                              color: Colors.red,
                            ),
                          ),
                        ));
                  });
            }
            return Container();
          },
        ));
  }
}
