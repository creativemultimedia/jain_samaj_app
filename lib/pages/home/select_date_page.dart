import 'package:flutter/material.dart';
import 'package:jain_samaj_app/api_model/yatra_location_details.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/home/add_membera.dart';
import 'package:table_calendar/table_calendar.dart';

class select_date extends StatefulWidget {
  List<Response>? list;


  select_date(this.list);

  @override
  State<select_date> createState() => _select_dateState();
}

class _select_dateState extends State<select_date> {
  DateTime selectedDate=DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1700, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
          title: Text(
        "Select Date",
        style: appbartext,
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40),
              child: Text(widget.list![0].yatraLocationScreenTitle!,
                  style: TextStyle(fontSize: 13, fontFamily: 'semibold')),
            ),
            Container(
             child:  TableCalendar(
                 availableCalendarFormats: const {
                   CalendarFormat.month: '',
                   CalendarFormat.week: '',
                 },
                 headerStyle: HeaderStyle(
                   formatButtonVisible: false,
                   titleCentered: true
                 ),
               calendarStyle: CalendarStyle(
                 tablePadding: EdgeInsets.all(15),
                 tableBorder: TableBorder(
                     horizontalInside: BorderSide(
                     color: Colors.black,
                   )
                 )
               ),
               // daysOfWeekVisible: false,
                 focusedDay: DateTime.now(), firstDay: DateTime(1900), lastDay: DateTime(2050)),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: 150,
              child: ListView.separated(itemBuilder: (context, index) {
                return
                  Row(

                  children: [

                    Image(
                      image: AssetImage("image/calander_mark.png"),
                      width: 17,
                      height: 17,
                      color: Color(int.parse(widget.list![0].yatraLocationScreenInfo![index].color!)),
                    ),
                    SizedBox(width: 12),
                    Text( widget.list![0].yatraLocationScreenInfo![index].text!,style: TextStyle(fontFamily: 'semibold',fontSize: 12))
                  ],
                );
              }, separatorBuilder: (context, index) {
                return Divider(color: Colors.white,);
              }, itemCount: widget.list![0].yatraLocationScreenInfo!.length),
            ),

            Container(
              margin: EdgeInsets.only(top: 40),
              width:MediaQuery.of(context).size.width/2.7,
              height: MediaQuery.of(context).size.height/18.5,
              child: ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: color.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return add_members();
                    },));

                  }, child: Text("Next",style: loginbutton,)),
            ),
          ],
        ),
      ),
    );
  }
}
