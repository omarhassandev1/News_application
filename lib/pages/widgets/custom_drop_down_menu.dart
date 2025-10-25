import 'package:flutter/material.dart';

import '../../common/app_colors.dart';

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
      icon: Icon(Icons.arrow_drop_down, color: AppColors.whiteColor),
      decoration: InputDecoration(
        border: _getBorder(),
        focusedBorder: _getBorder(),
        enabledBorder: _getBorder(),
      ),
      items: items,
      onChanged: onChanged,
      value: value,
    );
  }

  _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.whiteColor),
    );
  }
}
