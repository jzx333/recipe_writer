import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_writer/core/domain/entities/ingredient_entity.dart';
import 'package:recipe_writer/core/presentation/app_button.dart';
import 'package:recipe_writer/core/presentation/app_text_field.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    super.key,
    required this.ingredients,
    required this.onIngredientAdd,
  });

  final List<IngredientEntity> ingredients;
  final VoidCallback onIngredientAdd;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ingredients.length + 1,
      itemBuilder: (context, index) {
        final lastIndex = ingredients.length; // + 1 - 1
        if (index != lastIndex) {
          return _IngredientEditTile(initIngredient: ingredients[index]);
        }
        return AppButton(
          onTap: onIngredientAdd,
          text: "Добавить ингредиент",
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
    );
  }
}

class _IngredientEditTile extends StatefulWidget {
  const _IngredientEditTile({
    required this.initIngredient,
  });

  final IngredientEntity initIngredient;

  @override
  State<_IngredientEditTile> createState() => _IngredientEditTileState();
}

class _IngredientEditTileState extends State<_IngredientEditTile> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.initIngredient.name;
    _quantityController.text = widget.initIngredient.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: AppTextField(
            controller: _nameController,
            hintText: "Название",
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            onChanged: (value) {
              widget.initIngredient.name = value.trim();
            },
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: AppTextField(
            controller: _quantityController,
            hintText: "200 г",
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
            ],
            onChanged: (value) {
              widget.initIngredient.quantity = value.trim();
            },
          ),
        )
      ],
    );
  }
}
