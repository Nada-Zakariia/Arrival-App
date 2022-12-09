
import 'package:flutter/material.dart';
import 'package:graduation_project_app/component/appBar.dart';
import 'package:graduation_project_app/component/button.dart';
import 'package:graduation_project_app/component/ticketComponent.dart';

class Ticket extends StatefulWidget {
  final DateTime date;
  final String from;
  final String to;
  final String seat;
  final String gate;
  final String duration;


  const Ticket({Key? key,  
    required this.date,
    required this.from,
    required this.to,
    required this.seat,
    required this.gate,
    required this.duration,

  }) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    final Size size  =MediaQuery.of(context).size;

    return  Scaffold(
      appBar: const Bar(text: "",moreList: true),
      body: Column(
        children: [
          Container(
            height: 450,
            child: TicketComp(
                date: widget.date,
                from: widget.from,
                to: widget.to,
                duration: widget.duration,
                gate: widget.gate,
                seat: widget.seat,
              size: size
            ),
          ),
          SizedBox(height: 30),
          button(text: "Navigate Route", onpress: (){}, width: 250, height: 50)
        ],
      ),

    );
  }
}




