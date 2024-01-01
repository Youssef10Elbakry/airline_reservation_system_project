import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:airline_reservation_system/ui/main_screen/main_screen.dart';
import 'package:airline_reservation_system/model/AvailableTickets.dart';
import 'package:airline_reservation_system/model/confirmation.dart';
import 'package:airline_reservation_system/ui/main_screen/dotted_hor_line.dart';
import 'package:airline_reservation_system/ui/main_screen/tabs/available_tickets/select_seat/select_seat_screen.dart';
class ConfirmationScreen extends StatelessWidget {
  static String screenName = "Confirmation Screen";
  late List<dynamic> combinedReservedSeats;
  late Confirmation arguments;
  ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as Confirmation;
    print(arguments.selectedSeats);
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation", style: const TextStyle(fontSize: 27)),
        backgroundColor: const Color(0xff4F718A),
        centerTitle: true,
        toolbarHeight: 91,

      ),

      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(
              margin: EdgeInsets.only(top: 25),
              height: 400,
              width: 353,
              decoration: BoxDecoration(
                  color: Color(0xffEEF1F4),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("Price of Ticket: ${arguments.selectedTicket.price}", style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Spacer(),
                  DottedHorLine(),
                  Spacer(),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("Number of Tickets: ${arguments.selectedSeats.length}", style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Spacer(),
                  DottedHorLine(),
                  Spacer(),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("Seats: ${arguments.selectedSeats.toString().replaceAll('[', '').replaceAll(']', '')}", style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Spacer(),
                  DottedHorLine(),
                  Spacer(),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("Departure From: ${arguments.selectedTicket.departureFrom}", style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Spacer(),
                  DottedHorLine(),
                  Spacer(),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("Departure at: ${arguments.selectedTicket.startOn.day}/${arguments.selectedTicket.startOn.month}/${arguments.selectedTicket.startOn.year}   ${arguments.selectedTicket.startOn.hour}:${arguments.selectedTicket.startOn.minute<10? 0 : ""}${arguments.selectedTicket.startOn.minute}", style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Spacer(),
                  DottedHorLine(),
                  Spacer(),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("Total Price: ${arguments.selectedTicket.price * arguments.selectedSeats.length}", style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            )],),
          SizedBox(height: 50,),
          SizedBox(
            width: 325,
            height: 53,
            child:  ElevatedButton(onPressed: (){
              combineReservedTickets();
              CollectionReference availableTicketCollection =
              FirebaseFirestore.instance.collection("Available_Tickets");
              DocumentReference doc = availableTicketCollection.doc(arguments.selectedTicket.id);
              doc.set(
                  {
                    "price": arguments.selectedTicket.price,
                    "departureFrom": arguments.selectedTicket.departureFrom,
                    "destination": arguments.selectedTicket.destination,
                    "duration": arguments.selectedTicket.duration,
                    "id": arguments.selectedTicket.id,
                    "numberOfAvailable": arguments.selectedTicket.numberOfTicketsAvailable - arguments.selectedSeats.length,
                    "startOn": arguments.selectedTicket.startOn,
                    "endOn": arguments.selectedTicket.endOn,
                    "firstColumnSeats": arguments.selectedTicket.firstColumnSeats,
                    "secondColumnSeats": arguments.selectedTicket.secondColumnSeats,
                    "thirdColumnSeats": arguments.selectedTicket.thirdColumnSeats,
                    "fourthColumnSeats": arguments.selectedTicket.fourthColumnSeats,
                    "reservedSeats": combinedReservedSeats
                  }
              );
              Navigator.pushNamed(context, MainScreen.screenName);
            },
                child: Text("Confirm", style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xff4F718A))
            ),
          )
        ],
      ),
    );
  }

  void combineReservedTickets(){
    combinedReservedSeats = arguments.selectedTicket.reservedSeats;
    combinedReservedSeats.addAll(arguments.selectedSeats);
  }
}
