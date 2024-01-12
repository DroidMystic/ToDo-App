// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rptodoapp/models/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final Function(String) onDeleteItem;
  const TodoItem({Key? key, required this.todo, required this.onDeleteItem, required this.onToDoChanged})
   : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Obx(()=>ListTile(
        onTap: (){
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading:Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
        ),
        title:Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
          ),
          trailing: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child:IconButton(
              color: Colors.white,
              onPressed: (){
                onDeleteItem(todo.id);
                // onDeleteItem(todo.id?.toString() ?? '');
              }, 
              icon: const Icon(Icons.delete),
              iconSize: 20
              ),
          ),
      ),
      ),
    );
  }
}