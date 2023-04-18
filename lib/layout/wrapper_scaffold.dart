import 'package:flutter/material.dart';


class WrapperStatefullPage extends StatefulWidget {
  final Widget child;
  final VoidCallback? dispose;
  final VoidCallback? initState;

  const WrapperStatefullPage({required this.child, super.key, this.dispose, this.initState});

  @override
  State<WrapperStatefullPage> createState() => _WrapperStatefullPageState();
}

class _WrapperStatefullPageState extends State<WrapperStatefullPage> {
  @override
  void initState() {
    super.initState();
    widget.initState?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          widget.child,
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.dispose?.call();
    super.dispose();
  }
}
