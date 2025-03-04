import 'dart:developer';

import 'package:flutter/material.dart';

class CreateTagNotifier extends ChangeNotifier {
  void createTag(String name, String emoji) {
    log("Creating tag: $name $emoji", name: runtimeType.toString());
  }
}