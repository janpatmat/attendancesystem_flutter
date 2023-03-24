import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:itelecexam2/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class landPage extends StatelessWidget {
  final String name;
  final String email;

  landPage(this.name, this.email);

  @override
  Widget build(BuildContext context) {
    CollectionReference students =
        FirebaseFirestore.instance.collection('students');

    Future<void> addStudent() {
      return students
          .add({
            'name': name, // John Doe
            'email': email, // Stokes and Sons
            // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff85C78F),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Keep track of the schedule of your classes",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      " is an attendance checker which can help students and teacher manage their time and conveniently keep track of the tardiness within your class",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Explore how <Name> can help you in your school basis!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const dashBoard()),
                        // );
                        addStudent();
                      },
                      child: Text("data"))
                ],
              )
            ],
          )),
    );
  }
}
