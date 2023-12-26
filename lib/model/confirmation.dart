import 'package:airline_reservation_system/model/AvailableTickets.dart';

class Confirmation {
  AvailableTicket selectedTicket;
  List<dynamic> selectedSeats;

  Confirmation({required this.selectedTicket, required this.selectedSeats});
}