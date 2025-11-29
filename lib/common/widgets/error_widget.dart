
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.error, this.onRefresh,
  });

  final String error;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
          FilledButton.icon(
            onPressed: onRefresh,
            label: Text('Reload',textAlign: TextAlign.center,),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
