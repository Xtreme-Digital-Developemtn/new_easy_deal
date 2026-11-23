import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../../main_imports.dart';

/// رقم الإصدار الحقيقي من بيانات البيلد (pubspec: version+build)
/// بدل رقم ثابت مكتوب في الكود كان بيفضل 1.0.0 مهما البيلد اتغيّر.
class AppVersionText extends StatefulWidget {
  const AppVersionText({super.key});

  @override
  State<AppVersionText> createState() => _AppVersionTextState();
}

class _AppVersionTextState extends State<AppVersionText> {
  String? _version;

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      final build = info.buildNumber;
      final version = build.isEmpty
          ? info.version
          : "${info.version}+$build";
      if (mounted) setState(() => _version = version);
    } catch (_) {
      // لو قراءة بيانات البيلد فشلت، نسيب السطر من غير رقم
      // بدل ما نعرض رقم غلط.
      if (mounted) setState(() => _version = "");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_version == null || _version!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LangKeys.appVersion.tr()),
        Gap(6.w),
        Text(
          _version!,
          textDirection: ui.TextDirection.ltr,
          style: AppStyles.primary16SemiBold,
        ),
      ],
    );
  }
}
