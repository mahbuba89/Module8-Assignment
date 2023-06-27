
import 'package:flutter/material.dart';
import 'package:untitled3/custom%20widget/custom_widget.dart';
import 'package:untitled3/model/task.dart';

import '../const/text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Task list here
  List<Task> task = [
    Task(
      title: 'Rajshahi',
      deadline: '${DateTime.now().day}',
      description: 'Rajshahi is a clean city',
    ),
    Task(
      title: 'Dhaka',
      deadline: '${DateTime.now().day}',
      description: 'Dhaka is very nice city',
    ),
  ];

  //Add task controller in floatingActionButton
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: Text(taskManagement),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: task.length,
        itemBuilder: (context, index) => ListTile(
          onLongPress: () {
            showModalBottom(index: index);
          },
          title: Text(
            task[index].title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            task[index].description.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          tileColor: Colors.orange,
        ),
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 5,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // onLongPress showbottomsheet option property
  String titles = '';
  String descriptions = '';
  String deadlines = '';
  String details = '';

//When click floatingActionButton than show the dialog
  void showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red.shade400,
          title: Text(addtask),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                  hintText: title,
                  labelText: enterYourTitle,
                  controller: titleController,
                  onChange: (value) => descriptions = value),
              CustomTextFormField(
                  hintText:  description,
                  labelText: enterYourDesc,
                  controller: descriptionController,
                  onChange: (value) => descriptions = value),
              CustomTextFormField(
                  hintText:deadline,
                  labelText: enterYourDeadline,
                  controller: deadlineController,
                  onChange: (value) => descriptions = value),

            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: addTask,
              child: Text(save),
            ),
          ],
        );
      },
    );
  }

  //when click onLongPress then showModalBottom
  void showModalBottom({required index}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        color: Colors.red.shade400,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              taskDetails,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Title: ${task[index].title}'),
            SizedBox(height: 8.0),
            Text('Description: ${task[index].description}'),
            SizedBox(height: 8.0),
            Text('Day Required: ${task[index].deadline}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                task.removeAt(index);
                if (mounted) {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                }
              },
              child: Text(deleteTask),
            ),
          ],
        ),
      ),
    );
  }

  //FloatingActionButton addTask method
  void addTask() {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        deadlineController.text.trim().isNotEmpty) {
      task.add(Task(
        title: titleController.text.trim(),
        deadline: deadlineController.text.trim(),
        description: descriptionController.text.trim(),
      ));
      Navigator.of(context).pop();
      titleController.clear();
      descriptionController.clear();
      detailsController.clear();
      deadlineController.clear();
    }
    if (mounted) {
      setState(() {});
    }
  }
}