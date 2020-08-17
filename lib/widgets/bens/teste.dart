import 'package:flutter/material.dart';

class Attribute {
  int value;
  String name;

  Attribute({@required this.value, @required this.name});
}

class MultiDropDown61061194 extends StatefulWidget {
  final List<List<Attribute>> lists;

  MultiDropDown61061194({this.lists});

  @override
  _MultiDropDown61061194State createState() => _MultiDropDown61061194State();
}

class _MultiDropDown61061194State extends State<MultiDropDown61061194> {
  List<int> dropdownValues = [];

  @override
  void initState() {
    dropdownValues = List.generate(widget.lists.length, (value) => 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(widget.lists.length, (index) {
              return Container(
                child: DropdownButton(
                  isExpanded: true,
                  onChanged: (value) => onDropDownChange(index, value),
                  value: dropdownValues[index],
                  items: widget.lists[index].map((list) {
                    return DropdownMenuItem(
                      child: Text('${list.name}'),
                      value: list.value,
                    );
                  }).toList(),
                ),
              );
            })),
      ),
    );
  }

  void onDropDownChange(dropDownIndex, value) {
    setState(() {
      dropdownValues[dropDownIndex] = value;
    });
    print('onDropDownChange: $dropDownIndex -> $value');
  }
}
