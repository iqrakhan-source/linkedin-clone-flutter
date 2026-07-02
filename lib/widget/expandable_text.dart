import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLength;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLength = 120,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    // If the text is short, show it normally
    if (widget.text.length <= widget.trimLength) {
      return Text(
        widget.text,
        style: const TextStyle(
          fontSize: 14,
          height: 1.4,
        ),
      );
    }

    final String firstHalf =
    widget.text.substring(0, widget.trimLength);

    final String secondHalf =
    widget.text.substring(widget.trimLength);

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          height: 1.4,
        ),
        children: [
          TextSpan(
            text: _expanded
                ? widget.text
                : "$firstHalf...",
          ),
          TextSpan(
            text: _expanded ? " See less" : " See more",
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
          ),
        ],
      ),
    );
  }
}