import 'package:flutter/material.dart';
import 'package:recipe_writer/core/themes/themes.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.src,
  });

  final String src;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(theme.defaultBorderRadius),
      ),
      child: Image.network(
        src,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, event) {
          return Center(
            child: CircularProgressIndicator(
              color: theme.primaryColor,
            ),
          );
        },
        errorBuilder: (context, err, st) {
          return Center(
            //child: Icon(Icons.image, size: 80),
            child: Text("$err $st"),
          );
        },
      ),
    );
  }
}
