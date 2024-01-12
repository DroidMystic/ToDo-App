import 'package:flutter/material.dart';
import 'package:rptodoapp/Controllers/todo_controller.dart';
import 'package:rptodoapp/models/todo.dart';
import 'package:rptodoapp/widgets/todo_item.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  final todosList = ToDo.todoList();
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title:const Text('Todo App'),
        actions: const [Icon(Icons.lightbulb_sharp)],),
      body: Stack(
        children: [
            Container(
              padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Obx(() =>Column(
                children: [
                  Expanded(
                    child:ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 5,
                            bottom: 20,
                          ),
                          child: const Text(
                            "All ToDos",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        for (ToDo todoo in todosList)
                        TodoItem(
                          todo: todoo,
                          onToDoChanged: todoController.handleToDoChange,
                          onDeleteItem: todoController.deleteToDoItem),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0,0.0),
                        spreadRadius: 0.0,
                        blurRadius: 10.0,
                      ),],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: todoController.toDoController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                    bottom: 20
                  ),
                  child: ElevatedButton(onPressed: (){
                    todoController.addToDoItem(todoController.toDoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    backgroundColor: Colors.blueAccent,
                    minimumSize: const Size(60,60)
                  ), child:const Text('+',
                    style: TextStyle(fontSize: 40,color: Colors.white),
                    ),
                    ),
                ),
              ]),
            ),
        ],
      ),
    );
  }
}