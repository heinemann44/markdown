import 'package:flutter/material.dart';
import 'package:markdown/markdown/enums/markdown_type.dart';
import 'package:markdown/markdown/types/markdown_base.dart';

class MarkdownNone implements MarkdownBase {
  @override
  String text;

  @override
  MarkdownType type = MarkdownType.NONE;

  @override
  TextStyle copyWith(TextStyle style) => style;
}
