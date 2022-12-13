import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:gg_viability/ui/common/error.widget.dart';

typedef FutureProducer<T> = Future<T> Function();

class FutureWrapperWidget<T> extends StatefulWidget {
  final FutureProducer<T> future;
  final AsyncWidgetBuilder<T> builder;

  FutureWrapperWidget({required this.future, required this.builder});

  @override
  State<StatefulWidget> createState() {
    return _FutureWrapperWidgetState<T>();
  }
}

class _FutureWrapperWidgetState<T> extends State<FutureWrapperWidget<T>> {
  final _memoizer = AsyncMemoizer<T>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _memoizer.runOnce(() => widget.future()),
      builder: (context, AsyncSnapshot<T> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
          default:
            if (snapshot.hasError) {
              return CIATErrorWidget(
                  snapshot.error.toString(), _retryFuture());
            }
            return widget.builder(context, snapshot);
        }
      },
    );
  }

  Function _retryFuture() {
    return () {
      setState(() {});
    };
  }
}
