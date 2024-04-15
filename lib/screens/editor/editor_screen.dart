import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/datetime.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/provider/instance_provider.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/utils/datetime_extension.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:lovelacevault/screens/editor/word_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/container/custom_work.dart';
import 'package:lovelacevault/widgets/ui/custom_appbar.dart';
import 'package:provider/provider.dart';

class EditorScreen extends StatefulWidget {
  final String fileName; // Agrega esta variable

  const EditorScreen({Key? key, required this.fileName}) : super(key: key);

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late CalendarDateTime selectedDateTime;
  late DateTime? weekStart;
  late DateTime? weekEnd;
  @override
  void initState() {
    super.initState();
    TimelineCalendar.calendarProvider = createInstance();
    selectedDateTime = TimelineCalendar.calendarProvider.getDateTime();
    getLatestWeek();
  }

  getLatestWeek() {
    setState(() {
      weekStart = selectedDateTime.toDateTime().findFirstDateOfTheWeek();
      weekEnd = selectedDateTime.toDateTime().findLastDateOfTheWeek();
    });
  }

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      appBar: const CustomRoundedAppBar(
        line2: 'Projects',
      ),
      body: Column(
        children: [
          // CALENDARIO PARA LLEVAR EL CONTROL DE LOS TRABAJOS
          Container(
            //margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _timelineCalendar(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CustomWork(fileName: 'Tesis del necronomicon', date: '12/03/12')
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => WordScreen(fileName: 'Nuevo fichero'),
  ),
);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _timelineCalendar() {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
          viewType: ViewType.DAILY,
          toggleViewType: true,
          headerMonthElevation: 10,
          headerMonthShadowColor: actualTheme.colorScheme.onError,
          headerMonthBackColor: Colors.transparent,
          weekStartDate: weekStart,
          weekEndDate: weekEnd),
      dayOptions: DayOptions(
          compactMode: true,
          dayFontSize: 14.0,
          disableFadeEffect: true,
          weekDaySelectedColor: actualTheme.colorScheme.onError,
          differentStyleForToday: true,
          todayBackgroundColor: Colors.black,
          selectedBackgroundColor: const Color(0xff3AC3E2),
          todayTextColor: Colors.white),
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          backgroundColor: actualTheme.colorScheme.primary,
          headerTextSize: 14,
          headerTextColor: actualTheme.colorScheme.onError,
          navigationColor: actualTheme.colorScheme.onError,
          calendarIconColor: actualTheme.colorScheme.onError),
          
      onChangeDateTime: (dateTime) {
        print("Date Change $dateTime");
        selectedDateTime = dateTime;
        getLatestWeek();
      },
      onDateTimeReset: (resetDateTime) {
        print("Date Reset $resetDateTime");
        selectedDateTime = resetDateTime;
        getLatestWeek();
      },
      onMonthChanged: (monthDateTime) {
        print("Month Change $monthDateTime");
        selectedDateTime = monthDateTime;
        getLatestWeek();
      },
      onYearChanged: (yearDateTime) {
        print("Year Change $yearDateTime");
        selectedDateTime = yearDateTime;
        getLatestWeek();
      },
      dateTime: selectedDateTime,
    );
  }
}
