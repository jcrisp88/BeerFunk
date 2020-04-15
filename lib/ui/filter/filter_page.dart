import 'package:flutter/material.dart';
import 'package:beer_funk_github/ui/text_style.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import "package:beer_funk_github/ui/common/string_extension.dart";

List<String> flavourList = [
  "bacterial",
  "chemical",
  "off-flavour",
  "malt-derived",
  "taint",
  "hop-derived",
  "oxidation",
  "positive character",
  "yeast-derived",
  "microbiological spoilage",
];
List<String> chemicalList = [
  "acid",
  "alcohols",
  "aldehydes",
  "carbonyls",
  "esters",
  "haloanisoles & halophenols",
  "sulphur compounds",
  "phenolics",
  "pyrazines & pyridines",
  "inorganics",
  "others",
];
List<String> processList = [
  "brewhouse",
  "fermentation / maturation",
  "ingredients",
  "package",
  "processing",
];

class FilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _filterModel = Provider.of<FilterModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              _filterModel.clearAll();
            },
            child: Text("Clear All"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              'Flavour Type',
              style: Style.headerTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            child: MultiSelectChip(
              flavourList,
              _filterModel.flavour,
              onSelectionChanged: (selectedList) {
                _filterModel.flavour = selectedList;
              },
            ),
          ),
          Text(
            'Chemical Type',
            style: Style.headerTextStyle,
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            child: MultiSelectChip(
              chemicalList,
              _filterModel.chemical,
              onSelectionChanged: (selectedList) {
                _filterModel.chemical = selectedList;
              },
            ),
          ),
          Text(
            'Process',
            style: Style.headerTextStyle,
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            child: MultiSelectChip(
              processList,
              _filterModel.process,
              onSelectionChanged: (selectedList) {
                _filterModel.process = selectedList;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.00),
            child: RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ),
        ]),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final List<String> selectedChoices;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, this.selectedChoices,
      {this.onSelectionChanged});
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.fromLTRB(0, 0.0, 4.0, 0),
        child: ChoiceChip(
          selected: widget.selectedChoices.contains(item),
          label: Text(item.capitalize(),
              style: widget.selectedChoices.contains(item)
                  ? TextStyle(fontSize: 13.65, fontWeight: FontWeight.bold)
                  : null),
          onSelected: (selected) {
            setState(() {
              widget.selectedChoices.contains(item)
                  ? widget.selectedChoices.remove(item)
                  : widget.selectedChoices.add(item);
              widget.onSelectionChanged(widget.selectedChoices);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
