import 'package:flutter/material.dart';
import 'package:markdown/markdown/enums/markdown_type.dart';

class Markdown {
  String text;
  List<MarkdownType> types;

  Markdown({
    this.text = "",
    this.types,
  });

  TextStyle copyWith(TextStyle style) {
    TextStyle newStyle = style;

    types.forEach((type) {
      final instance = type.instanceMarkdown;
      instance.text = this.text;
      newStyle = instance.copyWith(newStyle);
    });

    return newStyle;
  }
}
