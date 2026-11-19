import '../app_services/remote_services/end_points.dart';

/// بيحوّل المسار اللي راجع من السيرفر لرابط كامل يقدر يتفتح.
///
/// السيرفر ساعات بيرجّع رابط كامل وساعات بيرجّع مسار نسبي (بشرطة في أوله أو
/// من غيرها)، ولو عرضنا المسار النسبي زي ما هو الصورة بتقع من غير سبب واضح.
/// بترجّع نص فاضي لو مافيش قيمة، عشان الشاشة تعرف تعرض بديل.
String buildMediaUrl(String? url) {
  final value = url?.trim() ?? '';
  if (value.isEmpty) return '';
  if (value.startsWith('http://') || value.startsWith('https://')) return value;

  final base = EndPoints.imageBaseUrl.endsWith('/')
      ? EndPoints.imageBaseUrl.substring(0, EndPoints.imageBaseUrl.length - 1)
      : EndPoints.imageBaseUrl;
  final path = value.startsWith('/') ? value : '/$value';
  return '$base$path';
}

/// بتحدّد لو الملف PDF (من الامتداد أو من النوع الراجع من السيرفر)، عشان
/// مانحاولش نعرضه كصورة.
bool isPdfMedia({String? url, String? type}) {
  if (type != null && type.toLowerCase().contains('pdf')) return true;
  final value = url?.toLowerCase() ?? '';
  if (value.isEmpty) return false;
  final withoutQuery = value.split('?').first;
  return withoutQuery.endsWith('.pdf');
}
