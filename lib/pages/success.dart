import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    // your registration details has been submitted
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            // success icon
            Icon(
              Icons.check_circle,
              color: Color.fromARGB(255, 3, 133, 7),
              size: 80,
            ),
            SizedBox(height: 40),
            Text(
              'Success',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your registration details has been submitted',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}
