// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taskmania/model/task.dart';
import 'package:taskmania/page/responsive/mobile/main-page/list_task.dart';
import 'package:taskmania/page/responsive/web/main-page/grid_task.dart';
import 'package:taskmania/theme.dart';
import 'package:taskmania/widget/add_dialog_widget.dart';

class MainPage extends StatefulWidget {
  final String name;
  const MainPage({
    super.key,
    required this.name,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueBack,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            text: 'Hi, ',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: blackColor),
            children: [
              TextSpan(
                  text: widget.name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: blackColor))
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 700) {
              return ListTask(tasks: tasks);
            } else if (constraints.maxWidth <= 730) {
              return GridTask(gridCount: 3, tasks: tasks);
            } else if (constraints.maxWidth <= 890) {
              return GridTask(gridCount: 4, tasks: tasks);
            } else if (constraints.maxWidth <= 1050) {
              return GridTask(gridCount: 5, tasks: tasks);
            } else if (constraints.maxWidth <= 1400) {
              return GridTask(gridCount: 6, tasks: tasks);
            } else {
              return GridTask(gridCount: 8, tasks: tasks);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: AddDialogWidget(
                onTaskAdded: (Task newTask) {
                  setState(() {
                    tasks.add(newTask);
                  });
                },
              ),
            ),
          );
        },
        backgroundColor: bluePrimary,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
    );
  }
}
