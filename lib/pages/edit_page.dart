// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';
import '../models/phonebook_model.dart';
import '../repositories/phonebook_repository.dart';

class EditPage extends StatefulWidget {
  int id = 0;
  String name = '';
  String phoneNumber = '';
  String email = '';

  EditPage({
    Key? key,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late PhonebookRepository phonebookRepository;

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var phonebook = <PhonebookModel>[];
  bool isEdit = false;

  var maskFormatter = MaskTextInputFormatter(
      mask: '(##)#####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController;
    phoneNumberController;
    emailController;
    super.dispose();
  }

  @override
  void initState() {
    phonebookRepository = PhonebookRepository();

    nameController.text = widget.name;
    phoneNumberController.text = widget.phoneNumber;
    emailController.text = widget.email;
    if (widget.id >= 1) {
      isEdit = true;

      nameController.text = widget.name;
      phoneNumberController.text = widget.phoneNumber;
      emailController.text = widget.email;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Update' : 'Create'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                validator: Validatorless.min(
                    3, 'The name should have more than 3 letters'),
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: Validatorless.number('Please type only numbers'),
                controller: phoneNumberController,
                inputFormatters: [maskFormatter],
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Phone number'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: Validatorless.email('Please type a valid e-mail'),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'E-mail'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Preencha corretamente')));
                    } else {
                      isEdit ? updateData() : createData();
                    }
                    Navigator.pop(context, 'refresh');
                  },
                  child: Text(
                    isEdit ? 'Update' : 'Add',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateData() async {
    await phonebookRepository.updateContact(
        widget.id,
        PhonebookModel.create(
          name: nameController.text,
          phoneNumber: phoneNumberController.text,
          email: emailController.text,
        ));
  }

  Future<void> createData() async {
    await phonebookRepository.createContact(PhonebookModel.create(
      name: nameController.text,
      phoneNumber: phoneNumberController.text,
      email: emailController.text,
    ));
  }
}
