import 'package:flutter/material.dart';
import 'dart:math' as math;
class ExpandableFB extends StatefulWidget {
  @override
  _ExpandableFBState createState() => _ExpandableFBState();
}

class _ExpandableFBState extends State<ExpandableFB> with SingleTickerProviderStateMixin {
  
  bool isExpanded = false;
  static const double mainButtonSize = 56.0;
  static const double expandedButtonSize = 48.0;
  static const double fanRadius = 80.0;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      if (!isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      isExpanded = !isExpanded;
    });
  }

  List<Widget> _buildExpandedButtons(BuildContext context) {
    final double angle = math.pi; 

    return [
      _buildExpandedButton(context, angle),
      _buildExpandedButton(context, angle + (math.pi / 2)),
    ];
  }

  Widget _buildExpandedButton(BuildContext context, double angle) {
    final double dx = fanRadius * math.cos(angle);
    final double dy = fanRadius * math.sin(angle);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(dx * _scaleAnimation.value, dy * _scaleAnimation.value),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: FloatingActionButton(
              onPressed: () {
                
              },
              child: Icon(Icons.edit),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isExpanded) ..._buildExpandedButtons(context),
        FloatingActionButton(
          onPressed: _toggleExpansion,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: isExpanded ? Icon(Icons.close) : Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
