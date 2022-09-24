import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:noteme/theme.dart';

import 'button.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _select =DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        leading: IconButton(icon:Icon(Icons.dark_mode), onPressed: () {  },

        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.yMMMMd().format(DateTime.now())
                      , style: subheading,),
                    SizedBox(height: 10,),
                    Text("TODAY" ,style: heading,),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddButton(),
                ],
              ),


            ],

          ),

          Container(
            margin: const EdgeInsets.only(left: 20,top: 20),
            child: DatePicker(DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),

              selectedTextColor: Colors.white,
              selectionColor: Colors.deepPurple,
              dateTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey
              ),
              onDateChange: (mydate){
                _select=mydate;
              },
            ),

          ),


        ],
      ),
    );
  }
}
