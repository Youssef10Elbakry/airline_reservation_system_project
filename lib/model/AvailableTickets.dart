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
  late List<dynamic> firstColumnSeats;
  late List<dynamic> secondColumnSeats;
  late List<dynamic> thirdColumnSeats;
  late List<dynamic> fourthColumnSeats;
  late List<dynamic> reservedSeats;


  AvailableTicket({required this.price, required this.departureFrom, required this.destination, required this.id, required this.duration, required this.endOn, required this.numberOfTicketsAvailable, required this.startOn, required this.firstColumnSeats, required this.secondColumnSeats, required this.thirdColumnSeats, required this.fourthColumnSeats, required this.reservedSeats});
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
    firstColumnSeats = availableTicketJson["firstColumnSeats"];
    secondColumnSeats = availableTicketJson["secondColumnSeats"];
    thirdColumnSeats = availableTicketJson["thirdColumnSeats"];
    fourthColumnSeats = availableTicketJson["fourthColumnSeats"];
    reservedSeats = availableTicketJson["reservedSeats"];
  }
}