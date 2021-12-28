import 'package:astro_talks/shared_widget/custom_scaffold.dart';
import 'package:astro_talks/utils/constants.dart';
import 'package:astro_talks/utils/images.dart';
import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';

class AstroScreen extends StatefulWidget {
  AstroScreen({Key? key}) : super(key: key);

  @override
  _AstroScreenState createState() => _AstroScreenState();
}

class _AstroScreenState extends State<AstroScreen> {
  bool _showSearchBar = false;
  TextEditingController? _searchBarController = TextEditingController();

  Padding _searchBar() => Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 2,
          child: TextFormField(
            autofocus: true,
            controller: _searchBarController,
            decoration: InputDecoration(
              hintText: 'Search Astrologer',
              prefixIcon: Icon(
                Icons.search,
                color: Constants.primaryColor,
              ),
              suffixIcon: IconButton(
                onPressed: _searchBarController?.clear,
                icon: Icon(
                  Icons.clear,
                  color: Constants.primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Constants.primaryColor!, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[200]!, width: 1.0),
              ),
            ),
          ),
        ),
      );

  getListOfAstrologers() {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: Utils.networkImage(
                url:
                    'https://tak-astrotak-av.s3.ap-south-1.amazonaws.com/astro-images/agents/740X502-Sunita-jha.jpg'),
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Utils.boldText(text: 'User Name'),
                    Text(
                      '25 years',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Constants.grey400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Utils.textWithImage(source: Images.expert, text: 'Astrologer, Astrologer, Astrologer, Astrologer, Astrologer, Astrologer, Astrologer, Astrologer '),
                SizedBox(height: 10.0),
                Utils.textWithImage(source: Images.language, text: 'English, Hindi'),
                SizedBox(height: 10.0),
                Utils.textWithImage(source: Images.charges, text: '\u{20B9} 100 /min', isBold: true),
                SizedBox(height: 10.0),
                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.call_outlined), label: Text('Talk on call'))
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Utils.boldText(text: 'Talk to an Astrologer'),
                Row(
                  children: [
                    Utils.assetImage(
                      url: Images.search,
                      onTap: () => setState(() {
                        _showSearchBar = !_showSearchBar;
                      }),
                    ),
                    SizedBox(width: 20.0),
                    Utils.assetImage(url: Images.filter),
                    SizedBox(width: 20.0),
                    Utils.assetImage(url: Images.sort),
                    SizedBox(width: 15.0),
                  ],
                ),
              ],
            ),
            if (_showSearchBar) ...[_searchBar()],
            SizedBox(height: 15.0),
            Expanded(child: getListOfAstrologers())
          ],
        ),
      ),
    );
  }
}
