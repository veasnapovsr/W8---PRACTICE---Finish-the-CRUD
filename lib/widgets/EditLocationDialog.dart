import 'package:flutter/material.dart';

class EditLocationDialog extends StatefulWidget {
  final Location location;

  const EditLocationDialog({super.key, required this.location});

  @override
  _EditLocationDialogState createState() => _EditLocationDialogState();
}

class _EditLocationDialogState extends State<EditLocationDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _countryController;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _countryController = TextEditingController(text: widget.location.country);
    _nameController = TextEditingController(text: widget.location.name);
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

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final locationProvider = context.read<LocationProvider>();
      locationProvider.updateLocation(
        widget.location.id,
        _countryController.text.trim(),
        _nameController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location updated successfully')),
      );

      Navigator.pop(context); // Close the dialog after saving
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Location'),
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
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveChanges,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
