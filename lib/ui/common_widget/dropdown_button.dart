import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final String label;
  final List<String> dropdownItems;

  const DropDown(
      {super.key,
      required this.label,
      required this.dropdownItems,
      isIcon = true});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  bool _isExpanded = false;
  String? _selectedItem;
  bool isIcon = true;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpanded,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: double.infinity,
            height: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.blue),
            ),
            child: _selectedItem != null
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                        ],
                      ),
                    ],
                  )
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                        ],
                      ),
                    ],
                  ),
          ),
        ),
        SizedBox(
          height:
              _isExpanded ? (widget.dropdownItems.length * 50).toDouble() : 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height:
                _isExpanded ? (widget.dropdownItems.length * 50).toDouble() : 0,
            width: 306,
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: _isExpanded ? Colors.green : Colors.white)),
            ),
            child: _isExpanded
                ? Column(
                    children: widget.dropdownItems
                        .map((item) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedItem = item;
                                  _isExpanded = false;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: widget.dropdownItems
                                                      .indexOf(item) ==
                                                  widget.dropdownItems.length -
                                                      1
                                              ? Colors.transparent
                                              : Colors.green),
                                      left:
                                          const BorderSide(color: Colors.green),
                                      right: const BorderSide(
                                          color: Colors.green)),
                                ),
                                child: Center(
                                  child: Text(item,
                                      style:
                                          const TextStyle(color: Colors.grey)),
                                ),
                              ),
                            ))
                        .toList(),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}
