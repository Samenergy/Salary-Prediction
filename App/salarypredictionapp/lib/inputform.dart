import 'package:flutter/material.dart';
import 'package:salarypredictionapp/predict.dart';

class SalaryPredictionForm extends StatefulWidget {
  const SalaryPredictionForm({Key? key}) : super(key: key);

  @override
  State<SalaryPredictionForm> createState() => _SalaryPredictionFormState();
}

class _SalaryPredictionFormState extends State<SalaryPredictionForm> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _educationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _jobTitleController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    _jobTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Predict Your Salary',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              _buildInputField(
                controller: _ageController,
                label: 'Age',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _educationController,
                label: 'Education Level',
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _experienceController,
                label: 'Years of Experience',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _jobTitleController,
                label: 'Job Title',
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handlePredict,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Predict',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  void _handlePredict() {
    if (_formKey.currentState!.validate()) {
      // You can navigate to the results screen here
      // For example:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SalaryPredictionScreen(
            age: int.tryParse(_ageController.text) ?? 0,
            experienceYears: int.tryParse(_experienceController.text) ?? 0,
            education: _educationController.text,
            role: _jobTitleController.text,
          ),
        ),
      );
    }
  }
}