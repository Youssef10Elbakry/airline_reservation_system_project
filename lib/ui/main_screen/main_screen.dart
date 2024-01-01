import 'package:airline_reservation_system/ui/Auth/dialogs/Dialogs.dart';
import 'package:airline_reservation_system/ui/home_screen.dart';
import 'package:airline_reservation_system/ui/main_screen/tabs/available_tickets/available_tickets.dart';
import 'package:airline_reservation_system/ui/main_screen/tabs/reservations/reservations.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static String screenName = "Main Screen";
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> tabs = [const AvailableTickets(), const Reservations()];
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currIndex],
      bottomNavigationBar: BottomNavigationBar(

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: "Available Tickets"),
          BottomNavigationBarItem(icon: Icon(Icons.document_scanner), label: "Reservations"),
          BottomNavigationBarItem(icon: Icon(Icons.person,), label: "Switch User"),
        ],
        onTap: (index){
          currIndex = index;
          if(index == 2){
            confirmSwitching(context);
            return;
          }
          setState(() {});
        },
        currentIndex: currIndex,
        selectedItemColor: Colors.black,
      ),
      appBar: AppBar(
        title:Text(currIndex == 0 ? "Available Tickets" : "Reservations", style: const TextStyle(fontSize: 27),),
        centerTitle: true,
        backgroundColor: const Color(0xff4F718A),
        toolbarHeight: currIndex == 0 ? 124 : 91,

      ),
    );
  }
}


