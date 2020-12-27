import 'package:flutter/material.dart';
import 'package:mvc_mvvm_mobx_masterclass_balta/controllers/signup.controller.dart';
import 'package:mvc_mvvm_mobx_masterclass_balta/stores/app.store.dart';
import 'package:mvc_mvvm_mobx_masterclass_balta/view-models/signup.viewmodel.dart';
import 'package:mvc_mvvm_mobx_masterclass_balta/views/home.view.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _signupController = new SignupController();
  var model = new SignupViewModel();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastre-se"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nome Inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.name = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'E-mail Inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.email = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Senha Inválida';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.password = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                model.busy
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ),
                        ),
                      )
                    : FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }

                          setState(() {});

                          _signupController.create(model).then((data) {
                            setState(() {});

                            store.setUser(
                              data.name,
                              data.email,
                              data.picture,
                              data.token,
                            );

                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                                return HomeView();
                              },
                            ));
                          });
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
