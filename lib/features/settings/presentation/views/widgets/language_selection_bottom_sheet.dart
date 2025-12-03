import 'package:easy_deal/core/shared_cubits/lang_cubit/lang_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';

void showLanguageBottomSheet(BuildContext context, Locale currentLocale) {
  String? selectedLanguageCode;
  bool isLanguageChanged = false;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0.r),
                topRight: Radius.circular(20.0.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LangKeys.selectLang.tr(),
                        style: AppStyles.black20Bold,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(SvgImages.close),
                      ),
                    ],
                  ),
                  Gap(20.h),
                  Expanded(
                    child: _buildLanguageList(
                      context,
                      currentLocale,
                      selectedLanguageCode,
                          (String code) {
                        setState(() {
                          selectedLanguageCode = code;
                          isLanguageChanged = (selectedLanguageCode != currentLocale.languageCode);
                          _changeLanguage(context, selectedLanguageCode!);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildLanguageList(
    BuildContext context,
    Locale currentLocale,
    String? selectedLanguageCode,
    Function(String) onLanguageSelected,
    ) {
  final languages = [
    {
      'code': 'en',
      'name': 'English',
      'localName': 'English',
      'flag': '🇺🇸',
    },
    {
      'code': 'ar',
      'name': 'Arabic',
      'localName': 'العربية',
      'flag': '🇸🇦',
    },
  ];

  return ListView.separated(
    padding: EdgeInsets.all(16),
    itemCount: languages.length,
    separatorBuilder: (context, index) => Gap(12.h),
    itemBuilder: (context, index) {
      final language = languages[index];
      final isSelected = selectedLanguageCode != null
          ? selectedLanguageCode == language['code']
          : currentLocale.languageCode == language['code'];
      return _buildLanguageItem(
        context: context,
        language: language,
        isSelected: isSelected,
        onTap: () => onLanguageSelected(language['code']!),
      );
    },
  );
}

Widget _buildLanguageItem({
  required BuildContext context,
  required Map<String, String> language,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: isSelected ? Color(0xfff7f7f7) : Colors.white,
        border: isSelected ? Border.all(color: AppColors.primaryDark) : null,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                language['flag']!,
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(width: 12.w),
              Text(
                language['localName']!,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          if (isSelected)
            SvgPicture.asset(SvgImages.tickCircle),
        ],
      ),
    ),
  );
}

void _changeLanguage(BuildContext context, String languageCode) {
  final newLocale = Locale(languageCode, '');
  final langCubit = context.read<LanguageCubit>();
  langCubit.changeLanguage(context, newLocale);
   Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        languageCode == 'ar'
            ? 'تم تغيير اللغة إلى العربية'
            : 'Language changed to English',
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ),
  );
}