import 'package:flutter/material.dart';
import 'package:saudeatividade_app/SaudeMessage.dart';

class Saude extends StatefulWidget {
  @override
  _SaudeState createState() => _SaudeState();
}

class _SaudeState extends State<Saude> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _sobrenome = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _login = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _celular = TextEditingController();

  String _escolhaSexo;
  double _valor = 0;

  bool _hipertensao = false;
  bool _diabetes = false;
  bool _asma = false;
  bool _outro = false;

  String label = "0";
  String _textoResultado = "";
  String valor = "";

  void _limparCampos(){ // limpa os campos de dados após o calculo
    _nome.text = "";
    _sobrenome.text = "";
    _cpf.text = "";
    _login.text = "";
    _senha.text = "";
    _celular.text = "";
    _hipertensao = false;
    _diabetes = false;
    _asma = false;
    _outro = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Estado de Saúde - Cadastro"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Dados Gerais", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                //region Textfield
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome"),
                  style: TextStyle(fontSize: 15),
                  maxLength: 200,
                  controller: _nome,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Sobrenome"),
                  style: TextStyle(fontSize: 15),
                  maxLength: 200,
                  controller: _sobrenome,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "CPF"),
                  style: TextStyle(fontSize: 15),
                  maxLength: 11,
                  controller: _cpf,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Login"),
                  style: TextStyle(fontSize: 15),
                  maxLength: 200,
                  controller: _login,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Senha"),
                  style: TextStyle(fontSize: 15),
                  maxLength: 200,
                  obscureText: true,
                  controller: _senha,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Celular"),
                  style: TextStyle(fontSize: 15),
                  maxLength: 20,
                  controller: _celular,
                ),
                //endregion

                //region RadioButton
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Sexo", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                RadioListTile(title: Text("Masculino"),value: "m", groupValue: _escolhaSexo, activeColor: Colors.red, onChanged: (String escolha){
                  setState(() {
                    _escolhaSexo = escolha;
                  });
                }),
                RadioListTile(title: Text("Feminino"),value: "f", groupValue: _escolhaSexo,activeColor: Colors.red, onChanged: (String escolha){
                  setState(() {
                    _escolhaSexo = escolha;
                  });
                }),
                //endregion

                //region Slider
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Altura", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Slider(
                    value: _valor,
                    min: 0,
                    max: 5,
                    label: label,
                    divisions: 100,
                    activeColor: Colors.red,
                    inactiveColor: Colors.black,
                    onChanged: (double novoValor){
                      setState(() {
                        _valor = novoValor;
                        label = novoValor.toString();
                      });
                    }),
                //endregion

                //region Checkbox
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Caso", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CheckboxListTile(
                    title: Text("Hipertensão"),
                    activeColor: Colors.red,
                    secondary: Icon(Icons.add_box),
                    value: _hipertensao,
                    onChanged: (bool valor) {
                      setState(() {
                        _hipertensao = valor;
                      });
                    }),
                CheckboxListTile(
                    title: Text("Diabetes"),
                    activeColor: Colors.red,
                    secondary: Icon(Icons.add_box),
                    value: _diabetes,
                    onChanged: (bool valor) {
                      setState(() {
                        _diabetes = valor;
                      });
                    }),
                CheckboxListTile(
                    title: Text("Asma"),
                    activeColor: Colors.red,
                    secondary: Icon(Icons.add_box),
                    value: _asma,
                    onChanged: (bool valor) {
                      setState(() {
                        _asma = valor;
                      });
                    }),
                CheckboxListTile(
                    title: Text("Outro"),
                    activeColor: Colors.red,
                    secondary: Icon(Icons.add_box),
                    value: _outro,
                    onChanged: (bool valor) {
                      setState(() {
                        _outro = valor;
                      });
                    }),
                //endregion

                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                      color: Colors.red, // cor do botão
                      textColor: Colors.white, // cor de texto do botão
                      padding: EdgeInsets.all(15), //espaçamento do botão
                      child: Text("Salvar", style: TextStyle(fontSize: 15),),
                      onPressed: (){
                        _textoResultado = "\n\nNome: " + _nome.text.toString()
                            + "\nSobrenome: " +_sobrenome.text.toString()
                            + "\nCPF: " + _cpf.text.toString()
                            + "\nLogin: " + _login.text.toString()
                            //+ "\nSexo: " + _escolhaSexo.toString()
                            //+ "\nHipertensao: " + _hipertensao.toString()
                            //+ "\nAsma: " + _asma.toString()
                            //+ "\nDiabetes: " + _diabetes.toString()
                            + "\nAltura: " + _valor.toDouble().toString();

                        print(_textoResultado);
                        _limparCampos();

                        Navigator.push(context, MaterialPageRoute(builder: (context) => SaudeMessage(valor: "Cadastro efetuado com sucesso!"+_textoResultado,)));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
