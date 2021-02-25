import 'package:flutter/material.dart';
import 'package:markdown/markdown/enums/markdown_type.dart';
import 'package:markdown/markdown/types/markdown_base.dart';

class MarkdownBold implements MarkdownBase {
  @override
  String text;

  @override
  MarkdownType type = MarkdownType.BOLD;

  @override
  TextStyle copyWith(TextStyle style) {
    return style.copyWith(
      fontWeight: FontWeight.bold,
    );
  }
}

