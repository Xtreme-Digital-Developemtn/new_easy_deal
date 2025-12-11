import 'package:flutter/material.dart';
IconData getFileIcon(String fileName) {
  final ext = fileName.split('.').last.toLowerCase();

  switch (ext) {
    case 'pdf':
      return Icons.picture_as_pdf;
    case 'doc':
    case 'docx':
      return Icons.description; // Word
    case 'xls':
    case 'xlsx':
      return Icons.grid_on; // Excel
    case 'jpg':
    case 'jpeg':
    case 'png':
      return Icons.image;
    case 'mp4':
    case 'mov':
      return Icons.videocam;
    default:
      return Icons.insert_drive_file;
  }
}
