import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:airline_reservation_system/model/AvailableTickets.dart';
import 'package:airline_reservation_system/ui/main_screen/dotted_hor_line.dart';
import 'package:airline_reservation_system/ui/main_screen/tabs/available_tickets/select_seat/select_seat_screen.dart';

class TicketWidget extends StatelessWidget {
  AvailableTicket ticket;
  List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "June",
    "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
  TicketWidget({required this.ticket});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      decoration: BoxDecoration(
          color: Color(0xffEEF1F4),
          borderRadius: BorderRadius.circular(7)
      ),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      width: 353,
      height: 153,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("${ticket.price}\$", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),],),

          SizedBox(height: 15),
          DottedHorLine(),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20,),
              Text(ticket.departureFrom, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
              Expanded(child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image(image: AssetImage("assets/MainScreen/Line 15.png")),
                  Image(image: AssetImage("assets/MainScreen/plane22.png")),
                ],),),
              SizedBox(width: 5,),
              Text(ticket.destination, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(width: 20,),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Spacer(flex: 1,),
              Text("${ticket.startOn.day} ${months[ticket.startOn.month-1]} ${ticket.startOn.year}", style: TextStyle(fontSize: 10),),
              Spacer(flex: 5,),
              Text("${ticket.duration}", style: TextStyle(fontSize: 10),),
              Spacer(flex: 5,),
              Text("${ticket.endOn.day} ${months[ticket.endOn.month-1]} ${ticket.endOn.year}", style: TextStyle(fontSize: 10),),
              Spacer(flex: 1,)
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Spacer(flex: 1,),
              Text("${ticket.startOn.hour}:${ticket.startOn.minute<10? 0 : ""}${ticket.startOn.minute}", style: TextStyle(fontSize: 10),),
              Spacer(flex: 10,),
              Text("${ticket.endOn.hour}:${ticket.endOn.minute<10? 0 : ""}${ticket.endOn.minute}", style: TextStyle(fontSize: 10),),
              Spacer(flex: 1,)
            ],
          ),

        ],
      ),
    ),
      onTap: (){
          Navigator.pushNamed(context, SelectSeatScreen.screenName, arguments: ticket);
      },
    );
  }
}
