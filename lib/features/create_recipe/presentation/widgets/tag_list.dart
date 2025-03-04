import 'package:flutter/material.dart';
import 'package:recipe_writer/core/domain/entities/tag_entity.dart';
import 'package:recipe_writer/core/themes/themes.dart';

class TagList extends StatelessWidget {
  const TagList({
    super.key,
    required this.tags,
  });

  final List<TagEntity> tags;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 180,
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(theme.defaultBorderRadius),
        color: theme.colorScheme.primaryContainer,
      ),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final tag = tags[index];
          return _TagTile(
            isSelected: index == 0,
            tag: tag,
            onTap: () {},
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}

class _TagTile extends StatelessWidget {
  const _TagTile({
    required this.isSelected,
    required this.tag,
    required this.onTap,
  });

  final bool isSelected;
  final TagEntity tag;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Ink(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color:
                    isSelected ? theme.primaryColor : theme.colorScheme.outline,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  tag.emoji,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            tag.name,
            style: theme.textTheme.displaySmall,
          ),
        )
      ],
    );
  }
}
