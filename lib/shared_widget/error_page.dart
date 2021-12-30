import 'package:astro_talks/utils/colors.dart';
import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 100,
            color: ColorShades.primaryColor,
          ),
          SizedBox(height: 30,),
          Utils.boldText(
            text: 'Error getting data',
            size: 40,
          ),
        ],
      ),
    );
  }
}
