import 'package:doc_proc/data/employee_repo.dart';
import 'package:flutter/material.dart';

class EmployeeTable extends StatefulWidget {
  const EmployeeTable({super.key});

  @override
  State<EmployeeTable> createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> {
  late List<(bool, {String name, String title})> _employees;

  @override
  void initState() {
    super.initState();
    final employees = EmployeeRepo().getAll();
    _employees = List.generate(
      EmployeeRepo().getAll().length,
      (index) {
        final e = employees[index];
        return (false, name: e.name, title: e.title);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      columnSpacing: 40,
      horizontalMargin: 20,
      dividerThickness: 0, // Remove row separators
      columns: const [
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
      rows: _employees
          .map((e) => DataRow(
                selected: e.$1,
                onSelectChanged: (isSelected) {
                  setState(() {
                    _employees = _employees.map((emp) {
                      return (emp == e ? !e.$1 : false, name: emp.name, title: emp.title);
                    }).toList();
                  });
                },
                cells: [
                  DataCell(Text(e.name)),
                  DataCell(Text(e.title)),
                ],
              ))
          .toList(),
    );
  }
}
