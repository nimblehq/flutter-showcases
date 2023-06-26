import 'package:flutter/material.dart';

class LoadingContent extends StatelessWidget {
  final bool empty;
  final Widget emptyContent;
  final bool loading;
  final RefreshCallback onRefresh;
  final Widget child;

  const LoadingContent({
    Key? key,
    required this.empty,
    required this.emptyContent,
    required this.loading,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (empty) {
      return emptyContent;
    } else {
      return RefreshIndicator(child: child, onRefresh: onRefresh);
    }
  }
}
