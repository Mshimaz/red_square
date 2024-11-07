import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0),
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  static const _squareSize = 50.0;
  String position = 'center';
  bool isMoving = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(seconds: 1),
          left: position == 'left'
              ? 0
              : position == 'right'
                  ? 550
                  : 300,
          onEnd: () {
            setState(() {
              isMoving = false;
            });
          },
          child: Container(
            width: _squareSize,
            height: _squareSize,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Row(
            children: [
              MaterialButton(
                color: position == 'right' || isMoving
                    ? Colors.grey
                    : Colors.white,
                onPressed: () {
                  if (position != 'right' || isMoving) {
                    setState(() {
                      isMoving = true;
                      position = 'right';
                    });
                  }
                },
                child: const Text('Right'),
              ),
              const SizedBox(width: 8),
              MaterialButton(
                color:
                    position == 'left' || isMoving ? Colors.grey : Colors.white,
                onPressed: () {
                  if (position != 'left' || isMoving) {
                    setState(() {
                      isMoving = true;
                      position = 'left';
                    });
                  }
                },
                child: const Text('Left'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
