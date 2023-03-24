import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:itelecexam2/models/students.dart';

class studentPage extends StatefulWidget {
  const studentPage({super.key});

  @override
  State<studentPage> createState() => _studentPageState();
}

class _studentPageState extends State<studentPage> {
  List<Students> studentList = [];

  void initState() {
    // TODO: implement initState
    super.initState();
    print("oiewhfiwuebgowebfouwebfowebfowebvpweinkfowiefboub");

    fetchRecords();

    super.initState();
  }

  fetchRecords() async {
    var records = await FirebaseFirestore.instance.collection('students').get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map((e) => Students(id: e.id, name: e['name'], email: e['email']))
        .toList();

    print(_list[0].name);

    setState(() {
      studentList = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    TableRow _tableRow = TableRow(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(studentList[0].name),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(studentList[0].email),
      ),
    ]);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Table(
              border: TableBorder.all(),
              children: <TableRow>[_tableRow],
            ),
          ),
        ),
      ),
    );
  }
}
