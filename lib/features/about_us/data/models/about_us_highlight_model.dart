import 'package:flutter/widgets.dart';

/// A single highlight card shown in the mission / vision sections.
class AboutUsHighlightModel {
  const AboutUsHighlightModel({
    required this.titleKey,
    required this.descriptionKey,
    this.icon,
  });

  final String titleKey;
  final String descriptionKey;
  final IconData? icon;
}
