import 'package:flutter/material.dart';
import 'package:recipe_writer/features/actions/presentation/widgets/actions_body.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ActionsBody(),
    );
  }
}
