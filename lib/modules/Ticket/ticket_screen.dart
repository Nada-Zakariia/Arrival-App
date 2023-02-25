import 'package:flutter/material.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/TicketComp.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/components/button.dart';
import 'package:sizer/sizer.dart';

class Ticket extends StatefulWidget {
  final DateTime date;
  final String from;
  final String to;
  final String seat;
  final String trin_number;
  final String trainNUM;
  final String startTime;
  final String price;


  final TicketModel ticket;

  const Ticket({
    Key? key,
    required this.date,
    required this.from,
    required this.to,
    required this.seat,
    required this.trin_number,

    required this.startTime,
    required this.price, required this.trainNUM, required this.ticket,

  }) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}
class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Sizer(
        builder: (context, orientation, deviceType)
    {

      return Scaffold(
          appBar: bar(
            context: context,
            text: 'Current Tickets',
            morelist: false,
          ),
          body: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width:100.w,
                    height: 60.h,
                    child:TicketComponent(
                      view: true,
                      ticket:widget.ticket,
                  )),
                  SizedBox(height: 10.h),
                  button(
                      text: "Navigate Route",
                      onpress: () {},
                      width: 60.w,
                      height: 10.h)
                ],
              )));
    })


    );}
}
