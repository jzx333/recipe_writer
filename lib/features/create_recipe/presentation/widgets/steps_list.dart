import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_writer/core/domain/entities/step_entity.dart';
import 'package:recipe_writer/core/presentation/app_button.dart';
import 'package:recipe_writer/core/presentation/app_text_field.dart';

class StepsList extends StatelessWidget {
  const StepsList({
    super.key,
    required this.steps,
    required this.onStepAdd,
  });

  final List<StepEntity> steps;
  final VoidCallback onStepAdd;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: steps.length + 1,
      itemBuilder: (context, index) {
        final lastIndex = steps.length; // + 1 - 1
        if (index != lastIndex) {
          return _StepEditTile(initStep: steps[index]);
        }
        return AppButton(
          onTap: onStepAdd,
          text: "Добавить шаг",
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 12);
      },
    );
  }
}

class _StepEditTile extends StatefulWidget {
  const _StepEditTile({
    super.key,
    required this.initStep,
  });

  final StepEntity initStep;

  @override
  State<_StepEditTile> createState() => _StepEditTileState();
}

class _StepEditTileState extends State<_StepEditTile> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = widget.initStep.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Шаг ${widget.initStep.step}", style: theme.textTheme.bodySmall),
        SizedBox(height: 4),
        AppTextField(
          controller: _textController,
          hintText: "Опишите действие",
          inputFormatters: [
            LengthLimitingTextInputFormatter(200),
          ],
          onChanged: (value) {
            widget.initStep.text = value.trim();
          },
        ),
      ],
    );
  }
}
