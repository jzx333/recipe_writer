import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_writer/core/domain/entities/ingredient_entity.dart';
import 'package:recipe_writer/core/domain/entities/step_entity.dart';
import 'package:recipe_writer/core/domain/entities/tag_entity.dart';
import 'package:recipe_writer/core/presentation/app_button.dart';
import 'package:recipe_writer/core/presentation/app_text_field.dart';
import 'package:recipe_writer/core/themes/themes.dart';
import 'package:recipe_writer/features/create_recipe/presentation/widgets/image_container.dart';
import 'package:recipe_writer/features/create_recipe/presentation/widgets/ingredients_list.dart';
import 'package:recipe_writer/features/create_recipe/presentation/widgets/steps_list.dart';
import 'package:recipe_writer/features/create_recipe/presentation/widgets/tag_list.dart';

class CreateRecipeBody extends StatefulWidget {
  const CreateRecipeBody({super.key});

  @override
  State<CreateRecipeBody> createState() => _CreateRecipeBodyState();
}

class _CreateRecipeBodyState extends State<CreateRecipeBody> {
  final _nameController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _timeController = TextEditingController();
  final _budgetController = TextEditingController();
  String imgSrc = "";

  final _ingredients = [
    IngredientEntity(name: "", quantity: ""),
  ];

  final _steps = [
    StepEntity(step: 1, text: ""),
  ];

  void _addIngredient() {
    setState(() {
      _ingredients.add(IngredientEntity(name: "", quantity: ""));
    });
  }

  void _addStep() {
    setState(() {
      _steps.add(StepEntity(step: _steps.last.step + 1, text: ""));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18),
        child: SizedBox(
          width: theme.columnWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Создайте рецепт",
                  style: theme.textTheme.displayLarge,
                ),
                SizedBox(height: 16),
                Text("Название", style: theme.textTheme.bodySmall),
                SizedBox(height: 6),
                AppTextField(
                  controller: _nameController,
                  inputFormatters: [LengthLimitingTextInputFormatter(30)],
                  hintText: "Паштет",
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Каллории", style: theme.textTheme.bodySmall),
                          SizedBox(height: 6),
                          AppTextField(
                            controller: _caloriesController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            hintText: "150",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Время приготовления (м)",
                              style: theme.textTheme.bodySmall),
                          SizedBox(height: 6),
                          AppTextField(
                            controller: _timeController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            hintText: "30",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text("Бюджет (руб.)", style: theme.textTheme.bodySmall),
                SizedBox(height: 6),
                AppTextField(
                  controller: _budgetController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  hintText: "400",
                ),
                SizedBox(height: 16),
                Text("Список тегов", style: theme.textTheme.bodyLarge),
                SizedBox(height: 4),
                TagList(tags: [
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                  TagEntity(id: 0, name: "name", emoji: "a"),
                ]),
                SizedBox(height: 16),
                Text("Ингредиенты", style: theme.textTheme.bodyLarge),
                SizedBox(height: 4),
                IngredientsList(
                  onIngredientAdd: _addIngredient,
                  ingredients: _ingredients,
                ),
                SizedBox(height: 16),
                Text("Ингредиенты", style: theme.textTheme.bodyLarge),
                SizedBox(height: 4),
                StepsList(steps: _steps, onStepAdd: _addStep),
                SizedBox(height: 16),
                Text("Загрузите картинку", style: theme.textTheme.bodyLarge),
                SizedBox(height: 4),
                AppTextField(
                  onChanged: (value) {
                    setState(() {
                      imgSrc = value;
                      print(imgSrc);
                    });
                  },
                  hintText: "Вставьте ссылку",
                ),
                SizedBox(height: 8),
                ImageContainer(src: imgSrc),
                SizedBox(height: 16),
                AppButton(onTap: () {}, text: "Создать рецепт")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
