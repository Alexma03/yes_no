import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

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
      hintText: 'Manda un mensaje',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      fillColor: Colors.transparent,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.send,
      keyboardAppearance: Brightness.dark,
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecorationTheme,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
