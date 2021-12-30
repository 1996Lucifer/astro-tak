import 'package:astro_talks/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static Widget assetImage({
    @required String url,
    double height = 20,
    double width = 20,
    Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        url,
        height: height,
        width: width,
      ),
    );
  }

  static Widget networkImage({
    @required String url,
    double height = 100,
    double width = 100,
    Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: width,
        height: 100,
        progressIndicatorBuilder: (context, url, progress) =>
            circularProgressIndicator(),
      ),
    );
  }

  static Text boldText({
    @required String text,
    double size = 14.0,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }

  static Widget getTextWithGreyColor(text) => Text(
        text.toString(),
        style: TextStyle(color: ColorShades.grey),
      );

  static Widget textWithImage({
    @required String source,
    @required String text,
    double size = 14.0,
    isBold = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        assetImage(url: source),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: isBold ? ColorShades.black : ColorShades.grey,
              fontSize: 13.0,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }

  static hideKeyboard() {
    return FocusManager.instance.primaryFocus.unfocus();
  }

  static String commaSeparatedString(List data) => data.join(', ');

  static String getOrdinalDate(DateTime date) {
    var suffix = "th";
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("d'$suffix' MMMM, yyyy").format(date);
  }

  static String getTime(int epoch) {
    var date = DateTime.fromMillisecondsSinceEpoch(epoch);
    return '${date.hour.toString()} hr ${date.minute.toString()} min ${date.second.toString()} sec';
  }

  static Widget circularProgressIndicator() => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ColorShades.primaryColor),
      ));
}
