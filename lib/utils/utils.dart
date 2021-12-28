import 'package:astro_talks/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Utils {
  static Widget assetImage({
    required String url,
    double? height,
    double? width,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? null,
      child: Image.asset(
        url,
        height: height ?? 20,
        width: width ?? 20,
      ),
    );
  }

  static Widget networkImage({
    required String url,
    double? height,
    double? width,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? null,
      child: CachedNetworkImage(
        imageUrl: url,
        height: height ?? 100,
        width: width ?? 100,
        progressIndicatorBuilder: (context, url, progress) => Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Constants.primaryColor!),
        )),
      ),
    );
  }

  static Text boldText({
    required String text,
    double? size = 14.0,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }

  static Widget textWithImage(
      {required String source,
      required String text,
      double? size = 14.0,
      isBold = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        assetImage(url: source),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: isBold ? Constants.black : Constants.grey400,
              fontSize: 13.0,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }

  static hideKeyboard() {
    return FocusManager.instance.primaryFocus?.unfocus();
  }
}
