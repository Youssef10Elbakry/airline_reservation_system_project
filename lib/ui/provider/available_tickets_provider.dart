import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../model/AvailableTickets.dart';

class ATProvider extends ChangeNotifier{
  List<AvailableTicket> availableTickets = [];
  Map availableTicketJson = {};
  DateTime selectedDate = DateTime.now();

  void loadAvailableTickets() async{
    availableTickets = [];
  CollectionReference todosCollection = FirebaseFirestore.instance.collection("Available_Tickets");
  QuerySnapshot availableTicketsSnapShot = await todosCollection.get();
  List<QueryDocumentSnapshot> availableTicketsDocs = availableTicketsSnapShot.docs;
  for(int i = 0; i<availableTicketsDocs.length; i++){
    print("in loop");
    availableTicketJson = availableTicketsDocs[i].data() as Map;
    availableTickets.add(AvailableTicket.fromJson(availableTicketJson));
    availableTickets = availableTickets.where((ticket){
      if((ticket.startOn.day == selectedDate.day) &&
      (ticket.startOn.month == selectedDate.month)&&
      (ticket.startOn.year == selectedDate.year)){
        return true;
      }
      else {
        return false;
      }
    }).toList();

    notifyListeners();

  }
}
}