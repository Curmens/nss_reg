import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nss_reg/pages/success.dart';

class BuildFingerprint extends StatefulWidget {
  const BuildFingerprint({Key? key}) : super(key: key);

  @override
  State<BuildFingerprint> createState() => _BuildFingerprintState();
}

_routeToSuccess(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Success()),
  );
}

sensor(count) {
  // alert success after clicking on the fingerprint 5 times then vibrate
  if (count < 5) {
    return HapticFeedback.vibrate();
    // reset count
  }
}

class _BuildFingerprintState extends State<BuildFingerprint> {
  // init count as int
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Fingerprint',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please place your finger on the fingerprint sensor',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                  if (count < 5) {
                    sensor(count);
                  } else if (count == 5) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Success'),
                        content: const Text('Fingerprint has been Captured'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => _routeToSuccess(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                    count = 0;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: const CircleBorder(),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundColor: Color.fromARGB(78, 199, 199, 199),
                // fingerprint image png
                child: Icon(
                  Icons.fingerprint,
                  size: 100,
                  color: Color.fromARGB(255, 17, 17, 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
