import 'package:doc_proc/doc_section.dart';
import 'package:flutter/material.dart';

class UploadedFile {
  final String name;

  UploadedFile(this.name);
}

class DocumentUploadForm extends StatefulWidget {
  const DocumentUploadForm({super.key});

  @override
  State<DocumentUploadForm> createState() => _DocumentUploadFormState();
}

class _DocumentUploadFormState extends State<DocumentUploadForm> {
  final List<UploadedFile> idFiles = [
    UploadedFile('Passport.pdf'),
    UploadedFile('LicenseImage.jpeg'),
  ];

  final List<UploadedFile> additionalFiles = [
    UploadedFile('AthenaOnboardingFile.pdf'),
    UploadedFile('TaxReturn_2025.pdf'),
    UploadedFile('Medicalfiles_2018.pdf'),
    UploadedFile('Attendance_Record.csv'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DocumentSection(
            title: 'ID Verification',
            files: idFiles,
            onBrowse: () {
              // Handle file browsing
            },
            maxFiles: 2,
          ),
        ],
      ),
    );
  }
}
