import 'package:astro_talks/daily_panchang/get_nakshatra.dart';
import 'package:astro_talks/daily_panchang/get_tithi.dart';
import 'package:astro_talks/utils/colors.dart';
import 'package:astro_talks/utils/images.dart';
import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:jiffy/jiffy.dart';

class DailyPanchang extends StatefulWidget {
  DailyPanchang({Key key}) : super(key: key);

  @override
  _DailyPanchangState createState() => _DailyPanchangState();
}

class _DailyPanchangState extends State<DailyPanchang> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _dateWidget() => Row(
        children: [
          SizedBox(
            width: 40,
          ),
          Text(
            'Date:',
            style: TextStyle(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 15.0),
              child: TextFormField(
                readOnly: true,
                controller: _dateController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Select Date',
                  suffixIcon: Icon(Icons.calendar_today_outlined),
                  contentPadding: EdgeInsets.only(top: 15, left: 10),
                  border: InputBorder.none,
                ),
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  final DateTime _picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );
                  if (_picked != null && _picked != _selectedDate) {
                    setState(() {
                      _selectedDate = _picked;
                      DateTime date = DateTime.parse(_selectedDate.toString());
                      String formattedDate =
                          Jiffy(date).format("do MMMM, yyyy");
                      _dateController =
                          TextEditingController(text: formattedDate);
                    });
                  }
                },
              ),
            ),
          ),
        ],
      );

  _locationWidget() => Row(
        children: [
          SizedBox(
            width: 19,
          ),
          Text('Location: '),
          Expanded(
            child: TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Select Location',
                border: InputBorder.none,
              ),
            ),
          )
          // TypeAheadField(
          //   textFieldConfiguration: TextFieldConfiguration(
          //     autofocus: true,
          //     style: DefaultTextStyle.of(context)
          //         .style
          //         .copyWith(fontStyle: FontStyle.italic),
          //     decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //         hintText: 'What is on your mind?'),
          //   ),
          //   suggestionsCallback: (pattern) async {
          //     return [];
          //     // return await BackendService.getSuggestions(pattern);
          //   },
          //   itemBuilder: (context, Map<String, String> suggestion) {
          //     return ListTile(
          //       title: Text(suggestion['name']!),
          //       subtitle: Text('${suggestion['score']}'),
          //     );
          //   },
          //   onSuggestionSelected: (Map<String, String> suggestion) {
          //     // your implementation here
          //   },
          // ),
        ],
      );

  getCycleData() => Row(
        children: [
          SizedBox(width: 10),
          Utils.assetImage(url: Images.rise),
          SizedBox(width: 10),
          Column(
            children: [
              Text(
                'Sunrise',
                style: TextStyle(
                  color: ColorShades.blue,
                  fontSize: 12,
                ),
              ),
              Text(
                '05:26 PM',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      );

  // _getTextWithGreyColor(text) => Text(
  //       text,
  //       style: TextStyle(color: ColorShades.grey500),
  //     );

  // _getRowSpace() => TableRow(children: [
  //       SizedBox(height: 7),
  //       SizedBox(height: 8),
  //     ]);

  // _getTithiDetails() => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Utils.boldText(text: 'Tithi'),
  //         Table(
  //           columnWidths: {0: FixedColumnWidth(150.0)},
  //           border: TableBorder.all(style: BorderStyle.none),
  //           children: [
  //             _getRowSpace(),
  //             TableRow(children: [
  //               _getTextWithGreyColor('Tithi Number:'),
  //               _getTextWithGreyColor('12'),
  //             ]),
  //             _getRowSpace(),
  //             TableRow(children: [
  //               _getTextWithGreyColor('Tithi Name:'),
  //               _getTextWithGreyColor('Shukla'),
  //             ]),
  //             _getRowSpace(),
  //             TableRow(children: [
  //               _getTextWithGreyColor('Special:'),
  //               _getTextWithGreyColor('Jaya'),
  //             ]),
  //             _getRowSpace(),
  //             TableRow(children: [
  //               _getTextWithGreyColor('Summary:'),
  //               _getTextWithGreyColor(
  //                   'Summary Summary Summary Summary Summary Summary Summary Summary Summary Summary'),
  //             ]),
  //             _getRowSpace(),
  //             TableRow(children: [
  //               _getTextWithGreyColor('Deity:'),
  //               _getTextWithGreyColor('Cupid'),
  //             ]),
  //             _getRowSpace(),
  //             TableRow(children: [
  //               _getTextWithGreyColor('End Time:'),
  //               _getTextWithGreyColor('4hr 42 min 15 sec'),
  //             ]),
  //           ],
  //         ),
  //       ],
  //     );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.boldText(text: 'Daily Panchang'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'India is a country known for its festival but knowing the exact dates can sometimes be difficult. To ensure you do not miss out on the critical dates we bring you the daily panchang',
                style: TextStyle(
                  fontSize: 13,
                  color: ColorShades.grey400,
                ),
              ),
            ),
            Card(
              color: ColorShades.lightAmber,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 15.0,
                  right: 15.0,
                ),
                child: Column(
                  children: [
                    _dateWidget(),
                    _locationWidget(),
                  ],
                ),
              ),
            ),
            Material(
              elevation: 5,
              color: ColorShades.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 30.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      getCycleData(),
                      VerticalDivider(thickness: 1.5),
                      getCycleData(),
                      VerticalDivider(thickness: 1.5),
                      getCycleData(),
                      VerticalDivider(thickness: 1.5),
                      getCycleData(),
                      VerticalDivider(thickness: 1.5),
                      getCycleData(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  GetTithi(),
                  SizedBox(height: 30),
                  GetNakshatra(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
