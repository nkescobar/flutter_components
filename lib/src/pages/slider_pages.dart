import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setValorSlider(double value) {
    setState(() {
      _valorSlider = value;
    });
  }

  void _setBloquearCheck(bool value) {
    setState(() {
      _bloquearCheck = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        child: Column(
          children: [
            SliderWidget(
              valorSlider: _valorSlider,
              onChanged: _bloquearCheck ? null : _setValorSlider,
            ),
            Divider(),
            ImagenWidget(
              valorSlider: _valorSlider,
            ),
            Divider(),
            CheckboxWidget(
              bloquearCheck: _bloquearCheck,
              onChanged: _setBloquearCheck,
            ),
            Divider(),
            SwitchWidget(
              bloquearCheck: _bloquearCheck,
              onChanged: _setBloquearCheck,
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  final double valorSlider;
  final Function(double) onChanged;

  const SliderWidget({
    Key key,
    @required this.valorSlider,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Slider(
        value: valorSlider,
        activeColor: Colors.indigo,
        label: valorSlider.round().toString(),
        min: 10.0,
        max: 400.0,
        divisions: 20,
        onChanged: (valor) => this.onChanged(valor),
      ),
    );
  }
}

class ImagenWidget extends StatelessWidget {
  final valorSlider;
  const ImagenWidget({Key key, @required this.valorSlider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image(
        width: valorSlider,
        fit: BoxFit.contain,
        image: NetworkImage(
            'https://assets.stickpng.com/images/580b57fbd9996e24bc43bd2a.png'),
      ),
    );
  }
}

class CheckboxWidget extends StatelessWidget {
  final bool bloquearCheck;
  final Function(bool) onChanged;
  const CheckboxWidget({
    Key key,
    @required this.bloquearCheck,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return Checkbox(
      value: bloquearCheck,
      onChanged: (valor) => onChanged(valor),
    );*/
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: bloquearCheck,
      onChanged: (valor) => onChanged(valor),
    );
  }
}

class SwitchWidget extends StatelessWidget {
  final bool bloquearCheck;
  final Function(bool) onChanged;
  const SwitchWidget({
    Key key,
    @required this.bloquearCheck,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: bloquearCheck,
      onChanged: (valor) => onChanged(valor),
    );
  }
}
