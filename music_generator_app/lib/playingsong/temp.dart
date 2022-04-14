import 'package:flutter/material.dart';
import 'dart:math' show pi;

class Play extends StatefulWidget {
  final bool isPlaying;

  // ignore: use_key_in_widget_constructors
  const Play({
    required this.isPlaying,
  });

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> with TickerProviderStateMixin {
  static const _kToggleDuration = Duration(milliseconds: 300);
  static const _kRotationDuration = Duration(seconds: 5);

  late bool isPlaying;

  late AnimationController _rotationController;
  late AnimationController _scaleController;
  double _rotation = 0;
  double _scale = 0.85;

  void _updateRotation() => _rotation = _rotationController.value * 2 * pi;
  void _updateScale() => _scale = (_scaleController.value * 0.2) + 0.85;

  @override
  void initState() {
    isPlaying = true;
    _rotationController =
        AnimationController(vsync: this, duration: _kRotationDuration)
          ..addListener(() => setState(_updateRotation))
          ..repeat();

    _scaleController =
        AnimationController(vsync: this, duration: _kToggleDuration)
          ..addListener(() => setState(_updateScale));

    if (isPlaying) {
      _onToggle();
    }
    super.initState();
  }

  void _onToggle() {
    if (_scaleController.isCompleted) {
      _scaleController.reverse();
    } else {
      _scaleController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 48, minHeight: 48),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (widget.isPlaying) ...[
            Blob(color: Color(0xff0092ff), scale: _scale, rotation: _rotation),
            Blob(
                color: Color(0xff4ac7b7),
                scale: _scale,
                rotation: _rotation * 2 - 30),
            Blob(
                color: Color(0xffa4a6f6),
                scale: _scale,
                rotation: _rotation * 3 - 45),
          ],
          Container(
            constraints: BoxConstraints.expand(),
            child: Icon(
              Icons.audiotrack,
              color: Colors.white,
              size: 70.0,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pink.shade400,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}

class Blob extends StatelessWidget {
  final double rotation;
  final double scale;
  final Color color;

  const Blob({required this.color, this.rotation = 0, this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(150),
              topRight: Radius.circular(240),
              bottomLeft: Radius.circular(220),
              bottomRight: Radius.circular(180),
            ),
          ),
        ),
      ),
    );
  }
}
