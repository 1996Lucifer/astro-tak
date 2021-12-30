import 'package:astro_talks/daily_panchang/get_panchang_data.dart';
import 'package:astro_talks/daily_panchang/location_bloc/bloc.dart';
import 'package:astro_talks/daily_panchang/location_bloc/event.dart';
import 'package:astro_talks/daily_panchang/location_bloc/state.dart';
import 'package:astro_talks/daily_panchang/panchang_bloc/bloc.dart';
import 'package:astro_talks/daily_panchang/panchang_bloc/event.dart';
import 'package:astro_talks/daily_panchang/panchang_bloc/state.dart';
import 'package:astro_talks/shared_widget/error_page.dart';
import 'package:astro_talks/utils/colors.dart';
import 'package:astro_talks/utils/images.dart';
import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'data/location_model.dart';

class DailyPanchang extends StatefulWidget {
  DailyPanchang({Key key}) : super(key: key);

  @override
  _DailyPanchangState createState() => _DailyPanchangState();
}

class _DailyPanchangState extends State<DailyPanchang>
    with AutomaticKeepAliveClientMixin {
  TextEditingController _dateController =
      TextEditingController(text: Utils.getOrdinalDate(DateTime.now()));
  TextEditingController _locationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _placeId = '';

  @override
  void initState() {
    // _loadData();
    super.initState();
  }

  @override
  void dispose() async {
    await context.read<PanchangBloc>().close();
    await context.read<LocationBloc>().close();
    super.dispose();
  }

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
                  suffixIcon: Icon(
                    Icons.calendar_today_outlined,
                    color: ColorShades.grey,
                  ),
                  contentPadding: EdgeInsets.only(top: 15, left: 10),
                  border: InputBorder.none,
                ),
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  final DateTime _picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(1990, 1, 1),
                    lastDate: DateTime(2025, 1, 1),
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: ColorShades.primaryColor,
                          accentColor: ColorShades.primaryColor,
                          colorScheme: ColorScheme.light(
                              primary: ColorShades.primaryColor),
                          buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child,
                      );
                    },
                  );
                  if (_picked != null && _picked != _selectedDate) {
                    setState(() {
                      _selectedDate = _picked;
                      _dateController = TextEditingController(
                          text: Utils.getOrdinalDate(_selectedDate));
                    });
                  }
                  if (_placeId.isNotEmpty) {
                    context.read<PanchangBloc>()
                      ..add(FetchPanchangEvent(
                        date: _selectedDate.day,
                        month: _selectedDate.month,
                        year: _selectedDate.year,
                        placeId: _placeId,
                      ));
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
          BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              return Expanded(
                child: TypeAheadField<LocationsList>(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Input Location',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _placeId = '';
                            _locationController.text = '';
                          });
                        },
                        icon: Icon(
                          Icons.clear,
                          color: ColorShades.grey,
                        ),
                      ),
                    ),
                    controller: _locationController,
                  ),
                  suggestionsCallback: (String pattern) async {
                    if (_locationController.text.isEmpty) {
                      return [];
                    }
                    if (_locationController.text.isNotEmpty) {
                      context.read<LocationBloc>()
                        ..add(FetchLocationEvent(
                            inputPlace: _locationController.text));
                    }
                    if (state is LocationLoadedState) {
                      return state.locationsList;
                    }
                    return [];
                  },
                  itemBuilder: (context, LocationsList suggestion) {
                    return ListTile(
                      title: Text(suggestion.placeName),
                    );
                  },
                  onSuggestionSelected: (LocationsList suggestion) {
                    setState(() {
                      _locationController.text = suggestion.placeName;
                      _placeId = suggestion.placeId;
                    });
                    context.read<PanchangBloc>()
                      ..add(FetchPanchangEvent(
                        date: _selectedDate.day,
                        month: _selectedDate.month,
                        year: _selectedDate.year,
                        placeId: _placeId,
                      ));
                  },
                ),
              );
            },
          ),
        ],
      );

  _getCycleData({String type, String time, String icon}) => Row(
        children: [
          SizedBox(width: 10),
          Utils.assetImage(url: icon),
          SizedBox(width: 10),
          Column(
            children: [
              Text(
                type.toString(),
                style: TextStyle(
                  color: ColorShades.blue,
                  fontSize: 12,
                ),
              ),
              Text(
                time.toString(),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                  color: ColorShades.grey,
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
            BlocBuilder<PanchangBloc, PanchangState>(
              builder: (context, state) {
                if (state is PanchangLoadedState) {
                  List<Map<String, dynamic>> tithiData = [
                    {
                      'name': 'Tithi Number',
                      'value':
                          state.panchangDetail.tithi.tithiDetails.tithiNumber
                    },
                    {
                      'name': 'Tithi Name:',
                      'value':
                          state.panchangDetail.tithi.tithiDetails.tithiName,
                    },
                    {
                      'name': 'Special:',
                      'value': state.panchangDetail.tithi.tithiDetails.special,
                    },
                    {
                      'name': 'Summary:',
                      'value': state.panchangDetail.tithi.tithiDetails.summary,
                    },
                    {
                      'name': 'Deity:',
                      'value': state.panchangDetail.tithi.tithiDetails.deity,
                    },
                    {
                      'name': 'End Time:',
                      'value':
                          Utils.getTime(state.panchangDetail.tithi.endTimeMs),
                    },
                  ];

                  List<Map<String, dynamic>> nakshatraData = [
                    {
                      'name': 'Nakshatra Number',
                      'value': state
                          .panchangDetail.nakshatra.nakshatraDetails.nakNumber
                    },
                    {
                      'name': 'Nakshatra Name:',
                      'value': state
                          .panchangDetail.nakshatra.nakshatraDetails.nakName,
                    },
                    {
                      'name': 'Ruler:',
                      'value':
                          state.panchangDetail.nakshatra.nakshatraDetails.ruler,
                    },
                    {
                      'name': 'Deity:',
                      'value':
                          state.panchangDetail.nakshatra.nakshatraDetails.deity,
                    },
                    {
                      'name': 'Summary:',
                      'value': state
                          .panchangDetail.nakshatra.nakshatraDetails.summary,
                    },
                    {
                      'name': 'End Time:',
                      'value': Utils.getTime(
                          state.panchangDetail.nakshatra.endTimeMs),
                    },
                  ];

                  List<Map<String, dynamic>> yogData = [
                    {
                      'name': 'Yog Number',
                      'value': state.panchangDetail.yog.yogDetails.yogNumber
                    },
                    {
                      'name': 'Yog Name:',
                      'value': state.panchangDetail.yog.yogDetails.yogName,
                    },
                    {
                      'name': 'Special:',
                      'value': state.panchangDetail.yog.yogDetails.special,
                    },
                    {
                      'name': 'Meaning:',
                      'value': state.panchangDetail.yog.yogDetails.meaning,
                    },
                    {
                      'name': 'End Time:',
                      'value':
                          Utils.getTime(state.panchangDetail.yog.endTimeMs),
                    },
                  ];

                  List<Map<String, dynamic>> karanData = [
                    {
                      'name': 'Karan Number',
                      'value':
                          state.panchangDetail.karan.karanDetails.karanNumber
                    },
                    {
                      'name': 'Karan Name:',
                      'value':
                          state.panchangDetail.karan.karanDetails.karanName,
                    },
                    {
                      'name': 'Special:',
                      'value': state.panchangDetail.karan.karanDetails.special,
                    },
                    {
                      'name': 'Deity:',
                      'value': state.panchangDetail.karan.karanDetails.deity,
                    },
                    {
                      'name': 'End Time:',
                      'value':
                          Utils.getTime(state.panchangDetail.karan.endTimeMs),
                    },
                  ];
                  return Expanded(
                    child: Column(
                      children: [
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
                                  _getCycleData(
                                    type: 'Sunrise',
                                    time: state.panchangDetail.sunrise,
                                    icon: Images.rise,
                                  ),
                                  VerticalDivider(thickness: 1.5),
                                  _getCycleData(
                                    type: 'Sunset',
                                    time: state.panchangDetail.sunset,
                                    icon: Images.set,
                                  ),
                                  VerticalDivider(thickness: 1.5),
                                  _getCycleData(
                                    type: 'Moonrise',
                                    time: state.panchangDetail.moonrise,
                                    icon: Images.rise,
                                  ),
                                  VerticalDivider(thickness: 1.5),
                                  _getCycleData(
                                    type: 'Moonset',
                                    time: state.panchangDetail.moonset,
                                    icon: Images.set,
                                  ),
                                  VerticalDivider(thickness: 1.5),
                                  _getCycleData(
                                    type: 'Vedic Sunrise',
                                    time: state.panchangDetail.vedicSunrise,
                                    icon: Images.rise,
                                  ),
                                  VerticalDivider(thickness: 1.5),
                                  _getCycleData(
                                    type: 'Vedic Sunset',
                                    time: state.panchangDetail.vedicSunset,
                                    icon: Images.set,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Expanded(
                          child: ListView(
                            children: [
                              GetPanchangData(title: 'Tithi', data: tithiData),
                              SizedBox(height: 15),
                              GetPanchangData(
                                  title: 'Nakshatra', data: nakshatraData),
                              SizedBox(height: 15),
                              GetPanchangData(title: 'Yog', data: yogData),
                              SizedBox(height: 15),
                              GetPanchangData(title: 'Karan', data: karanData),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is PanchangErrorState) {
                  return Container(
                      child: Center(
                    child: ErrorView(),
                    heightFactor: 2.0,
                  ));
                } else if (state is PanchangInitialState) {
                  return SizedBox.shrink();
                }
                return Container(
                  child: Center(
                    child: Utils.circularProgressIndicator(),
                    heightFactor: 2.7,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
