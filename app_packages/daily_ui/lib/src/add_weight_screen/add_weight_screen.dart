import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:shared_dependencies/go_router.dart';
import 'package:shared_dependencies/intl.dart';

import 'add_weight_bloc/add_weight_bloc.dart';

class AddWeightScreen extends StatefulWidget {
  const AddWeightScreen({Key? key}) : super(key: key);

  @override
  State<AddWeightScreen> createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? chosenDate;
  late double chosenWeight;

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return BlocProvider(
      create: (context) => AddWeightBloc(),
      child: BlocBuilder<AddWeightBloc, AddWeightState>(
        builder: (context, state) {
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
                    final valid = _formKey.currentState!.validate();
                    if (valid) {
                      final bloc = context.read<AddWeightBloc>();
                      bloc.add(SaveWeightEvent(chosenDate!, chosenWeight));
                    }
                  },
                  child: Text("SAVE", style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge),
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
                            DateFormat("MMM dd").format(
                                chosenDate ?? DateTime.now()),
                            style: Theme
                                .of(context)
                                .textTheme
                                .displayLarge,
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
                          SizedBox(
                              height: 64, width: 300, child: getTextInput()),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getTextInput() {
    final weightFilter = FilteringTextInputFormatter.allow(
        RegExp(r'[0-9]|\.|,'));

    if (Platform.isIOS) {
      return CupertinoTextFormFieldRow(
        prefix: const Text("Enter your weight: "),
        keyboardType: TextInputType.number,
        inputFormatters: [weightFilter],
        validator: weightValidator,
        onFieldSubmitted: onWeightSubmitted,
      );
    } else {
      return TextFormField(
        decoration: const InputDecoration(labelText: "Enter your weight"),
        keyboardType: TextInputType.number,
        inputFormatters: [weightFilter],
        validator: weightValidator,
        onFieldSubmitted: onWeightSubmitted,
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

  onWeightSubmitted(String value) {
    setState(() {
      chosenWeight = double.parse(value);
    });
  }

  Future<void> selectDate(BuildContext context) async {
    final dateTime = await showDatePicker(
        context: context,
        initialDate: chosenDate ?? DateTime.now(),
        firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (dateTime != null) {
      setState(() {
        chosenDate = dateTime;
      });
    }
  }
}
