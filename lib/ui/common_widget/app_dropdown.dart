import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDown extends StatefulWidget {
  final List<String> dropdownValues;
  final Function(String?)? onChanged;
  final bool isExpanded;
  const AppDropDown(
      {super.key,
      required this.dropdownValues,
      required this.onChanged,
      this.isExpanded = false});

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  String? selectedUnit;
  @override
  void initState() {
    super.initState();
    selectedUnit = widget.dropdownValues[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1, color: Colors.grey)),
      child: DropdownButton<String>(
        isExpanded: widget.isExpanded,
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        elevation: 1,
        underline: const SizedBox.shrink(),
        value: selectedUnit,
        onChanged: (value) {
          selectedUnit = value ?? widget.dropdownValues[0];
          setState(() {});
        },
        items:
            widget.dropdownValues.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
