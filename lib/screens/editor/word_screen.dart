import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class WordScreen extends StatefulWidget {
  const WordScreen({super.key});

  @override
  State<WordScreen> createState() => _WordScreenState();
}

QuillController _controller = QuillController.basic();
class _WordScreenState extends State<WordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}