class Nome{
  String nome;
  String lingua;
  
  Nome({this.nome,this.lingua});

  factory Nome.fromJson(Map<String, dynamic> json) {
    String nome = json['nome']['valore'];
    String lingua = json['nome']['lingua'];
    nome = nome[0].toUpperCase() + nome.substring(1);
    return Nome(
      nome: nome,
      lingua: lingua,
    );
  }
}