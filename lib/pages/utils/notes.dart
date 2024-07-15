import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class Notes_list extends StatelessWidget {
  final String taskName;
  final bool taskFinish;
  Function(bool?)? onChanged;
  Function(BuildContext)? removeTask;

  Notes_list(
      {super.key,
      required this.taskName,
      required this.taskFinish,
      required this.onChanged,
      required this.removeTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Slidable(
          startActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: removeTask,
                icon: Icons.edit,
                backgroundColor: Colors.green,
                borderRadius: BorderRadius.circular(12),
              )
            ],
          ),
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: removeTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ]),
          child: Container(
            child: Row(
              children: [
                Checkbox(
                  value: taskFinish,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(taskName,
                    style: TextStyle(
                        fontSize: 20,
                        decoration: taskFinish
                            ? TextDecoration.lineThrough
                            : TextDecoration.none)),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(25),
          ),
        ));
  }
}
