import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  var _resultado = '';

  void _calcularPreco(){
    
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        this._resultado = 'Preço inválido! O preço deve ser maior que "0" e ser digitado utilizando o "."!';      
      });
    }

    if((precoAlcool / precoGasolina) >= 0.7){
      setState(() {
        this._resultado = 'É melhor abastecer com gasolina!';      
      });
    } else {
      setState(() {
        this._resultado = 'É melhor abastecer com álcool!';      
      });
    }

    //_limparCampos();

  }

  /*void _limparCampos(){
    _controllerGasolina.text = '';
    _controllerAlcool.text = '';
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: Text('Álcool ou gasolina?'),
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Padding(
                padding: EdgeInsets.fromLTRB(32, 32, 32, 10),
                child: Image.asset('images/logo.png'),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(32, 20, 32, 0),
                child: Text('Saiba qual a melhor opção para abastecer seu carro',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),
                )
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(32, 10, 32, 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  decoration: InputDecoration(
                    labelText: 'Preço do álcool, Ex: 1.59',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),
                    focusColor: Colors.blue
                  ),
                  onSubmitted: (String valorAlcool){
                    
                  },
                  controller: _controllerAlcool,
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(32, 10, 32, 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  decoration: InputDecoration(
                    labelText: 'Preço da gasolina, Ex: 3.59',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),
                    focusColor: Colors.blue
                  ),
                  onSubmitted: (String valorGasolina){

                  },
                  controller: _controllerGasolina,
                ),
              ),
            
              SizedBox(
                height: 50,
                width: 200,
                child: RaisedButton(
                  color: Colors.yellow[600],
                  child: Text('Calcular', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    )
                  ),
                  onPressed: _calcularPreco,
                )
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(32, 20, 20, 20),
                child: Text(_resultado,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}