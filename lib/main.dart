import 'package:changnotifier_audiop/home_page.dart';
import 'package:changnotifier_audiop/modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (context) => modal(),
      child: home_page(),
    ),
  ));
}
