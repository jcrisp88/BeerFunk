import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:beer_funk_github/model/flavours.dart';
import 'package:beer_funk_github/ui/common/flavour_summary.dart';

import '../../main.dart';
import 'package:provider/provider.dart';

class Flavours extends ChangeNotifier {
  final FilterModel _filterModel;
  Flavours(this._filterModel);

  final List<Flavour> _flavours = flavours;
  String _searchString = "";

  bool get isFilterEmpty => _filterModel.isFilterEmpty;

  checkIsFiltered(dynamic item) {
    List<String> _flavourTypes = item.flavourTypes;
    List<String> _chemicalTypes = item.chemicalTypes;
    List<String> _process = item.process;

    bool checkFlavour = isPresent(_flavourTypes, _filterModel.flavour);
    bool checkChemical = isPresent(_chemicalTypes, _filterModel.chemical);
    bool checkProcess = isPresent(_process, _filterModel.process);

    return checkFlavour || checkChemical || checkProcess;
  }

  isPresent(List<String> list, List<String> filterList) {
    return list
            .where((item) => filterList.contains(item.toLowerCase()))
            .toList()
            .length >
        0;
  }

  UnmodifiableListView<Flavour> get flavoursList => isFilterEmpty
      ? UnmodifiableListView(_flavours)
      : UnmodifiableListView(
          _flavours.where(
            (item) => checkIsFiltered(item),
          ),
        );

  void changeSearchString(String searchString) {
    _searchString = searchString;

    print(_searchString);
    notifyListeners();
  }
}

class HomePageBody extends StatelessWidget {
  var _isSnackbarActive = false;
  void showInSnackBar(String value, context, filterModel) {
    Scaffold.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(value),
            duration: Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Clear all',
              onPressed: () {
                filterModel.clearAll();
                Scaffold.of(context).removeCurrentSnackBar();
              },
            ),
          ),
        )
        .closed
        .then((SnackBarClosedReason reason) {
      _isSnackbarActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var filterModel = Provider.of<FilterModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!filterModel.isFilterEmpty) {
        // _isSnackbarActive = true;
        print('showInSnackBar');
        Scaffold.of(context).removeCurrentSnackBar();
        showInSnackBar(
            filterModel.filterLength == 1
                ? "You have ${filterModel.filterLength} filter applied."
                : "You have ${filterModel.filterLength} filters applied.",
            context,
            filterModel);
      }
    });
    return ChangeNotifierProvider(
      create: (context) => Flavours(filterModel),
      child: Consumer<Flavours>(builder: (context, flavourData, child) {
        return Expanded(
          child: Container(
            color: Color(0xFFFFFFFF),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          FlavourSummary(flavourData.flavoursList[index]),
                      childCount: flavourData.flavoursList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
