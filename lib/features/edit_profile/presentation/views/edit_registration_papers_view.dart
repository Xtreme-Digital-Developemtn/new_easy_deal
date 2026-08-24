import 'dart:io';

import 'package:easy_deal/core/app_services/local_services/cache_helper.dart';
import 'package:easy_deal/core/shared_widgets/global_app_bar.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/profile/data/models/client_profile_model.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../main_imports.dart';

class EditRegistrationPapersView extends StatefulWidget {
  const EditRegistrationPapersView({super.key});

  @override
  State<EditRegistrationPapersView> createState() =>
      _EditRegistrationPapersViewState();
}

class _EditRegistrationPapersViewState extends State<EditRegistrationPapersView> {
  static const List<_PaperField> _independentPapers = [
    _PaperField(key: 'image', label: 'الصورة الشخصية'),
    _PaperField(key: 'idFront', label: 'الهوية (وجه أول)'),
    _PaperField(key: 'idBack', label: 'الهوية (وجه ثاني)'),
  ];

  static const List<_PaperField> _brokerPapers = [
    _PaperField(key: 'image', label: 'الصورة الشخصية'),
    _PaperField(key: 'idFront', label: 'الهوية (وجه أول)'),
    _PaperField(key: 'idBack', label: 'الهوية (وجه ثاني)'),
    _PaperField(key: 'taxCardImage', label: 'البطاقة الضريبية'),
    _PaperField(key: 'commercialRegistryImage', label: 'السجل التجاري'),
  ];

  List<_PaperField> _papersFor(String? type) {
    if (type == 'real_estate_brokage_company') return _brokerPapers;
    return _independentPapers;
  }

  final Map<String, File?> _selected = {};

  String? _urlFor(Data? profile, String key) {
    if (profile == null) return null;
    switch (key) {
      case 'image':
        return profile.image;
      case 'idFront':
        return profile.idFront;
      case 'idBack':
        return profile.idBack;
      case 'taxCardImage':
        return profile.taxCardImage;
      case 'commercialRegistryImage':
        return profile.commercialRegistryImage;
      default:
        return null;
    }
  }

  File? _fileFor(String key) => _selected[key];

  Future<void> _pick(String key) async {
    final file = await EditProfileCubit.get(context).pickDocument();
    if (file != null) {
      setState(() => _selected[key] = file);
    }
  }

  void _clear(String key) {
    setState(() => _selected.remove(key));
  }

  void _save() {
    final files = <String, File>{};
    _selected.forEach((key, value) {
      if (value != null) files[key] = value;
    });
    EditProfileCubit.get(context).updateUserImages(files);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileStates>(
      listener: (context, state) {
        if (state is EditProfileDataSuccessState) {
          context
              .read<ProfileCubit>()
              .getClientProfile(clientId: CacheHelper.getData(key: "userId"));
          Navigator.of(context).pop();
          Toast.showSuccessToast(msg: "تم التحديث بنجاح", context: context);
        } else if (state is EditProfileDataErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is EditProfileDataLoadingState;
        final profile =
            context.read<ProfileCubit>().clientProfileModel?.data;

        return Scaffold(
          appBar: GlobalAppBar(title: LangKeys.registrationPapers),
          body: profile == null
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    AbsorbPointer(
                      absorbing: isLoading,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ..._papersFor(profile?.type).map((paper) {
                              final url = _urlFor(profile, paper.key);
                              final selected = _fileFor(paper.key);
                              return _buildPaperCard(
                                label: paper.label,
                                imageUrl: url,
                                selectedImage: selected,
                                onPick: () => _pick(paper.key),
                                onClear: selected != null
                                    ? () => _clear(paper.key)
                                    : null,
                              );
                            }).toList(),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (isLoading || _selected.isEmpty)
                                    ? null
                                    : _save,
                                child: Text('حفظ'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isLoading)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildPaperCard({
    required String label,
    required String? imageUrl,
    required File? selectedImage,
    required VoidCallback onPick,
    required VoidCallback? onClear,
  }) {
    final hasImage =
        selectedImage != null || (imageUrl != null && imageUrl.isNotEmpty);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 19 + 9 + 25  + 8
          // 27 + 2 + 6 +3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: onPick,
                    icon: const Icon(Icons.edit, size: 18),
                    label: Text('تعديل'),
                  ),
                  if (onClear != null)
                    TextButton.icon(
                      onPressed: onClear,
                      icon: const Icon(Icons.delete, size: 18),
                      label: Text('حذف'),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              image: hasImage
                  ? DecorationImage(
                      image: selectedImage != null
                          ? FileImage(selectedImage)
                          : NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: !hasImage
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'لم يتم رفع صورة',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : null,
          ),
          if (selectedImage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'تم اختيار صورة جديدة بانتظار الحفظ',
                style: const TextStyle(color: Colors.green, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}

class _PaperField {
  final String key;
  final String label;
  const _PaperField({required this.key, required this.label});
}
