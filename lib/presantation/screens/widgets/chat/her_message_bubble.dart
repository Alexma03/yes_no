import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo Amor',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(),

        const SizedBox(height: 10),

        //todo: image
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/no/1-c7d128c95c1740ec76e120146c870f0b.gif',
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              width: size.width * 0.7,
              height: 150,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ));
  }
}
