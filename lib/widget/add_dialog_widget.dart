// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:taskmania/model/task.dart';
import 'package:taskmania/theme.dart';

class AddDialogWidget extends StatefulWidget {
  final Function(Task) onTaskAdded;
  const AddDialogWidget({
    super.key,
    required this.onTaskAdded,
  });

  @override
  State<AddDialogWidget> createState() => _AddDialogWidgetState();
}

class _AddDialogWidgetState extends State<AddDialogWidget> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

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

  void addTask() {
    if (taskController.text.isNotEmpty &&
        descController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      Task newTask = Task(
          task: taskController.text,
          desc: descController.text,
          date: dateController.text);
      widget.onTaskAdded(newTask);
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Task Added')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please Fill the Form')));
    }
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
              'Add Task',
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

            Container(
              margin: const EdgeInsets.only(top: 64),
              child: ElevatedButton(
                onPressed: () {
                  addTask();
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(105, 33),
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
                    backgroundColor: bluePrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.add,
                      color: whiteColor,
                    ),
                    Text(
                      'Add',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: whiteColor,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
