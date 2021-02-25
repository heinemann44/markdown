import 'package:markdown/markdown/types/markdown_base.dart';
import 'package:markdown/markdown/types/markdown_bold.dart';
import 'package:markdown/markdown/types/markdown_italic.dart';
import 'package:markdown/markdown/types/markdown_none.dart';

enum MarkdownType {
  NONE,
  BOLD,
  ITALIC,
}

extension MarkdownTypeExtenstion on MarkdownType {
  String get token {
    switch (this) {
      case MarkdownType.NONE:
        return "";
      case MarkdownType.BOLD:
        return "*";
      case MarkdownType.ITALIC:
        return "@";
      default:
        return null;
    }
  }

  MarkdownBase get instanceMarkdown {
    switch (this) {
      case MarkdownType.BOLD:
        return MarkdownBold();
      case MarkdownType.ITALIC:
        return MarkdownItalic();
      case MarkdownType.NONE:
      default:
        return MarkdownNone();
    }
  }
}
