import 'package:cloud_firestore/cloud_firestore.dart';

class AvailableTicket{
  late int price;
  late String departureFrom;
  late String destination;
  late String id;
  late String duration;
  late int numberOfTicketsAvailable;
  late DateTime startOn;
  late DateTime endOn;

  AvailableTicket({required this.price, required this.departureFrom, required this.destination, required this.id, required this.duration, required this.endOn, required this.numberOfTicketsAvailable, required this.startOn});
  AvailableTicket.fromJson(Map availableTicketJson){
    price = availableTicketJson["price"];
    departureFrom = availableTicketJson["departureFrom"];
    destination = availableTicketJson["destination"];
    id = availableTicketJson["id"];
    duration = availableTicketJson["duration"];
    numberOfTicketsAvailable = availableTicketJson["numberOfAvailable"];
    Timestamp dateStart = availableTicketJson["startOn"];
    startOn = dateStart.toDate();
    Timestamp dateEnd = availableTicketJson["endOn"];
    endOn = dateEnd.toDate();
  }
}