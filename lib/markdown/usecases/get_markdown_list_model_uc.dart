import 'package:flutter/material.dart';
import 'package:markdown/markdown/entities/markdown.dart';
import 'package:markdown/markdown/enums/markdown_type.dart';

class GetMarkdownListModelUC {
  List<Markdown> call(String text, TextStyle defaultStyle) {
    List<Markdown> markdownList = List();

    StringBuffer lastText = StringBuffer("");
    List<MarkdownType> typesInText = [MarkdownType.NONE];
    for (int index = 0; index < text.length; index++) {
      String char = text[index];

      if (this._isAToken(char)) {
        MarkdownType type = this._instanceType(char);
        if (type != typesInText.last) {
          // Adiciona o último texto capturado até agora na lista de markdown
          this._addMarkdown(lastText?.toString(), typesInText, markdownList);

          // Limpo o texto
          lastText = StringBuffer("");
          // Salvo o novo tipo de markdown
          typesInText.add(type);
        } else {
          // Adiciona o último texto capturado até agora na lista de markdown
          this._addMarkdown(lastText?.toString(), typesInText, markdownList);
          // Limpo o texto
          lastText = StringBuffer("");
          // Volto o tipo para o último encontrado
          typesInText.removeLast();
        }
      } else {
        // Salvo o texto
        lastText?.write(StringBuffer(char));
      }
    }
    // Salvo o último texto na lista
    this._addMarkdown(lastText?.toString(), typesInText, markdownList);

    return markdownList;
  }

  bool _isAToken(String char) {
    return MarkdownType.values.firstWhere(
          (type) => type.token == char,
          orElse: () => null,
        ) !=
        null;
  }

  MarkdownType _instanceType(String token) {
    return MarkdownType.values.firstWhere((type) => type.token == token);
  }

  void _addMarkdown(
      String text, List<MarkdownType> types, List<Markdown> list) {
    if (text?.isEmpty ?? true) {
      return;
    }

    List<MarkdownType> copyList = List();
    copyList.addAll(types);

    final Markdown markdown = Markdown(text: text, types: copyList);
    list.add(markdown);
  }
}
