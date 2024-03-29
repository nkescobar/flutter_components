import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fechaNacimiento = '';
  String _opcionSeleccionada = null;
  List<String> _poderes = [
    'Volar',
    'Rayos x',
    'Super aliento',
    'Super fuerza',
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setNombre(String value) {
    setState(() {
      _nombre = value;
    });
  }

  void _setEmail(String value) {
    setState(() {
      _email = value;
    });
  }

  void _setPassword(String value) {
    setState(() {
      _password = value;
    });
  }

  void _setFechaNacimiento(String value) {
    print('value $value');
    setState(() {
      _fechaNacimiento = value;
      _inputFieldDateController.text = _fechaNacimiento;
    });
  }

  void _setDropdown(String value) {
    setState(() {
      print('value----> $value');
      _opcionSeleccionada = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          TextFieldNombreWidget(
            nombre: _nombre,
            onChanged: _setNombre,
          ),
          Divider(),
          TextFieldEmailWidget(
            email: _email,
            onChanged: _setEmail,
          ),
          Divider(),
          TextFieldPasswordWidget(
            password: _password,
            onChanged: _setPassword,
          ),
          Divider(),
          TextFieldFechaNacimientoWidget(
            fechaNacimiento: _fechaNacimiento,
            onChanged: _setFechaNacimiento,
            inputFieldDateController: _inputFieldDateController,
          ),
          Divider(),
          DropdownWidget(
            opcionSeleccionada: _opcionSeleccionada,
            onChanged: _setDropdown,
            poderes: _poderes,
          ),
          Divider(),
          CrearPersona(_nombre, _email),
        ],
      ),
    );
  }
}

class CrearPersona extends StatelessWidget {
  final String _nombre;
  final String _email;

  const CrearPersona(this._nombre, this._email, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_nombre),
      subtitle: Text('Email:  $_email'),
    );
  }
}

class TextFieldNombreWidget extends StatelessWidget {
  const TextFieldNombreWidget({
    @required this.onChanged,
    @required this.nombre,
    Key key,
  }) : super(key: key);

  final Function(String) onChanged;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letras ${nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre de la persona',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
    );
  }
}

class TextFieldEmailWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String email;

  const TextFieldEmailWidget(
      {Key key, @required this.onChanged, @required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => this.onChanged(value),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
    );
  }
}

class TextFieldPasswordWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String password;

  const TextFieldPasswordWidget({
    Key key,
    @required this.onChanged,
    @required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      obscureText: true,
      onChanged: (value) => this.onChanged(value),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock)),
    );
  }
}

class TextFieldFechaNacimientoWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String fechaNacimiento;
  final TextEditingController inputFieldDateController;

  const TextFieldFechaNacimientoWidget({
    Key key,
    @required this.fechaNacimiento,
    @required this.onChanged,
    @required this.inputFieldDateController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      enableInteractiveSelection: false,
      controller: inputFieldDateController,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today)),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'CO'));

    if (picked != null) {
      this.onChanged(picked.toString());
    }
  }
}

class DropdownWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String opcionSeleccionada;
  final List<String> poderes;
  const DropdownWidget({
    Key key,
    @required this.opcionSeleccionada,
    @required this.onChanged,
    @required this.poderes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 1,
                color: Colors.black87,
              ),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              hint: opcionSeleccionada != null
                  ? null
                  : Text(
                      'Seleccione un poder',
                      style: TextStyle(color: Colors.black38),
                    ),
              value: opcionSeleccionada,
              items: getOpcionesDropdown(),
              onChanged: (opt) => this.onChanged(opt)),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }
}
