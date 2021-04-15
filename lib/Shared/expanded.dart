import 'package:flutter/material.dart';

class ExpandableListTile extends StatelessWidget {
  const ExpandableListTile({Key key, this.title, this.expanded, this.onExpandPressed, this.child}) : super(key: key);

  final Widget title;
  final bool expanded;
  final Widget child;
  final Function onExpandPressed;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        title: title,
        onTap: onExpandPressed,
        trailing: IconButton(
          onPressed: onExpandPressed,
          // icon: Icon(Icons.expand_more),
          icon: RotatableSection(
             rotated: expanded,
             child: SizedBox(height: 30, width: 30, child: Icon(Icons.expand_more),) 
          ),
        ),
      ),
      ExpandableSection(child: child, expand: expanded,)
    ]);
  }
}


class ExpandableSection extends StatefulWidget {

  final Widget child;
  final bool expand;
  ExpandableSection({this.expand = false, this.child});

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> sizeAnimation; 
  Animation<double> opacityAnimation; 

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300),);
    sizeAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn,);
    opacityAnimation = CurvedAnimation(parent: animationController, curve: Curves.slowMiddle,);
  }

  void _runExpandCheck() {
    if(widget.expand) { animationController.forward(); }
    else { animationController.reverse(); }
  }

  @override
  void didUpdateWidget(ExpandableSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacityAnimation,
      child: SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: sizeAnimation,
        child: widget.child
      )
    );
  }
}


class RotatableSection extends StatefulWidget {

  final Widget child;
  final bool rotated;
  final double initialSpin;
  final double endingSpin;
  RotatableSection({this.rotated = false, this.child, this.initialSpin=0, this.endingSpin=0.5});

  @override
  _RotatableSectionState createState() => _RotatableSectionState();
}

class _RotatableSectionState extends State<RotatableSection> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation; 

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runCheck();
  }

  final double _oneSpin = 6.283184;

  ///Setting up the animation
  void prepareAnimations() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300), 
      lowerBound: _oneSpin * widget.initialSpin, upperBound: _oneSpin * widget.endingSpin, );
    animation = CurvedAnimation( parent: animationController, curve: Curves.linear, );
  }

  void _runCheck() {
    if(widget.rotated) { animationController.forward(); }
    else { animationController.reverse(); }
  }

  @override
  void didUpdateWidget(RotatableSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runCheck();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        child: widget.child,
        builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: animationController.value,
            child: _widget,
          );
      },
    );
  }
}