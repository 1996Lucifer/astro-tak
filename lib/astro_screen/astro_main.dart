import 'package:astro_talks/astro_screen/astro_bloc/bloc.dart';
import 'package:astro_talks/astro_screen/astro_bloc/state.dart';
import 'package:astro_talks/astro_screen/data/astro_model.dart';
import 'package:astro_talks/utils/colors.dart';
import 'package:astro_talks/utils/images.dart' as image;
import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'astro_bloc/event.dart';

enum SortBy {
  EXPERIENCE_HIGH_TO_LOW,
  EXPERIENCE_LOW_TO_HIGH,
  PRICE_HIGH_TO_LOW,
  PRICE_LOW_TO_HIGH
}

enum Filters { SKILLS, LANGUAGE_SPOKEN }

class AstroScreen extends StatefulWidget {
  AstroScreen({Key key}) : super(key: key);

  @override
  _AstroScreenState createState() => _AstroScreenState();
}

class _AstroScreenState extends State<AstroScreen>
    with AutomaticKeepAliveClientMixin {
  bool _showSearchBar = false;
  TextEditingController _searchBarController = TextEditingController();
  SortBy _sortBy;
  Filters _filters;
  AstroBloc _astroBloc;
  List<AstrologersList> _searchResult = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  void dispose() async {
    await _astroBloc.stream.drain();
    _astroBloc.close();
    super.dispose();
  }

  _loadData() async {
    _astroBloc = BlocProvider.of<AstroBloc>(context);
    _astroBloc..add(FetchAstrologersEvent());
  }

  Padding _searchBar(List<AstrologersList> list) => Padding(
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
                color: ColorShades.primaryColor,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _searchBarController.clear();
                    _searchResult.clear();
                  });
                },
                icon: Icon(
                  Icons.clear,
                  color: ColorShades.primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorShades.primaryColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
              ),
            ),
            onChanged: (String value) => _onSearchTextChanged(value, list),
          ),
        ),
      );

  _menuItem(
          {String title,
          groupValue,
          value,
          String type,
          List<AstrologersList> list}) =>
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Container(
          width: 250.0,
          child: RadioListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
            groupValue: groupValue,
            value: value,
            onChanged: (dynamic val) => setState(() {
              if (type == 'sort-by') {
                _sortBy = val;
                _sortByList(list);
                Navigator.pop(context);
              } else {
                _filters = val;
              }
            }),
          ),
        ),
      );

  _sortByList(List<AstrologersList> list) {
    list = _searchResult.length == 0 ? list : _searchResult;

    switch (_sortBy) {
      case SortBy.EXPERIENCE_HIGH_TO_LOW:
        list.sort((b, a) => a.experience.compareTo(b.experience));
        break;
      case SortBy.EXPERIENCE_LOW_TO_HIGH:
        list.sort((a, b) => a.experience.compareTo(b.experience));
        break;
      case SortBy.PRICE_HIGH_TO_LOW:
        list.sort((b, a) => a.minimumCallDurationCharges
            .compareTo(b.minimumCallDurationCharges));
        break;
      case SortBy.PRICE_LOW_TO_HIGH:
        list.sort((a, b) => a.minimumCallDurationCharges
            .compareTo(b.minimumCallDurationCharges));
        break;
      default:
    }
    setState(() {});
  }

  _showSortByPopupMenu(List<AstrologersList> list) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        25.0,
        130.0,
        0.0,
        0.0,
      ),
      items: [
        PopupMenuItem<String>(
          child: Text(
            'Sort By',
            style: TextStyle(
              color: ColorShades.primaryColor,
            ),
          ),
          value: '-1',
          enabled: false,
          padding: const EdgeInsets.only(left: 20.0),
        ),
        PopupMenuItem<String>(
          child: const PopupMenuDivider(),
          value: '-2',
          enabled: false,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
        PopupMenuItem<String>(
          child: _menuItem(
              title: 'Experience- high to low',
              value: SortBy.EXPERIENCE_HIGH_TO_LOW,
              groupValue: _sortBy,
              type: 'sort-by',
              list: list),
          value: '1',
        ),
        PopupMenuItem<String>(
          child: _menuItem(
            title: 'Experience- low to high',
            value: SortBy.EXPERIENCE_LOW_TO_HIGH,
            groupValue: _sortBy,
            type: 'sort-by',
            list: list,
          ),
          value: '2',
        ),
        PopupMenuItem<String>(
          child: _menuItem(
            title: 'Price- high to low',
            value: SortBy.PRICE_HIGH_TO_LOW,
            groupValue: _sortBy,
            type: 'sort-by',
            list: list,
          ),
          value: '3',
        ),
        PopupMenuItem<String>(
          child: _menuItem(
            title: 'Price- low to high',
            value: SortBy.PRICE_LOW_TO_HIGH,
            groupValue: _sortBy,
            type: 'sort-by',
            list: list,
          ),
          value: '4',
        ),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      switch (itemSelected) {
        case '1':
          setState(() {
            _sortBy = SortBy.EXPERIENCE_HIGH_TO_LOW;
          });
          break;
        case '2':
          setState(() {
            _sortBy = SortBy.EXPERIENCE_LOW_TO_HIGH;
          });
          break;
        case '3':
          setState(() {
            _sortBy = SortBy.PRICE_HIGH_TO_LOW;
          });
          break;
        case '4':
          setState(() {
            _sortBy = SortBy.PRICE_LOW_TO_HIGH;
          });
          break;
        default:
      }
    });
  }

  _showFiltersPopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        25.0,
        130.0,
        0.0,
        0.0,
      ),
      items: [
        PopupMenuItem<String>(
          child: Text(
            'Filters',
            style: TextStyle(
              color: ColorShades.primaryColor,
            ),
          ),
          value: '-1',
          enabled: false,
          padding: const EdgeInsets.only(left: 20.0),
        ),
        PopupMenuItem<String>(
          child: const PopupMenuDivider(),
          value: '-2',
          enabled: false,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
        PopupMenuItem<String>(
          child: _menuItem(
            title: 'Skills',
            value: Filters.SKILLS,
            groupValue: _filters,
            type: 'filters',
          ),
          value: '1',
        ),
        PopupMenuItem<String>(
          child: _menuItem(
            title: 'Language',
            value: Filters.LANGUAGE_SPOKEN,
            groupValue: _filters,
            type: 'filters',
          ),
          value: '2',
        ),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        setState(() {
          _filters = Filters.SKILLS;
        });
      } else if (itemSelected == "2") {
        setState(() {
          _filters = Filters.LANGUAGE_SPOKEN;
        });
      }
    });
  }

  getListOfString(List skills) {
    List<String> _list = [];
    skills.forEach((e) => _list.add(e.name.toString()));
    return _list;
  }

  getListOfAstrologers(List<AstrologersList> astrologersList) {
    print(_searchResult);
    bool isEmpty =
        _searchBarController.text.isNotEmpty && _searchResult.length == 0;
    if (_searchResult.length != 0) astrologersList = _searchResult;

    return isEmpty
        ? Text(
            'No result found',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
        : ListView.separated(
            cacheExtent: 500,
            itemCount: astrologersList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(thickness: 1.5),
            itemBuilder: (BuildContext context, int index) => ListTile(
                key: ValueKey(astrologersList[index].id),
                leading: Utils.networkImage(
                  url: astrologersList[index].images.medium.imageUrl,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Utils.boldText(
                            text: astrologersList[index].firstName +
                                ' ' +
                                astrologersList[index].lastName),
                        Text(
                          astrologersList[index].experience.round().toString() +
                              ' years',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: ColorShades.grey400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Utils.textWithImage(
                        source: image.Images.expert,
                        text: Utils.commaSeparatedString(
                            getListOfString(astrologersList[index].skills))),
                    SizedBox(height: 10.0),
                    Utils.textWithImage(
                        source: image.Images.language,
                        text: Utils.commaSeparatedString(
                            getListOfString(astrologersList[index].languages))),
                    SizedBox(height: 10.0),
                    Utils.textWithImage(
                        source: image.Images.charges,
                        text:
                            '\u{20B9} ${astrologersList[index].minimumCallDurationCharges.round()} /min',
                        isBold: true),
                    SizedBox(height: 10.0),
                    ElevatedButton.icon(
                      onPressed: () => UrlLauncher.launch('tel:+911234567899'),
                      icon: Icon(Icons.call_outlined),
                      label: Text('Talk on call'),
                      style: ElevatedButton.styleFrom(
                          primary: ColorShades.primaryColor),
                    )
                  ],
                )),
          );
  }

  _onSearchTextChanged(String text, List<AstrologersList> list) async {
    _searchResult.clear();
    text = text.toLowerCase();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _getSkills(List<Skills> list) {
      List<bool> _temp = [];
      getListOfString(list).forEach((String e) {
        e = e.toLowerCase();
        if (e == 'vastu' || e == 'palmistry') {
          _temp.add(e.contains(text));
        }
      });
      return _temp.any((element) => element == true);
    }

    _getLanguage(List<Languages> list) {
      return getListOfString(list)
          .any((String e) => e.toLowerCase().contains(text));
    }

    list.forEach((astrologersData) {
      if (astrologersData.firstName.toLowerCase().contains(text) ||
          astrologersData.lastName.toLowerCase().contains(text) ||
          _getSkills(astrologersData.skills) ||
          _getLanguage(astrologersData.languages)) {
        _searchResult.add(astrologersData);
      }
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<AstroBloc, AstroState>(
      builder: (context, currentState) {
        if (currentState is AstroLoadedState) {
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
                            url: image.Images.search,
                            onTap: () => setState(() {
                              _showSearchBar = !_showSearchBar;
                            }),
                          ),
                          SizedBox(width: 20.0),
                          Utils.assetImage(
                              url: image.Images.filter,
                              onTap: () => _showFiltersPopupMenu()),
                          SizedBox(width: 20.0),
                          Utils.assetImage(
                              url: image.Images.sort,
                              onTap: () => _showSortByPopupMenu(
                                  currentState.astrologersList)),
                          SizedBox(width: 15.0),
                        ],
                      ),
                    ],
                  ),
                  if (_showSearchBar) ...[
                    _searchBar(currentState.astrologersList)
                  ],
                  SizedBox(height: 15.0),
                  Expanded(
                    child: getListOfAstrologers(currentState.astrologersList),
                  )
                ],
              ),
            ),
          );
        } else if (currentState is AstroErrorState) {
          return Text('Error');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
