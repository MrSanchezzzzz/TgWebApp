import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 75),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
    _colorAnimation =
        ColorTween(begin: Colors.grey[500], end: Colors.yellow)
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTapDown: (details) {
            _controller.forward();
          },
          onTapUp: (details) {
            _controller.reverse();
          },
          onTapCancel: () {
            _controller.reverse();
          },
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.5,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    // Applies scale animation
                    scale: _scaleAnimation.value,
                    child: ColorFiltered(
                      // Applies color filter animation
                      colorFilter: ColorFilter.mode(
                        _colorAnimation.value ?? Colors.transparent,
                        BlendMode.modulate,
                      ),
                      child: child,
                    ),
                  );
                },
                child: Image.asset('lib/assets/images/Ethereum_logo.png',fit: BoxFit.fitWidth,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
