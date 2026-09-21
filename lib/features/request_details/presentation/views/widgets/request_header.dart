import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../main_imports.dart';
import '../../view_model/request_details_cubit.dart';

class RequestHeader extends StatelessWidget {
  const RequestHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var requestDetailsCubit = context.read<RequestDetailsCubit>();
    var details =  requestDetailsCubit
        .requestDetailsModel!
        .data!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        16,
        8,
        16,
        24,
      ),
      decoration:   BoxDecoration(
        color: AppColors.primaryDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          /// Request Title
            Text(details.type!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 12),

          /// First Row Tags
          Wrap(
            spacing: 6,
            runSpacing: 7,
            children:   [
              _RequestTag(
                title: details.specializationScope!,
              ),
              _RequestTag(
                title: details.unit!,
              ),
            ],
          ),

          const SizedBox(height: 7),

          /// Second Row Tags
          Wrap(
            spacing: 6,
            runSpacing: 7,
            children:   [
              _RequestTag(
                title:  details.detailedAddress
                    .toString(),
              ),
              _RequestTag(
                title:  context.isArabic
                    ? details.locations![0].city!.nameAr.toString()
                    : details.locations![0].city!.nameEn.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RequestTag extends StatelessWidget {
  final String title;

  const _RequestTag({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFDCEAFF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1234A6),
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}