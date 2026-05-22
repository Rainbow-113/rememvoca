import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class boxContainer extends StatelessWidget {
  final Widget child;
  const boxContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
    throw UnimplementedError();
  }
}
