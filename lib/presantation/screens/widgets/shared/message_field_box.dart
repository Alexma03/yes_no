import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );

    final inputDecorationTheme = InputDecoration(
      hintText: 'Manda un mensaje acabado con ?',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      fillColor: Theme.of(context).colorScheme.surfaceVariant,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          textController.clear();
          onValue(textController.value.text);
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Add bottom spacing
      child: TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.send,
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecorationTheme,
        onFieldSubmitted: (value) {
          textController.clear();
          focusNode.requestFocus();
          onValue(value);
        },
      ),
    );
  }
}
