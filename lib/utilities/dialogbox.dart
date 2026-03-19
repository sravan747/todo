import 'package:flutter/material.dart';
import 'package:todo/utilities/mybutton.dart';

class dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;

  dialogbox({super.key, required this.controller,required this.oncancel,required this.onsave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a New Task',
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Mybutton(text: 'Save', onPressed: onsave),
                  Mybutton(text: 'Cancel', onPressed: oncancel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
