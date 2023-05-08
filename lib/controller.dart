import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxList<String> todoList = <String>[].obs;
  TextEditingController todoController = TextEditingController();

  void addTodo(String todo) {
    if (todo.isNotEmpty) {
      todoList.add(todo);
    }
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
  }

  void saveData() async {}
}
