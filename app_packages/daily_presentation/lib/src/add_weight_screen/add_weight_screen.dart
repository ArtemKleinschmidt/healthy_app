import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddWeightScreen extends StatefulWidget {
  const AddWeightScreen({Key? key}) : super(key: key);

  @override
  State<AddWeightScreen> createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Add weight",
          ),
          leading: GestureDetector(
            child: Icon(Icons.navigate_before),
            onTap: () => context.pop()
          )),
      body: Center(
        child: Text("Hello, I'm add weight screen"),
      ),
    );
  }
}
