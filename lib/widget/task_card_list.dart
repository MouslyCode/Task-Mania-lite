// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taskmania/model/task.dart';
import 'package:taskmania/theme.dart';

class TaskCardList extends StatefulWidget {
  final Task task;
  const TaskCardList({
    super.key,
    required this.task,
  });

  @override
  State<TaskCardList> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCardList> {
  var isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 360,
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  !isDone
                      ? Text(
                          widget.task.task,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.clip,
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
                  Text(
                    widget.task.desc,
                    style: TextStyle(fontSize: 14, color: greyColor),
                  )
                ],
              ),
              CheckList(
                isDone: isDone,
                onChanged: (value) {
                  setState(
                    () {
                      isDone = !isDone;
                    },
                  );
                },
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 14),
            height: 1.0,
            color: const Color(0xFFE4E2E2),
          ),
          Text(
            widget.task.date,
            style: TextStyle(fontSize: 12, color: greyColor),
          ),
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
