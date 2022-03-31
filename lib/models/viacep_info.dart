import 'dart:convert';

class ViaCepInfo {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;

  ViaCepInfo({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  ViaCepInfo copyWith({
    String? cep,
    String? logradouro,
    String? bairro,
    String? localidade,
    String? uf,
  }) {
    return ViaCepInfo(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }

  factory ViaCepInfo.fromMap(Map<String, dynamic> map) {
    return ViaCepInfo(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ViaCepInfo.fromJson(String source) =>
      ViaCepInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ViaCepInfo(cep: $cep, logradouro: $logradouro, bairro: $bairro, localidade: $localidade, uf: $uf)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ViaCepInfo &&
        other.cep == cep &&
        other.logradouro == logradouro &&
        other.bairro == bairro &&
        other.localidade == localidade &&
        other.uf == uf;
  }

  @override
  int get hashCode {
    return cep.hashCode ^
        logradouro.hashCode ^
        bairro.hashCode ^
        localidade.hashCode ^
        uf.hashCode;
  }
}
