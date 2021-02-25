import 'package:flutter/material.dart';
import 'package:markdown/markdown/enums/markdown_type.dart';
import 'package:markdown/markdown/types/markdown_base.dart';

class MarkdownItalic implements MarkdownBase {
  @override
  String text;

  @override
  MarkdownType type = MarkdownType.ITALIC;

  @override
  TextStyle copyWith(TextStyle style) {
    return style.copyWith(
      fontStyle: FontStyle.italic,
    );
  }
}
