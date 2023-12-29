import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providrors/TodoProvider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed("addNote");
        },
        child: Text("add"),
      ),
      body: FutureBuilder(
          future: context.read<TodoProvider>().todoList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<TodoProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.todosList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(value.todosList[index].todoName),
                        subtitle: Text(
                          value.todosList[index].isComplete.toString(),
                        ),
                        trailing: Checkbox(
                          value: value.todosList[index].isComplete,
                          onChanged: (checkBoxValue) {
                            context.read<TodoProvider>().updateNote(
                                value.todosList[index].id, checkBoxValue);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }),
    );
  }
}
