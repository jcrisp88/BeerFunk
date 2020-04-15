import 'dart:math';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:beer_funk_github/model/flavours.dart';
import 'package:beer_funk_github/ui/common/flavour_summary.dart';
import 'package:beer_funk_github/ui/common/separator.dart';
import 'package:beer_funk_github/ui/text_style.dart';
import 'package:provider/provider.dart';
import '../../main.dart';

class DetailPage extends StatelessWidget {
  final Flavour flavour;

  DetailPage(this.flavour);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFFF5F8FF),
        child: new Stack(
          children: <Widget>[
            // _getBackground(),
            // _getGradient(),
            _getOverviewContent(context),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  // Container _getBackground() {
  //   return new Container(
  //     // color: new Color(0x00736AB7),
  //     child: new Container(
  //       color: new Color(0xFF736AB7),
  //       height: 300.0,
  //     ),
  //     constraints: new BoxConstraints.expand(height: 295.0),
  //   );
  // }

  // Container _getGradient() {
  //   return new Container(
  //     margin: new EdgeInsets.only(top: 190.0),
  //     height: 110.0,
  //     decoration: new BoxDecoration(
  //       gradient: new LinearGradient(
  //         colors: <Color>[new Color(0x00FFFFFF), new Color(0xFFFFFFFF)],
  //         stops: [0.0, 0.9],
  //         begin: const FractionalOffset(0.0, 0.0),
  //         end: const FractionalOffset(0.0, 1.0),
  //       ),
  //     ),
  //   );
  // }

  Widget _listValues({List list}) {
    final _random = Random(list.length);
    rangeRandomizer(int min, int max) =>
        min + _random.nextInt(max - min).toDouble();
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 5,
          runSpacing: 5,
          children: <Widget>[
            for (var item in list)
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                child: Text(
                  '${item[0].toUpperCase()}${item.substring(1)}',
                  style: TextStyle(
                      color: const Color(0xFF383838),
                      fontSize: rangeRandomizer(10, 18),
                      fontWeight: FontWeight.w400),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _listLinkValues({List list, String type, BuildContext context}) {
    var _filterModel = Provider.of<FilterModel>(context);
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 5,
          runSpacing: 5,
          children: <Widget>[
            for (var item in list)
              GestureDetector(
                onTap: () {
                  _filterModel.clearAll();
                  switch (type) {
                    case 'flavour':
                      _filterModel.addFlavour(item);
                      break;
                    case 'chemical':
                      _filterModel.addChemical(item);
                      break;
                    default:
                      _filterModel.addProcess(item);
                      break;
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                  padding: const EdgeInsets.fromLTRB(6.5, 6.0, 6.5, 6.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF1FF),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Text(
                    '${item[0].toUpperCase()}${item.substring(1)}',
                    style: TextStyle(
                        color: const Color(0xFF7978EE),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Container _getOverviewContent(BuildContext context) {
    final _overviewTitle = "Overview".toUpperCase();
    final _relatedFlavours = "Related Flavours".toUpperCase();
    final _flavourTypes = "Flavour Types".toUpperCase();
    final _chemicalTypes = "Chemical Types".toUpperCase();
    final _process = "Processes".toUpperCase();
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          FlavourSummary(
            flavour,
            horizontal: false,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0.0, 6.0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _overviewTitle,
                        style: Style.headerTextStyle,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Separator(color: 0xFFDE5566),
                      ),
                      Text(flavour.information, style: Style.commonTextStyle),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0.0, 6.0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _relatedFlavours,
                        style: Style.headerTextStyle,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Separator(color: 0xFFF5D42A),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: _listValues(list: flavour.relatedFlavours),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0.0, 6.0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _flavourTypes,
                        style: Style.headerTextStyle,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Separator(color: 0xFF4032B6),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: _listLinkValues(
                              list: flavour.flavourTypes,
                              type: 'flavour',
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0.0, 6.0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _chemicalTypes,
                        style: Style.headerTextStyle,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Separator(color: 0xFF4032B6),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: _listLinkValues(
                                list: flavour.chemicalTypes,
                                type: 'chemical',
                                context: context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0.0, 6.0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _process,
                        style: Style.headerTextStyle,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Separator(color: 0xFF4032B6),
                      ),
                      Text('Processes that usually cause this off-flavour.',
                          style: Style.commonTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: _listLinkValues(
                                list: flavour.process, context: context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BackButton(color: Colors.black),
          Row(
            children: <Widget>[
              // FlatButton(
              //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //   onPressed: () => _showDialog(context),
              //   child: Text('Take Quiz'),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
