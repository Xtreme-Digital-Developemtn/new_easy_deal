import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';

class BuildImageContainer extends StatelessWidget {
  final bool isFront;
  final File? imageFile;
  final VoidCallback onPickImage;
  final VoidCallback onClearImage;
  final String title;

  const BuildImageContainer({
    super.key,
    required this.isFront,
    required this.imageFile,
    required this.onPickImage,
    required this.onClearImage, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPickImage,
      child: AspectRatio(
        aspectRatio: 1.586,
        child: Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primaryDark,
              width: 2,
            ),
            color: Colors.grey[100],
          ),
          child: imageFile == null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_a_photo,
                size: 40,
                color: AppColors.primaryDark,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          )
              : Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(imageFile!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: onClearImage,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}