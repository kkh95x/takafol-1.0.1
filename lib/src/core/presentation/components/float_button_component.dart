// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class FloatButtonComponent extends ConsumerWidget {
  const FloatButtonComponent({
    required this.speedDialChildren,
    this.icon = Icons.menu_open,
    super.key,
  });
  final List<SpeedDialChild> speedDialChildren;
  final IconData? icon;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SpeedDial(
      
      closedBackgroundColor: Theme.of(context).colorScheme.tertiary,
      closedForegroundColor: Theme.of(context).colorScheme.onBackground,
      openBackgroundColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
      openForegroundColor: Theme.of(context).colorScheme.onBackground,
      labelsStyle:const TextStyle(
          fontSize: 18.0, color: Colors.black),
      labelsBackgroundColor:  Colors.blue.shade50,
      speedDialChildren: speedDialChildren,
      child: Icon(icon),
    );
  }
}