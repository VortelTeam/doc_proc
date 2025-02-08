import 'package:doc_proc/employee_table.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  final Employee employee;

  const EmployeeDetails({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(employee.name),
          automaticallyImplyLeading: false,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildDetailRow('Name', employee.name),
                _buildDetailRow('Title', employee.title),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
