import 'package:flutter/material.dart';

import '../screens/term_screen.dart';

class PasswordScreen extends StatefulWidget {
  final Function(int, String) onChangedStep;

  PasswordScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isSecret = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _password = '';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => widget.onChangedStep(0, null),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                Text(
                  'Password'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Votre mot de passe'),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _password = value),
                        validator: (value) => value.length < 6 
                          ? 'Entrez un mot de passe 6 caracteres minimum'
                          : null,
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap : () => setState(
                              () => _isSecret = !_isSecret,
                            ),
                            child: Icon(
                              !_isSecret 
                              ? Icons.visibility
                              : Icons.visibility_off,
                            ),
                          ),
                          hintText: 'ex: /fdùD145/',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                      height: 10.0,
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        elevation: 2,
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                          child: Text(
                            'Entrer'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        onPressed: 
                          _password.length < 6 
                            ? null
                            : () {
                              print("status : " + _formKey.currentState.validate().toString());
                              if(_formKey.currentState.validate()) {
                                widget.onChangedStep(null, _password);
                              }
                            },
                      ),
                    ],
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
