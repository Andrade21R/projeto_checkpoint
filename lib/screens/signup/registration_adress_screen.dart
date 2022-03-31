import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:projeto_checkpoint/screens/signup/password_screen.dart';
import 'package:search_cep/search_cep.dart';

class RegistrationAdressScreen extends StatefulWidget {
  const RegistrationAdressScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationAdressScreen> createState() =>
      _RegistrationAdressScreenState();
}

class _RegistrationAdressScreenState extends State<RegistrationAdressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cepController = MaskedTextController(mask: '00000-000');
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = MaskedTextController(mask: 'AA');

  fetchApi() async {
    if (_cepController.text.isNotEmpty) {
      final viaCepSearchCep = ViaCepSearchCep();
      final infoCepJSON = await viaCepSearchCep.searchInfoByCep(
          cep: _cepController.text.replaceAll("-", ""));
      infoCepJSON.fold(
          (l) => {
                _stateController.clear(),
                _cityController.clear(),
                _neighborhoodController.clear(),
                _streetController.clear(),
                _numberController.clear(),
                Get.snackbar(
                  'Erro',
                  'Não foi possível encontrar o CEP informado',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  icon: const Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                )
              },
          (r) => {
                _streetController.text = r.logradouro ?? '',
                _neighborhoodController.text = r.bairro ?? '',
                _cityController.text = r.localidade ?? '',
                _stateController.text = r.uf ?? '',
              });
    }
  }

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
                    'Endereço',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: TextFormField(
                        onFieldSubmitted: (value) => fetchApi(),
                        controller: _cepController,
                        decoration: const InputDecoration(
                          labelText: 'CEP',
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.search,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        onPressed: () => fetchApi(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextFormField(
                        controller: _streetController,
                        decoration: const InputDecoration(
                          labelText: 'Logradouro',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: _numberController,
                        decoration: const InputDecoration(
                          labelText: 'Número',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Complemento',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _neighborhoodController,
                  decoration: const InputDecoration(
                    labelText: 'Bairro',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(
                          labelText: 'Cidade',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: _stateController,
                        decoration: const InputDecoration(
                          labelText: 'Estado',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
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
                      Get.to(() => const PasswordScreen(),
                          transition: Transition.rightToLeft);
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
