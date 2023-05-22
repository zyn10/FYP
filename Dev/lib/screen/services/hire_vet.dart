import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petbook/screen/services/service.dart';
import 'package:petbook/utils/utils.dart';

class HireVetScreen extends StatefulWidget {
  const HireVetScreen({super.key});

  @override
  State<HireVetScreen> createState() => HireVetScreenState();
}

class HireVetScreenState extends State<HireVetScreen> {
  final bool _isloading = false;
  Uint8List? _image;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _petBreedController = TextEditingController();
  final TextEditingController _petAgeController = TextEditingController();
  final TextEditingController _serviceTypeController = TextEditingController();
  final TextEditingController _servicePriceController = TextEditingController();

  @override
  void dispose() {
    _petNameController.dispose();
    _petBreedController.dispose();
    _petAgeController.dispose();
    _serviceTypeController.dispose();
    _servicePriceController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Hire a vet",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ServiceScreen(),
              ));
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _petNameController,
                decoration: const InputDecoration(labelText: 'Pet Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a pet name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _petBreedController,
                decoration: const InputDecoration(labelText: 'Pet Breed'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a pet breed';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _petAgeController,
                decoration: const InputDecoration(
                  labelText: 'Pet Age',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a pet age';
                  }
                  // Regex pattern to check if the value is a number
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Invalid pet age. Please enter a number.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _serviceTypeController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description of the service';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _servicePriceController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service price';
                  }
                  // Regex pattern to check if the value is a number
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Invalid service price. Please enter a number.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
                alignment: Alignment.center,
                child: _image != null
                    ? Image.memory(
                        _image!,
                        fit: BoxFit.cover,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 50,
                            color: Colors.grey,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_a_photo,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Tap to add a Image of pet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(450, 50)),
                  child: _isloading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('Submit Request'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
