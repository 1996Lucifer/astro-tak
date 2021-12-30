import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';

class GetPanchangData extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> data;
  const GetPanchangData({
    Key key,
    @required this.title,
    @required this.data,
  }) : super(key: key);

  _getRowSpace() => TableRow(children: [
        SizedBox(height: 7),
        SizedBox(height: 8),
      ]);

  _listOfRow() {
    List<TableRow> _temp = [];
    data.forEach((element) {
      _temp.add(_getRowSpace());
      _temp.add(TableRow(children: [
        Utils.getTextWithGreyColor(element['name']),
        Utils.getTextWithGreyColor(element['value']),
      ]));
      _temp.add(_getRowSpace());
    });
    return _temp;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.boldText(text: title),
        Table(
          columnWidths: {0: FixedColumnWidth(150.0)},
          border: TableBorder.all(style: BorderStyle.none),
          children: _listOfRow(),
        ),
      ],
    );
  }
}
