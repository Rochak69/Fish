import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDown<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final Function(T?)? onChanged;
  final bool isExpanded;
  const AppDropDown(
      {super.key,
      required this.onChanged,
      this.isExpanded = false,
      required this.items,
      this.value});

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  String? selectedUnit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1, color: Colors.grey)),
      child: DropdownButton<T>(
        isExpanded: widget.isExpanded,
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        elevation: 1,
        underline: const SizedBox.shrink(),
        hint: const Text('Select'),
        value: widget.value,
        onChanged: widget.onChanged,
        items: widget.items,
      ),
    );
  }
}
