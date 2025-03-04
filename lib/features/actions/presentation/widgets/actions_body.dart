import 'package:flutter/material.dart';
import 'package:recipe_writer/core/presentation/app_button.dart';
import 'package:recipe_writer/core/themes/themes.dart';
import 'package:recipe_writer/features/create_recipe/presentation/screens/create_recipe_screen.dart';
import 'package:recipe_writer/features/create_tag/presentation/screens/create_tag_screen.dart';

class ActionsBody extends StatelessWidget {
  const ActionsBody({super.key});

  void _navigateToCreateRecipe(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CreateRecipeScreen();
        },
      ),
    );
  }

  void _navigateToCreateTag(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CreateTagScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: SizedBox(
          width: theme.columnWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                "Выберите, что хотите создать",
                style: theme.textTheme.displayLarge,
              ),
              AppButton(
                onTap: () {
                  _navigateToCreateTag(context);
                },
                text: 'Создать тег',
              ),
              AppButton(
                onTap: () {
                  _navigateToCreateRecipe(context);
                },
                text: 'Создать рецепт',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
