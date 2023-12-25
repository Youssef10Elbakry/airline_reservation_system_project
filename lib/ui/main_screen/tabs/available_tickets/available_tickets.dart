import 'package:flutter/material.dart';
import './ticket_widget.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:airline_reservation_system/ui/provider/available_tickets_provider.dart';



class AvailableTickets extends StatefulWidget {
  const AvailableTickets({super.key});


  @override
  State<AvailableTickets> createState() => _AvailableTicketsState();
}




class _AvailableTicketsState extends State<AvailableTickets> {
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      provider.loadAvailableTickets();
    } );
  }
  late ATProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
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
                  initialDate: provider.selectedDate,
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  onDateSelected: (date){
                    provider.selectedDate = date;
                    provider.loadAvailableTickets();
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
          Expanded(
            child: ListView.builder(
                itemCount: provider.availableTickets.length, itemBuilder: (context, index)=>TicketWidget(ticket: provider.availableTickets[index])),
          ),
        ],
      );
  }
}

