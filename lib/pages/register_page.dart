import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:nss_reg/pages/fingerprint.dart';

class BuildRegister extends StatefulWidget {
  const BuildRegister({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BuildRegisterState();
}

class _BuildRegisterState extends State<BuildRegister> {
  get onChanged => null;
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  String selectedDate = 'Select Date';
  bool isChecked = false;

  _routeToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BuildFingerprint()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          child: Column(
            children: [
              // logo
              const SizedBox(height: 50),
              const Image(
                image: AssetImage('assets/images/logo.jpeg'),
                width: 100,
                height: 100,
              ),
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please fill in the details below to register',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
                textInputAction: TextInputAction.next,
                autofillHints: <String>[AutofillHints.givenName],
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                textInputAction: TextInputAction.next,
                autofillHints: <String>[AutofillHints.email],
              ),
              const SizedBox(height: 20),
              const TextField(
                // only numbers
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ID Number',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              // date picker
              TextField(
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1980, 3, 5),
                      maxTime: DateTime(2020, 6, 7), onChanged: (date) {
                    selectedDate = date.toString();
                  }, onConfirm: (date) {
                    setState(() {
                      selectedDate = date.toString().split(' ')[0];
                      // move to next field
                      FocusScope.of(context).nextFocus();
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Date',
                ),
                controller: TextEditingController(text: selectedDate),
              ),
              const SizedBox(height: 20),
              // DropdownButton<String>(
              //   hint: const Text('Select Item'),
              //   value: list.first,
              //   items: list.map((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              //   onChanged: (String? value) {
              //     setState(() {
              //       // do nothing
              //     });
              //   },
              //   // 100% width
              //   isExpanded: true,
              //   elevation: 0,
              //   borderRadius: BorderRadius.circular(10),
              // ),
              // i agree to terms and conditions
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _routeToNextPage();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          primary: const Color.fromARGB(255, 3, 133, 7),
                          shadowColor: const Color.fromARGB(255, 27, 87, 29),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20),
                        ),
                        child: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
