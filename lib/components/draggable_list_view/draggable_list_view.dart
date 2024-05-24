import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DraggableListView extends StatefulWidget {
  DraggableListView({
    Key? key,
    required List<Widget> children,
    required this.onReorder,
    this.padding,
    this.scrollController,
  })  : assert(
          children.every((Widget w) => w.key != null),
          'All children of this widget must have a key.',
        ),
        itemBuilder = ((BuildContext context, int index) => children[index]),
        itemCount = children.length,
        super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ReorderCallback onReorder;
  final EdgeInsets? padding;
  final ScrollController? scrollController;

  @override
  State<DraggableListView> createState() => _DraggableListViewState();
}

class _DraggableListViewState extends State<DraggableListView> {
  Widget _wrapWithSemantics(Widget child, int index) {
    void reorder(int startIndex, int endIndex) {
      if (startIndex != endIndex) {
        widget.onReorder(startIndex, endIndex);
      }
    }

    final Map<CustomSemanticsAction, VoidCallback> semanticsActions =
        <CustomSemanticsAction, VoidCallback>{};

    void moveToStart() => reorder(index, 0);
    void moveToEnd() => reorder(index, widget.itemCount);
    void moveBefore() => reorder(index, index - 1);
    void moveAfter() => reorder(index, index + 2);

    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    if (index > 0) {
      semanticsActions[
              CustomSemanticsAction(label: localizations.reorderItemToStart)] =
          moveToStart;
      String reorderItemBefore = localizations.reorderItemUp;
      semanticsActions[CustomSemanticsAction(label: reorderItemBefore)] =
          moveBefore;
    }

    if (index < widget.itemCount - 1) {
      String reorderItemAfter = localizations.reorderItemDown;
      semanticsActions[CustomSemanticsAction(label: reorderItemAfter)] =
          moveAfter;
      semanticsActions[
              CustomSemanticsAction(label: localizations.reorderItemToEnd)] =
          moveToEnd;
    }

    return MergeSemantics(
      child: Semantics(
        customSemanticsActions: semanticsActions,
        child: child,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final Widget item = widget.itemBuilder(context, index);
    final Widget itemWithSemantics = _wrapWithSemantics(item, index);
    final Key itemGlobalKey = DraggableListViewChildGlobalKey(item.key!, this);

    return Row(
      key: itemGlobalKey,
      children: [
        Expanded(child: itemWithSemantics),
        ReorderableDragStartListener(
          index: index,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Icon(
              Icons.drag_handle,
              size: 30.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          child: child,
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = widget.padding ?? EdgeInsets.zero;

    return CustomScrollView(
      controller: widget.scrollController,
      slivers: <Widget>[
        SliverPadding(
          padding: padding,
          sliver: SliverReorderableList(
            itemBuilder: _itemBuilder,
            itemCount: widget.itemCount,
            onReorder: widget.onReorder,
            proxyDecorator: _proxyDecorator,
          ),
        ),
      ],
    );
  }
}

@optionalTypeArgs
class DraggableListViewChildGlobalKey extends GlobalObjectKey {
  const DraggableListViewChildGlobalKey(this.subKey, this.state)
      : super(subKey);

  final Key subKey;
  final State state;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is DraggableListViewChildGlobalKey &&
        other.subKey == subKey &&
        other.state == state;
  }

  @override
  int get hashCode => hashValues(subKey, state);
}
