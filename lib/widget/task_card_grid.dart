// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taskmania/model/task.dart';
import 'package:taskmania/theme.dart';

class TaskCardGrid extends StatefulWidget {
  final Task task;
  const TaskCardGrid({
    super.key,
    required this.task,
  });

  @override
  State<TaskCardGrid> createState() => _TaskCardGridState();
}

class _TaskCardGridState extends State<TaskCardGrid> {
  var isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CheckList(
                isDone: isDone,
                onChanged: (value) {
                  setState(
                    () {
                      isDone = !isDone;
                    },
                  );
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 5),
            child: !isDone
                ? Text(
                    widget.task.task,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: blackColor),
                  )
                : Text(
                    widget.task.task,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: darkGrey,
                        decoration: TextDecoration.lineThrough),
                  ),
          ),
          Text(
            widget.task.desc,
            style: TextStyle(fontSize: 14, color: greyColor),
          ),
          Container(
            margin: const EdgeInsets.only(top: 32, bottom: 14),
            height: 1.0,
            color: const Color(0xFFE4E2E2),
          ),
          Center(
            child: Text(
              widget.task.date,
              style: TextStyle(fontSize: 12, color: greyColor),
            ),
          )
        ],
      ),
    );
  }
}

class CheckList extends StatefulWidget {
  final bool isDone;
  final ValueChanged<bool> onChanged;
  const CheckList({
    super.key,
    this.isDone = false,
    required this.onChanged,
  });

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  late bool isDone;

  @override
  void initState() {
    isDone = widget.isDone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(
          () {
            isDone = !isDone;
            widget.onChanged(isDone);
          },
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: isDone ? Colors.transparent : greyColor),
                color: isDone ? bluePrimary : Colors.transparent),
          ),
          Icon(
            Icons.check,
            color: isDone ? Colors.white : Colors.transparent,
            size: 16,
          )
        ],
      ),
    );
  }
}
