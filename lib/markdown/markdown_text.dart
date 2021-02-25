import 'package:flutter/material.dart';
import 'package:markdown/markdown/entities/markdown.dart';
import 'package:markdown/markdown/usecases/get_markdown_list_model_uc.dart';

class MarkdownText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const MarkdownText(
    this.text, {
    Key key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: this.style,
        children: this._buildMarkdownText(),
      ),
    );
  }

  List<InlineSpan> _buildMarkdownText() {
    List<Markdown> markdownList =
        GetMarkdownListModelUC()(this.text, this.style);

    return markdownList
        .map(
          (markdown) => TextSpan(
            text: markdown.text,
            style: markdown.copyWith(this.style),
          ),
        )
        .toList();
  }
}
