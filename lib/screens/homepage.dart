import 'package:flutter/material.dart';
import 'package:rptodoapp/models/todo.dart';
import 'package:rptodoapp/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDo.todoList();
  final _toDoController = TextEditingController();

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
              child: Column(
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
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem)
                        
                      ],
                    ),
            
                  )
                ],
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
                      controller: _toDoController,
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
                    _addToDoItem(_toDoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                   
                    backgroundColor: Colors.blueAccent,
                    minimumSize: const Size(60,60)
                  ), child:const Text('+',
                    style: TextStyle(fontSize: 40,color: Colors.white)),),

                )
              ]),
            )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo toDo){
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }
  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id:DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
    });
    _toDoController.clear();
  }
}