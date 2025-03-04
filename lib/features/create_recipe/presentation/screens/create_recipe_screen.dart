import 'package:flutter/material.dart';
import 'package:recipe_writer/features/create_recipe/presentation/widgets/create_recipe_body.dart';

class CreateRecipeScreen extends StatelessWidget {
  const CreateRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CreateRecipeBody(),
    );
  }
}
