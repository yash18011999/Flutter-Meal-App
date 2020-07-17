import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> curFilters;

  FilterScreen(this.curFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.curFilters['gluten'];
    _lactoseFree = widget.curFilters['lactose'];
    _vegan = widget.curFilters['vegan'];
    _vegetarian = widget.curFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchTile(
      String title, String subTitle, var cur_value, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: cur_value,
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(_selectedFilter);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchTile(
                      'Vegetarian',
                      'Only includes vegetarian meals',
                      _vegetarian, (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  }),
                  buildSwitchTile('Vegan', 'Only includes vegan meals', _vegan,
                      (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  }),
                  buildSwitchTile(
                      'Lactose-free',
                      'Only includes lactose-free meals',
                      _lactoseFree, (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  }),
                  buildSwitchTile(
                      'Gluten-free',
                      'Only includes gluten-free meals',
                      _glutenFree, (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
