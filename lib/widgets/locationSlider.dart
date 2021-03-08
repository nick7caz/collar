import 'package:flutter/material.dart';


class LocationSlider extends StatefulWidget{

  @override
  _LocationSliderState createState() => _LocationSliderState();
}
class _LocationSliderState extends State<LocationSlider>{
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      divisions: 20,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}