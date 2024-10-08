import 'package:flutter/material.dart';
import 'package:taskmania/model/task.dart';
import 'package:taskmania/theme.dart';
import 'package:taskmania/widget/edit_dialog_widget.dart';
import 'package:taskmania/widget/task_card_grid.dart';

class GridTask extends StatefulWidget {
  final int gridCount;
  final List<Task> tasks;
  const GridTask({
    super.key,
    required this.gridCount,
    required this.tasks,
  });

  @override
  State<GridTask> createState() => _GridTaskState();
}

class _GridTaskState extends State<GridTask> {
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
      return GridView.count(
          crossAxisCount: widget.gridCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(widget.tasks.length, (index) {
            final task = widget.tasks[index];
            return InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                        child: EditDialogWidget(
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
                            task: task,
                            index: index),
                      )),
              child: TaskCardGrid(
                task: task,
              ),
            );
          }));
    }
  }
}
