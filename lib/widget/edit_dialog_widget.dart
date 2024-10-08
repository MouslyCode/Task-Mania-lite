// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:taskmania/model/task.dart';
import 'package:taskmania/theme.dart';

class EditDialogWidget extends StatefulWidget {
  final Function(int) onDeleted;
  final Function(int, Task) onTaskUpdated;
  final Task task;
  final int index;

  const EditDialogWidget({
    super.key,
    required this.onDeleted,
    required this.onTaskUpdated,
    required this.task,
    required this.index,
  });

  @override
  State<EditDialogWidget> createState() => _EditDialogWidgetState();
}

class _EditDialogWidgetState extends State<EditDialogWidget> {
  TextEditingController taskController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    taskController.text = widget.task.task;
    descController.text = widget.task.desc;
    dateController.text = widget.task.date;
  }

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2024),
        lastDate: DateTime(2055));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('dd MMM yyyy').format(selectedDate);
      });
    }
  }

  void SaveTask() {
    if (taskController.text.isNotEmpty &&
        descController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      final Task editedTask = Task(
          task: taskController.text,
          desc: descController.text,
          date: dateController.text);
      widget.onTaskUpdated(widget.index, editedTask);
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Task Edited')));
    }
  }

  void DeleteTask() {
    widget.onDeleted(widget.index);
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Task Deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Edit Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, color: blackColor, fontWeight: FontWeight.bold),
            ),

            // Widget Imput Text Task
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task',
                    style: TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    decoration: BoxDecoration(
                        color: blueFade,
                        borderRadius: BorderRadius.circular(6)),
                    child: TextField(
                      controller: taskController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),

            // Widget Imput Text Desc
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Desc',
                    style: TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    decoration: BoxDecoration(
                        color: blueFade,
                        borderRadius: BorderRadius.circular(6)),
                    child: TextField(
                      controller: descController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),

            // Widget Imput Text Date
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 50,
                        decoration: BoxDecoration(
                            color: blueFade,
                            borderRadius: BorderRadius.circular(6)),
                        child: TextField(
                          controller: dateController,
                          decoration: InputDecoration(
                              hintText: 'Select the date',
                              hintStyle: TextStyle(color: greyColor),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 64),
                  child: ElevatedButton(
                    onPressed: () {
                      SaveTask();
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(105, 33),
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 14),
                        backgroundColor: bluePrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.save,
                          color: whiteColor,
                        ),
                        Text(
                          'Save',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: whiteColor,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 64),
                  child: ElevatedButton(
                    onPressed: () {
                      DeleteTask();
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(105, 33),
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 14),
                        backgroundColor: redColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.delete,
                          color: whiteColor,
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: whiteColor,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
