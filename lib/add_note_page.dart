import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:noteme/button.dart';
import 'package:noteme/taskconrol.dart';
import 'package:noteme/taskdata.dart';
import 'package:noteme/theme.dart';

import 'input_field.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final TaskContollers taskContollers = Get.put(TaskContollers());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String selectDate = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String endtTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int selectReminder = 5;
  List<int> reminderList = [5, 10, 15, 20];
  String selectRepet = "None";
  List<String> repetList = ["None", "Daily", "Weekly", "Monthly"];
  int colornote = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [CircleAvatar()],
        backgroundColor: context.theme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Note",
              style: heading,
            ),
            SizedBox(
              height: 15,
            ),
            Field(
              title: "Title",
              hint: "Enter The Title",
              myIcon: null,
              controller: titleController,
            ),
            const SizedBox(
              height: 5,
            ),
            Field(
              title: "Note",
              hint: "Enter The Note",
              myIcon: null,
              controller: noteController,
            ),
            const SizedBox(
              height: 5,
            ),
            Field(
                title: "Date",
                hint: selectDate,
                myIcon: IconButton(
                  onPressed: () {
                    userDate();
                  },
                  icon: Icon(Icons.date_range),
                )),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                    child: Field(
                  title: "Start Time",
                  hint: startTime,
                  myIcon: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () {
                      getuserTime(startTime: true);
                    },
                  ),
                )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Field(
                  title: "End Time",
                  hint: endtTime,
                  myIcon: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () {
                      getuserTime(startTime: false);
                    },
                  ),
                ))
              ],
            ),
            Field(
                title: "Remind",
                hint: " $selectReminder minutes early",
                myIcon: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.grey,
                  ),
                  iconSize: 35,
                  elevation: 4,
                  style: subtitle,
                  underline: Container(
                    height: 0,
                  ),
                  items: reminderList
                      .map<DropdownMenuItem<String>>((int listValue) {
                    return DropdownMenuItem<String>(
                      value: listValue.toString(),
                      child: Text(listValue.toString()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectReminder = int.parse(value!);
                    });
                  },
                )),
            const SizedBox(
              height: 5,
            ),
            Field(
                title: "Repeat",
                hint: " $selectRepet ",
                myIcon: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.grey,
                  ),
                  iconSize: 35,
                  elevation: 4,
                  style: subtitle,
                  underline: Container(
                    height: 0,
                  ),
                  items: repetList
                      .map<DropdownMenuItem<String>>((String listValue) {
                    return DropdownMenuItem<String>(
                      value: listValue.toString(),
                      child: Text(listValue.toString()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectRepet = value!;
                    });
                  },
                )),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Color",
                        style: titleStyle,
                      ),
                      Wrap(
                        children: List<Widget>.generate(3, (int mycolor) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                colornote = mycolor;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: NoteColor(mycolor),
                                child: colornote == mycolor
                                    ? Icon(Icons.download_done_outlined,
                                        color: Colors.white, size: 16)
                                    : Container(),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      validData();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.deepPurpleAccent,
                      ),
                      child: const Text(
                        "Creat TASK",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  validData() {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      toDataBaseJson();
      Get.back();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All Field Are Required !!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: Icon(Icons.warning_amber_outlined),
      );
    }
  }

  toDataBaseJson() {
    taskContollers.addNote(
    task:Task(title:titleController.text,
    note:noteController.text,
    isCompleted:0,
    date:selectDate,
    starttTime:startTime,
    endTime :endtTime,
    color: colornote,
    remind:selectReminder,
    repeat:selectRepet,));
  }

  userDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2023));
    if (date != null) {
      setState(() {
        selectDate = DateFormat.yMd().format(date);
      });
    } else {
      selectDate = DateFormat.yMd().format(DateTime.now());
    }
  }

  getuserTime({required bool startTime}) async {
    var time = await userTime();
    String time2 = time.format(context);
    if (time == null) {
    } else if (startTime == true) {
      setState(() {
        startTime = time;
      });
    } else if (startTime == false) {
      setState(() {
        endtTime = time;
      });
    }
  }

  userTime() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(startTime.split(":")[0]),
            minute: int.parse(startTime.split(":")[1].split(" ")[0])));
  }

  NoteColor(int index) {
    if (index == 0) {
      return Colors.deepPurpleAccent;
    } else if (index == 1) {
      return Colors.amberAccent;
    } else if (index == 2) {
      return Colors.pinkAccent[100];
    }
  }
}
