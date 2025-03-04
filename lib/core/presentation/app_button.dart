import 'package:flutter/material.dart';
import 'package:recipe_writer/core/themes/themes.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(theme.defaultBorderRadius),
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme.defaultBorderRadius),
            color: theme.colorScheme.primaryContainer,
          ),
          child: Center(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
