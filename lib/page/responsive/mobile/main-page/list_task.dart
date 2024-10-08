import 'package:flutter/material.dart';
import 'package:taskmania/model/task.dart';
import 'package:taskmania/theme.dart';
import 'package:taskmania/widget/edit_dialog_widget.dart';
import 'package:taskmania/widget/task_card_list.dart';

// ignore: must_be_immutable
class ListTask extends StatefulWidget {
  List<Task> tasks;
  ListTask({
    super.key,
    required this.tasks,
  });

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    if (widget.tasks.isEmpty) {
      return Center(
        child: Text(
          'There is no Task',
          style: TextStyle(color: darkGrey, fontSize: 18),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          child: EditDialogWidget(
                            task: widget.tasks[index],
                            index: index,
                            onDeleted: (index) {
                              setState(() {
                                widget.tasks.removeAt(index);
                              });
                            },
                            onTaskUpdated: (index, Task editedTask) {
                              setState(() {
                                widget.tasks[index] = editedTask;
                              });
                            },
                          ),
                        ));
              },
              child: TaskCardList(task: widget.tasks[index]));
        },
      );
    }
  }
}
