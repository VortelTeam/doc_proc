// employee_documents_screen.dart

import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header tabs
        Row(
          children: [
            const Text(
              'Upload all the necessary files here',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text('Output'),
            ),
            const Text('|'),
            TextButton(
              onPressed: () {},
              child: const Text('Form'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // ID Verification section
        DocumentSection(
          title: 'ID Verification',
          subtitle: 'Upload 2 Files',
          files: idFiles,
          onBrowse: () {
            // Handle file browsing
          },
          maxFiles: 2,
        ),
        const SizedBox(height: 24),
        // Employment Status
        ListTile(
          title: const Text('Employment Status'),
          subtitle: const Text('CanadianCitizenship.pdf'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              // Handle delete
            },
          ),
        ),
        // Employment Offer Letter
        ListTile(
          title: const Text('Employment Offer Letter'),
          subtitle: const Text('Meta_Offer_Letter2024.pdf'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              // Handle delete
            },
          ),
        ),
        const SizedBox(height: 24),
        // Additional Documents section
        DocumentSection(
          title: 'Additional Document(s)',
          subtitle: 'Upload Up To 5 Files',
          files: additionalFiles,
          onBrowse: () {
            // Handle file browsing
          },
          maxFiles: 5,
        ),
        const Spacer(),
        Row(
          children: [
            const Text(
              'All these documents should be able to complete the form',
              style: TextStyle(color: Colors.grey),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                // Handle parse and continue
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Parse and Continue'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8D1D1),
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DocumentSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<UploadedFile> files;
  final VoidCallback onBrowse;
  final int maxFiles;

  const DocumentSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.files,
    required this.onBrowse,
    required this.maxFiles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.info_outline,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(subtitle),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5F5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.cloud_upload_outlined,
                size: 48,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Drag & drop files or'),
                  TextButton(
                    onPressed: onBrowse,
                    child: const Text('Browse'),
                  ),
                ],
              ),
              const Text(
                'Supported formates: JPEG, PNG, GIF, MP4, PDF, PSD, AI, Word, PPT',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            for (var file in files)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(file.name),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.red,
                      onPressed: () {
                        // Handle file removal
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
        if (files.length >= maxFiles)
          const Text(
            'Max upload limit reached!',
            style: TextStyle(color: Colors.grey),
          ),
      ],
    );
  }
}

class Employee {
  final String name;
  final String title;

  Employee(this.name, this.title);
}

class UploadedFile {
  final String name;

  UploadedFile(this.name);
}
