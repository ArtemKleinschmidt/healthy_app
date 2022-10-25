import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddWeightScreen extends StatefulWidget {
  const AddWeightScreen({Key? key}) : super(key: key);

  @override
  State<AddWeightScreen> createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? chosenDate;

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add weight",
        ),
        leading: GestureDetector(
            child: const Icon(Icons.navigate_before),
            onTap: () => context.pop()),
        actions: [
          TextButton(
            onPressed: () {
              _formKey.currentState!.validate();
            },
            child: Text("SAVE", style: Theme
                .of(context)
                .textTheme
                .button),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
        child: Card(
          color: Platform.isIOS ? Colors.white : Theme
              .of(context)
              .cardColor,
          surfaceTintColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat("MMM dd").format(chosenDate ?? DateTime.now()),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline1,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        await selectDate(context);
                      },
                      child: const Text("Select date"),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(height: 64, width: 300, child: getTextInput()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextInput() {
    final weightFilter = FilteringTextInputFormatter.allow(RegExp(r'[0-9]|\.|,'));

    if (Platform.isIOS) {
      return CupertinoTextFormFieldRow(
        prefix: const Text("Enter your weight: "),
        keyboardType: TextInputType.number,
        inputFormatters: [weightFilter],
        validator: weightValidator,
      );
    } else {
      return TextFormField(
        decoration: const InputDecoration(labelText: "Enter your weight"),
        keyboardType: TextInputType.number,
        inputFormatters: [weightFilter],
        validator: weightValidator,
      );
    }
  }

  String? weightValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your weight';
    }
    try {

      final number = double.parse((value as String).replaceFirst(',', '.'));
      if (number > 200) {
        return 'Please enter a number up to 200';
      }
    } on FormatException {
      return 'Please enter correct value';
    }

    return null;
  }

  Future<void> selectDate(BuildContext context) async {
    final dateTime = await showDatePicker(
        context: context,
        initialDate: chosenDate ?? DateTime.now(),
        firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    setState(() {
      chosenDate = dateTime;
    });
  }
}
