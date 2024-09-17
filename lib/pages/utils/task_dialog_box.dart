import "package:flutter/material.dart";

class Task_Dialog_Box extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onClose;
  VoidCallback onCheck;

  Task_Dialog_Box(
      {super.key,
      required this.controller,
      required this.onCheck,
      required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      height: 250,
      width: 500,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.green.shade200,
        Colors.red.shade200,
        Colors.yellow.shade200,
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new Task",
            ),
          ),
          const Icon(
            Icons.star,
            size: 60,
            color: Colors.yellow,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  color: Colors.red,
                  iconSize: 50,
                  onPressed: onClose,
                  icon: const Icon(Icons.close)),
              IconButton(
                  color: Colors.green,
                  iconSize: 50,
                  onPressed: onCheck,
                  icon: const Icon(Icons.check)),
            ],
          )
        ],
      ),
    ));
  }
}
