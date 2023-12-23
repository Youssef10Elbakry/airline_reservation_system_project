import 'package:flutter/material.dart';
import './ticket_widget.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AvailableTickets extends StatefulWidget {
  const AvailableTickets({super.key});

  @override
  State<AvailableTickets> createState() => _AvailableTicketsState();
}

class _AvailableTicketsState extends State<AvailableTickets> {
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      CollectionReference todosCollection = FirebaseFirestore.instance.collection("Available_Tickets");
      DocumentReference newDoc = todosCollection.doc();
      newDoc.set(
          {
            "departureFrom": "Cairo",
            "destination": "New York",
            "duration": "2 hr 30 mim",
            "endOn": DateTime.now(),
            "id": newDoc.id,
            "numberOfAvailable": 20,
            "price": 150,
            "startOn": DateTime.now(),
          }
      );
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .12,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(color: Color(0xff4F718A),)),
                    Expanded(
                        flex: 7,
                        child: Container(color: Colors.white,))
                  ],
                ),
                CalendarTimeline(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  onDateSelected: (date){

                  },
                  leftMargin: 20,
                  monthColor: Colors.white,
                  dayColor: Color(0xff4F718A),
                  activeDayColor: Color(0xff4F718A),
                  activeBackgroundDayColor: Colors.white,
                  dotsColor: Colors.transparent,
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: provider.todos.length, itemBuilder: (context, index) => TodoWidget(todoIndex: index, onDeleteClick: deleteSpecificTask, todo: provider.todos[index],)),
          // ),
        ],
      );
  }
}


