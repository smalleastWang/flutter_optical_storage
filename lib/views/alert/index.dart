import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('告警'),
    );
  }
}