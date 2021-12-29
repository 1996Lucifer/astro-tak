import 'package:astro_talks/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
    double height = 200,
    double width = 100,
    Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: url,
        height: height,
        width: width,
        progressIndicatorBuilder: (context, url, progress) => Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorShades.primaryColor),
        )),
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
              color: isBold ? ColorShades.black : ColorShades.grey400,
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
}
