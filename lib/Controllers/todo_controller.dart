import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rptodoapp/models/todo.dart';

class TodoController extends GetxController {
  final RxList<ToDo> todosList = <ToDo>[].obs;
  final TextEditingController toDoController = TextEditingController();

  void handleToDoChange(ToDo toDo) {
    toDo.isDone = !toDo.isDone;
    update();
  }

  void deleteToDoItem(String id) {
    todosList.removeWhere((item) => item.id == id);
    update();
  }

  void addToDoItem(String toDo) {
    todosList.add(ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      todoText: toDo,
    ));
    toDoController.clear();
    update();
  }
}
