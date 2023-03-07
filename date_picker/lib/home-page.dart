import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //create datetime variable
  DateTime _dateTime = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  //show date picker method
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //display chose date
            Text(
              formatter.format(_dateTime).toString(),
              style: TextStyle(fontSize: 30),
            ),
            //button
            MaterialButton(
              onPressed: _showDatePicker,
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Choose Date',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
