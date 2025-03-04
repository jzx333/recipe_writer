class StepEntity {
  int step;
  String text;

  StepEntity({
    required this.step,
    required this.text,
  });

  @override
  String toString() {
    return 'StepEntity{id: $step, step: $text}';
  }
}