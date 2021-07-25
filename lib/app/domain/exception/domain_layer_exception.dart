import 'package:flutter/material.dart';

class DomainLayerException implements Exception {
  String cause;
  DomainLayerException({@required this.cause});

  @override
  String toString() {
    return cause;
  }
}
