import 'dart:ui';

import 'package:flutter/material.dart';


class BaffleText extends StatefulWidget {

  const BaffleText({super.key, required this.text});

  final String text;

  @override
  State<BaffleText> createState() => _BaffleTextState();
}

class _BaffleTextState extends State<BaffleText> with SingleTickerProviderStateMixin {

  String _text = '';


  @override
  void initState() {
    super.initState();
    baffleText(widget.text);
  }


  @override
  void didUpdateWidget(covariant BaffleText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _text = '';
      baffleText(widget.text);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: const TextStyle(
        fontSize: 150,
        fontWeight: FontWeight.bold,
      ),
    );
  }


  void baffleText(String text) async {

    final runes = '$text>╲/>╳╡¿‽░▒▓⸎'.runes.toList();

    for (var i = 0; i < text.length * 2; i++) {

      runes.shuffle();

      await Future.delayed(const Duration(milliseconds: 70));

      _text = String.fromCharCodes(runes.toList().getRange(0, text.length));

      updateState();
    }

    _text = widget.text;

    updateState();

  }


  void updateState() {
    if (mounted) {
      setState(() { });
    }
  }

}
