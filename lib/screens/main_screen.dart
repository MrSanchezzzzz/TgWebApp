import 'package:flutter/material.dart';
import 'package:reown_appkit/reown_appkit.dart';

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

  late final ReownAppKitModal _appKitModal;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 75),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.grey[500], end: Colors.yellow)
        .animate(_controller);

    _appKitModal = ReownAppKitModal(
      context: context,
      projectId: '7ed383a634d64911c9826e81534f4849',
      metadata: const PairingMetadata(
        name: 'Example App',
        description: 'Example app description',
        url: 'https://example.com/',
        icons: ['https://example.com/logo.png'],
        redirect: Redirect(
          native: 'exampleapp://',
          universal: 'https://reown.com/exampleapp',
        ),
      ),
    );

    super.initState();
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
          onLongPress: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
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
                      child: Image.asset(
                        'lib/assets/images/Ethereum_logo.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        _appKitModal.init();
                        _appKitModal.onModalConnect.subscribe((args) {
                          print(_appKitModal.selectedChain);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Success!\nPublic key:${_appKitModal.session?.peer?.publicKey}')));
                        });
                        _appKitModal.openModalView();
                      },
                      child: Text('Connect')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
