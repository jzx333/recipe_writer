import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipe_writer/core/presentation/app_button.dart';
import 'package:recipe_writer/core/presentation/app_text_field.dart';
import 'package:recipe_writer/core/themes/themes.dart';
import 'package:recipe_writer/features/create_tag/presentation/notifier/create_tag_notifier.dart';

class CreateTagBody extends StatefulWidget {
  const CreateTagBody({super.key});

  @override
  State<CreateTagBody> createState() => _CreateTagBodyState();
}

class _CreateTagBodyState extends State<CreateTagBody> {
  final _nameController = TextEditingController();
  final _emojiController = TextEditingController();

  void _createTag(BuildContext context) {
    final createTagNotifier = context.read<CreateTagNotifier>();
    final name = _nameController.text.trim();
    final emoji = _emojiController.text.trim();
    createTagNotifier.createTag(name, emoji);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18),
        child: SizedBox(
          width: theme.columnWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Создайте тэг",
                style: theme.textTheme.displayLarge,
              ),
              SizedBox(height: 16),
              Text("Название", style: theme.textTheme.bodySmall),
              SizedBox(height: 6),
              AppTextField(
                controller: _nameController,
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                hintText: "Куриное",
              ),
              SizedBox(height: 16),
              Text("Эмодзи", style: theme.textTheme.bodySmall),
              SizedBox(height: 6),
              AppTextField(
                controller: _emojiController,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
              ),
              SizedBox(height: 16),
              AppButton(
                onTap: () {
                  _createTag(context);
                },
                text: "Создать тэг",
              )
            ],
          ),
        ),
      ),
    );
  }
}
