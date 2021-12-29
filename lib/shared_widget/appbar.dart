import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';
import './../utils/images.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Utils.assetImage(
        url: Images.logo,
        height: 60.0,
        width: 60.0,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Utils.assetImage(
        url: Images.hamburger,
        height: 20.0,
        width: 20.0,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Utils.assetImage(
            url: Images.profile,
            height: 30.0,
            width: 30.0,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
