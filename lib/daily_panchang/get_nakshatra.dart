import 'package:astro_talks/utils/colors.dart';
import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';

class GetNakshatra extends StatelessWidget {
  const GetNakshatra({Key key}) : super(key: key);

  _getTextWithGreyColor(text) => Text(
        text,
        style: TextStyle(color: ColorShades.grey500),
      );

  _getRowSpace() => TableRow(children: [
        SizedBox(height: 7),
        SizedBox(height: 8),
      ]);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.boldText(text: 'Tithi'),
        Table(
          columnWidths: {0: FixedColumnWidth(150.0)},
          border: TableBorder.all(style: BorderStyle.none),
          children: [
            _getRowSpace(),
            TableRow(children: [
              _getTextWithGreyColor('Tithi Number:'),
              _getTextWithGreyColor('12'),
            ]),
            _getRowSpace(),
            TableRow(children: [
              _getTextWithGreyColor('Tithi Name:'),
              _getTextWithGreyColor('Shukla'),
            ]),
            _getRowSpace(),
            TableRow(children: [
              _getTextWithGreyColor('Special:'),
              _getTextWithGreyColor('Jaya'),
            ]),
            _getRowSpace(),
            TableRow(children: [
              _getTextWithGreyColor('Summary:'),
              _getTextWithGreyColor(
                  'Summary Summary Summary Summary Summary Summary Summary Summary Summary Summary'),
            ]),
            _getRowSpace(),
            TableRow(children: [
              _getTextWithGreyColor('Deity:'),
              _getTextWithGreyColor('Cupid'),
            ]),
            _getRowSpace(),
            TableRow(children: [
              _getTextWithGreyColor('End Time:'),
              _getTextWithGreyColor('4hr 42 min 15 sec'),
            ]),
          ],
        ),
      ],
    );
  }
}
