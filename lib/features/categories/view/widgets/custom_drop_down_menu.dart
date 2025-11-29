import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
  });

  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final T? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      dropdownColor: AppColors.whiteColor,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      selectedItemBuilder: (context) {
        return items.map((item) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.child is Text ? (item.child as Text).data! : '',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList();
      },
      icon: Icon(Icons.arrow_drop_down, color: AppColors.whiteColor),
      decoration: InputDecoration(
        border: _getBorder(),
        focusedBorder: _getBorder(),
        enabledBorder: _getBorder(),
      ),
    );

  }

  _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.whiteColor),
    );
  }
}
