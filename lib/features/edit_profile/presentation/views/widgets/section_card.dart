import 'package:flutter/material.dart';

// 1. Container Custom Widget
class SectionCard extends StatelessWidget {
  final List<Widget> children;

  const SectionCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade100, width: 1.5),
      ),
      child: Column(
        children: List.generate(children.length, (index) {
          final isLast = index == children.length - 1;
          return Column(
            children: [
              children[index],
              if (!isLast)
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.blue.shade50,
                ),
            ],
          );
        }),
      ),
    );
  }
}

// 2. Item Custom Widget
class AccountListItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String? valueText;
  final Widget? trailing;
  final List<String>? tags;
  final VoidCallback? onAddPressed;

  const AccountListItem({
    super.key,
    required this.title,
    this.onTap,
    this.valueText,
    this.trailing,
    this.tags,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                _buildTrailing(),
              ],
            ),
            if (tags != null && tags!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tags!
                    .map(
                      (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5F4FB),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Color(0xFF2C3E50),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildTrailing() {
    if (trailing != null) return trailing!;

    if (onAddPressed != null) {
      return OutlinedButton.icon(
        onPressed: onAddPressed,
        icon: const Icon(Icons.add, size: 16),
        label: const Text('Add'),
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF2E3A89),
          side: const BorderSide(color: Color(0xFF2E3A89)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          visualDensity: VisualDensity.compact,
        ),
      );
    }

    if (valueText != null) {
      return Text(
        valueText!,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    return const Icon(Icons.arrow_forward_rounded, color: Colors.black87);
  }
}