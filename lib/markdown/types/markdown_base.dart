import 'package:flutter/material.dart';
import 'package:markdown/markdown/enums/markdown_type.dart';

abstract class MarkdownBase {
  String text;
  MarkdownType type;

  MarkdownBase({this.text = ""});

  TextStyle copyWith(TextStyle style);
}
