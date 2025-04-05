import 'package:flutter/material.dart';

///import provider

class CreateLocationDialog extends StatefulWidget {
  const CreateLocationDialog({super.key});

  @override
  _CreateLocationDialogState createState() => _CreateLocationDialogState();
}

class _CreateLocationDialogState extends State<CreateLocationDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _countryController;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _countryController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _countryController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    );
  }

  // void _saveLocation() {
  //   if (_formKey.currentState!.validate()) {
  //     final locationProvider = context.read<LocationProvider>();
  //     locationProvider.addLocation(
  //       _countryController.text.trim(),
  //       _nameController.text.trim(),
  //     );

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Location created successfully')),
  //     );

  //     Navigator.pop(context); // Close the dialog
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Location'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _countryController,
              autofocus: true,
              decoration: _inputDecoration('Country'),
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter a country'
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nameController,
              decoration: _inputDecoration('Location Name'),
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter a location name'
                  : null,
            ),
          ],
        ),
      ),
      // actions: [
      //   TextButton(
      //     onPressed: () => Navigator.pop(context),
      //     child: const Text('Cancel'),
      //   ),
      //   ElevatedButton(
      //     onPressed: _saveLocation,
      //     child: const Text('Save'),
      //   ),
      // ],
    );
  }
}
