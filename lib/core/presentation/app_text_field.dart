import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_writer/core/themes/themes.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.inputFormatters,
    this.hintText,
    this.onChanged,
  });

  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(theme.defaultBorderRadius),
      ),
      child: TextField(
        onChanged: onChanged,
        style: theme.textTheme.bodyMedium,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: theme.textTheme.bodyMedium!.color!.withValues(alpha: 0.4),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
