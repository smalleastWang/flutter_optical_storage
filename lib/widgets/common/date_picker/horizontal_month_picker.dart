
import 'package:flutter/material.dart';

class HorizontalMonthPicker extends StatefulWidget {
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? selectedTime;
  final Function onChange;
  const HorizontalMonthPicker({Key? key, this.startTime, this.endTime, this.selectedTime, required this.onChange}) : super(key: key);
  @override
  State<HorizontalMonthPicker> createState() => _HorizontalMonthPickerState();
}
 
class _HorizontalMonthPickerState extends State<HorizontalMonthPicker> {
  late DateTime selectedTime;
  late DateTime startTime;
  late DateTime endTime;
  late int selectedYear;
  late int selectedMonth;
  late int selectedDay = 01;
  @override
  void initState() {
    super.initState();
    DateTime date = widget.selectedTime ?? DateTime.now();
    selectedTime = rebuildTime2Month(date);
    startTime = rebuildTime2Month(widget.startTime ?? DateTime(1900));
    endTime = rebuildTime2Month(widget.endTime ?? DateTime(2099));
    selectedYear = date.year;
    selectedMonth = date.month;
    selectedDay = date.day;
  }
 
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.grey.withOpacity(selectedTime.isAfter(startTime) ? 1: .4),
              ),
              onTap: () {
                if (parseTime(selectedYear, selectedMonth, selectedDay)
                    .isAfter(startTime)) {
                  minusTime();
                  widget.onChange(selectedTime);
                }
              },
            ),
            Container(
              width: 70,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("${selectedTime.year}-${selectedTime.month}", style: const TextStyle(fontSize: 16))
            ),
            InkWell(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey.withOpacity(selectedTime.isBefore(endTime) ? 1: .4)
              ),
              onTap: () {
                if (parseTime(selectedYear, selectedMonth, selectedDay).isBefore(endTime)) {
                  plusTime();
                  widget.onChange(selectedTime);
               }
              },
            ),
          ],
        ),
      ),
    );
  }
 
  DateTime parseTime(int year, int month, int day) {
    if (month < 10) {
      return DateTime.parse("$year-0$month-01");
    } else {
      return DateTime.parse("$year-$month-01");
    }
  }
 
  void minusTime() {
    selectedMonth--;
    if (selectedMonth == 0) {
      selectedYear--;
      selectedMonth = 12;
    }
    selectedTime = parseTime(selectedYear, selectedMonth, selectedDay);
    setState(() {});
  }
 
  void plusTime() {
    selectedMonth++;
    if (selectedMonth == 13) {
      selectedYear++;
      selectedMonth = 1;
    }
    selectedTime = parseTime(selectedYear, selectedMonth, selectedDay);
    setState(() {});
  }
   
  //抹除掉日期带来的影响，否则可能切换到范围之外
  DateTime rebuildTime2Month(DateTime dateTime) {
    int month = dateTime.month;
    String monthS = '';
    if (month < 10) {
      monthS = "0$month";
    } else {
      monthS = "$month";
    }
    return DateTime.parse("${dateTime.year}-$monthS-01");
  }
}