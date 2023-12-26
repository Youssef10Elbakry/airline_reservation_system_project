import 'package:flutter/material.dart';
import 'package:airline_reservation_system/model/AvailableTickets.dart';
import 'package:airline_reservation_system/ui/main_screen/tabs/available_tickets/select_seat/select_seat_screen.dart';
class BigBox extends StatefulWidget {
  String text;
  AvailableTicket ticket;
  BigBox({super.key, required this.text, required this.ticket});

  @override
  State<BigBox> createState() => _BigBoxState();
}

class _BigBoxState extends State<BigBox> {
  Color borderColor = Color(0xffC3D5E3);
  Color backColor = Color(0xffC3D5E3);
  Color fontColor = Colors.black;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    if(widget.ticket.reservedSeats.contains(widget.text)){
      fontColor = Colors.grey;
      backColor = Colors.white;
      borderColor = Colors.grey;
    }
    return InkWell(
      onTap: (){
        print("Before: ${SelectSeatScreen.selectedSeats}");
        if(widget.ticket.reservedSeats.contains(widget.ticket)) return;
        isSelected = !isSelected;
        if(isSelected){
          SelectSeatScreen.selectedSeats.add(widget.text);
          borderColor = Color(0xff385E7A);
          backColor = Color(0xff385E7A);
          fontColor = Colors.white;
        }
        else{
          SelectSeatScreen.selectedSeats.remove(widget.text);
          borderColor = Color(0xffC3D5E3);
          backColor = Color(0xffC3D5E3);
          fontColor = Colors.black;
        }
        print("After: ${SelectSeatScreen.selectedSeats}");

        setState(() {});
      },
      child: Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: borderColor
              )
          ),
          width: 50,
          height: 50,
          child: Center(child: Text(widget.text, style: TextStyle(fontSize: 20, color: fontColor),),)
      ),
    );
  }

}
