import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('يرفض القيم الفاضية بكل أشكالها', () {
    expect(DisplayValue.text(null), isNull);
    expect(DisplayValue.text(''), isNull);
    expect(DisplayValue.text('   '), isNull);
    expect(DisplayValue.text('null'), isNull);
    expect(DisplayValue.text('-'), isNull);
    expect(DisplayValue.text(<String>[]), isNull);
  });

  test('يرفض الصفر بشكل افتراضي بكل أنواعه', () {
    expect(DisplayValue.text(0), isNull);
    expect(DisplayValue.text(0.0), isNull);
    expect(DisplayValue.text('0'), isNull);
    expect(DisplayValue.text(' 0.00 '), isNull);
  });

  test('يقبل الصفر للحقول اللي الصفر فيها قيمة حقيقية', () {
    expect(DisplayValue.text(0, zeroIsValid: true), '0');
    expect(DisplayValue.text('0', zeroIsValid: true), '0');
  });

  test('يعرض الأرقام والنصوص الصالحة بنفس الشكل', () {
    expect(DisplayValue.text(120), '120');
    expect(DisplayValue.text(120.0), '120');
    expect(DisplayValue.text('120.5'), '120.5');
    expect(DisplayValue.text('  المعادي  '), 'المعادي');
  });

  test('withSuffix بيضيف الوحدة للقيم الصالحة بس', () {
    expect(DisplayValue.withSuffix(150, 'متر'), '150 متر');
    expect(DisplayValue.withSuffix(0, 'متر'), isNull);
    expect(DisplayValue.withSuffix(null, 'جنيه'), isNull);
  });

  test('firstValid بيرجّع أول قيمة صالحة بس', () {
    expect(DisplayValue.firstValid([null, 0, '', 'قيمة']), 'قيمة');
    expect(DisplayValue.firstValid([null, 0, '  ']), isNull);
  });

  test('list بيفلتر العناصر الفاضية والصفرية', () {
    expect(DisplayValue.list(['a', '', null, ' ', 0, 'b']), ['a', 'b']);
  });

  test('mapped بيتحقق من ناتج الـresolver كمان', () {
    expect(DisplayValue.mapped('x', (raw) => ''), isNull);
    expect(DisplayValue.mapped(null, (raw) => 'label'), isNull);
    expect(DisplayValue.mapped('x', (raw) => 'label'), 'label');
  });
}
