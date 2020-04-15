import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beer_funk_github/ui/home/home_page.dart';

class FilterModel with ChangeNotifier {
  List<String> _flavour = List();
  get flavour => _flavour;
  set flavour(List<String> newValue) {
    _flavour = newValue;
    notifyListeners();
  }

  List<String> _chemical = List();
  get chemical => _chemical;
  set chemical(List<String> newValue) {
    _chemical = newValue;
    notifyListeners();
  }

  List<String> _process = List();
  get process => _process;
  set process(List<String> newValue) {
    _process = newValue;
    notifyListeners();
  }

  addFlavour(String flavour) {
    _flavour.add(flavour);
    notifyListeners();
  }

  addChemical(String chemical) {
    _chemical.add(chemical);
    notifyListeners();
  }

  addProcess(String process) {
    _process.add(process);
    notifyListeners();
  }

  get filterLength => _flavour.length + _chemical.length + _process.length;

  get isFilterEmpty =>
      _flavour.isEmpty && _chemical.isEmpty && _process.isEmpty;

  clearAll() {
    _flavour.clear();
    _chemical.clear();
    _process.clear();
    notifyListeners();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FilterModel>(
      create: (context) => FilterModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "Beer off flavors",
        home: HomePage(),
      ),
    );
  }
}
