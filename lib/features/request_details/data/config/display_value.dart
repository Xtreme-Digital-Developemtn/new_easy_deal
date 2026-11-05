/// تحقق موحد من صلاحية القيم قبل عرضها في تفاصيل الطلب.
///
/// الـAPI بيرجّع نفس الحقل أحياناً `null` وأحياناً `''` أو `' '` أو `'null'`
/// وأحياناً رقم `0` / نص `'0'` بمعنى "مفيش قيمة". الكلاس ده بيوحّد القرار:
/// لو القيمة مش صالحة بيرجّع `null` والـwidget بيختفي بالكامل (العنوان
/// والمسافة والـDivider)، ولو صالحة بيرجّع النص جاهز للعرض بنفس التنسيق.
///
/// الصفر: بشكل افتراضي الصفر مرفوض لأن معظم حقول الطلب اختيارية (المساحة،
/// السعر، عدد الغرف...). الحقول اللي الصفر فيها قيمة حقيقية (عدد الردود مثلاً)
/// بتبعت `zeroIsValid: true`.
class DisplayValue {
  const DisplayValue._();

  /// النصوص اللي بتوصل من الـAPI أو من الـlabel resolvers وبتعني "مفيش قيمة".
  static const Set<String> _blankTexts = {'', '-', '--', 'null', 'NULL', 'nan', 'NaN', 'undefined'};

  /// `true` لو القيمة تستحق العرض.
  static bool isValid(dynamic value, {bool zeroIsValid = false}) =>
      text(value, zeroIsValid: zeroIsValid) != null;

  /// النص الجاهز للعرض، أو `null` لو الحقل لازم يختفي.
  static String? text(dynamic value, {bool zeroIsValid = false}) {
    if (value == null) return null;

    if (value is num) return _numText(value, zeroIsValid: zeroIsValid);

    if (value is bool) return null;

    if (value is Iterable) {
      final items = list(value, zeroIsValid: zeroIsValid);
      return items.isEmpty ? null : items.join(', ');
    }

    final raw = value.toString().trim();
    if (_blankTexts.contains(raw)) return null;

    // نص رقمي جاي من الـAPI زي "0" أو "0.0"
    final parsed = num.tryParse(raw);
    if (parsed != null) return _numText(parsed, zeroIsValid: zeroIsValid);

    return raw;
  }

  /// نفس `text` بس بيضيف وحدة/لاحقة (متر، جنيه...) لو القيمة صالحة بس.
  static String? withSuffix(
    dynamic value,
    String suffix, {
    bool zeroIsValid = false,
  }) {
    final base = text(value, zeroIsValid: zeroIsValid);
    if (base == null) return null;
    final unit = suffix.trim();
    return unit.isEmpty ? base : '$base $unit';
  }

  /// بيرجّع أول قيمة صالحة من مجموعة بدائل (الـAPI بيستخدم أكتر من مفتاح
  /// لنفس الحقل أحياناً)، أو `null` لو كلها فاضية.
  static String? firstValid(List<dynamic> values, {bool zeroIsValid = false}) {
    for (final value in values) {
      final resolved = text(value, zeroIsValid: zeroIsValid);
      if (resolved != null) return resolved;
    }
    return null;
  }

  /// بيرجّع أول عنصر خام صالح (مفيد قبل تمريره لـlabel resolver).
  static dynamic firstValidRaw(List<dynamic> values, {bool zeroIsValid = false}) {
    for (final value in values) {
      if (isValid(value, zeroIsValid: zeroIsValid)) return value;
    }
    return null;
  }

  /// بيفلتر ليستة جاية من الـAPI من العناصر الفاضية/الصفرية ويرجّع نصوص نضيفة.
  static List<String> list(dynamic value, {bool zeroIsValid = false}) {
    if (value is! Iterable) {
      final single = text(value, zeroIsValid: zeroIsValid);
      return single == null ? const [] : [single];
    }
    final result = <String>[];
    for (final item in value) {
      final resolved = text(item, zeroIsValid: zeroIsValid);
      if (resolved != null) result.add(resolved);
    }
    return result;
  }

  /// بيطبّق resolver (ترجمة/label) ويتحقق من الناتج كمان، لأن الـresolvers
  /// بترجّع نص فاضي للقيم غير المعروفة.
  static String? mapped(
    dynamic value,
    String Function(dynamic raw) resolver, {
    bool zeroIsValid = false,
  }) {
    if (!isValid(value, zeroIsValid: zeroIsValid)) return null;
    return text(resolver(value));
  }

  static String? _numText(num value, {required bool zeroIsValid}) {
    if (value is double && (value.isNaN || value.isInfinite)) return null;
    if (!zeroIsValid && value == 0) return null;
    if (value is int) return value.toString();
    if (value == value.roundToDouble()) return value.toInt().toString();
    return value.toString();
  }
}
