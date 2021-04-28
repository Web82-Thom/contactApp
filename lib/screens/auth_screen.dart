import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';

class AuthScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  AuthScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // gerer l'état de l'authentification
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Tout le monde\n'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                    children: [
                      TextSpan(
                          text: 'a quelque chose \n'.toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                        text: 'à partager.'.toUpperCase(),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Toutes les étoiles sont ici.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Entrer votre Email',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(
                          () => _email = value,
                        ),
                        validator: (value) =>
                            value.isEmpty || !EmailValidator.validate(_email)
                                ? 'Veuillez entrer un E-mail valide'
                                : null,
                        decoration: InputDecoration(
                          hintText: 'ex: test@test.com',
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
                        height: 20.0,
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        elevation: 2,
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        child: Text(
                          'Continuer'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                         
                          if (_formKey.currentState.validate()) {
                            widget.onChangedStep(1);
                          }
                        },
                      )
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
