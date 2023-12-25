import 'package:flutter/material.dart';
import 'package:airline_reservation_system/ui/main_screen/tabs/available_tickets/select_seat/small_box_widget.dart';
import 'package:airline_reservation_system/ui/main_screen/tabs/available_tickets/select_seat/big_box_widget.dart';
import 'package:airline_reservation_system/model/AvailableTickets.dart';
class SelectSeatScreen extends StatefulWidget {
  static String screenName = "Select Seat Screen";
  const SelectSeatScreen({super.key});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
late AvailableTicket arguments;
  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as AvailableTicket;
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your Seat", style: const TextStyle(fontSize: 27)),
          backgroundColor: const Color(0xff4F718A),
          centerTitle: true,
          toolbarHeight: 91,

    ),
      body: Column(
        children: [
         Container(
           color: Colors.black,
           height: 70,
             child: Row(
               children: [
                 Spacer(),
                 SmallBox(color: Color(0xff385E7A)),
                 SizedBox(width: 10,),
                 Text("Selected", style: TextStyle(fontSize: 15, color: Colors.white),),
                 SizedBox(width: 10,),
                 SmallBox(color: Color(0xffC3D5E3)),
                 SizedBox(width: 10,),
                 Text("Available", style: TextStyle(fontSize: 15, color: Colors.white),),
                 SizedBox(width: 10,),
                 SmallBox(color: Colors.white),
                 SizedBox(width: 10,),
                 Text("Not Available", style: TextStyle(fontSize: 15, color: Colors.white),),
                 Spacer()
               ],
          )),
          Expanded(child: Container(
            child: Row(
              children: [
                Spacer(),
                Expanded(child: ListView.builder(itemCount: arguments.firstColumnSeats.length, itemBuilder:(context, index) => BigBox(text: arguments.firstColumnSeats[index], backColor: Color(0xffC3D5E3), borderColor: Color(0xffC3D5E3), fontColor: Colors.black))),
                Spacer(),
                Expanded(child: ListView.builder(itemCount: arguments.secondColumnSeats.length, itemBuilder:(context, index) => BigBox(text: arguments.secondColumnSeats[index], backColor: Color(0xffC3D5E3), borderColor: Color(0xffC3D5E3), fontColor: Colors.black))),
                Spacer(flex: 2,),
                Expanded(child: ListView.builder(itemCount: arguments.thirdColumnSeats.length, itemBuilder:(context, index) => BigBox(text: arguments.thirdColumnSeats[index], backColor: Color(0xffC3D5E3), borderColor: Color(0xffC3D5E3), fontColor: Colors.black))),
                Spacer(),
                Expanded(child: ListView.builder(itemCount: arguments.fourthColumnSeats.length, itemBuilder:(context, index) => BigBox(text: arguments.fourthColumnSeats[index], backColor: Color(0xffC3D5E3), borderColor: Color(0xffC3D5E3), fontColor: Colors.black))),
                Spacer()
              ],
            ),
          ))
        ],
      ),
    );
  }
  
}
