import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projeto_checkpoint/screens/signup/registration_adress_screen.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Informações pessoais',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, digite seu email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome completo',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  inputFormatters: [
                    // obrigatório
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  controller: _cpfController,
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  inputFormatters: [
                    // obrigatório
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
                  controller: _birthdayController,
                  decoration: const InputDecoration(
                    labelText: 'Data de nascimento',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  inputFormatters: [
                    // obrigatório
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      Get.to(
                        () => const RegistrationAdressScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: const Text('Continuar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
