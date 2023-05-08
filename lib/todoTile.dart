// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class TodoTile extends StatefulWidget {
  String todo;
  int index;
  TodoTile({super.key, required this.todo, required this.index});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool isChecked = false;
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        shape: RoundedRectangleBorder(
          //<-- SEE HERE
          side: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: isChecked ? Colors.grey : Colors.pink[100],
        leading: Checkbox(
          checkColor: Colors.white,
          value: isChecked,
          shape: const CircleBorder(),
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        title: Text(widget.todo),
        trailing: IconButton(
            onPressed: () {
              mainController.deleteTodo(widget.index);
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            )),
      ),
    );
  }
}
