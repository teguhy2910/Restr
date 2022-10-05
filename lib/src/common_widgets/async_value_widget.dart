import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/common_widgets/common_widgets.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/exceptions/network_exceptions.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({Key? key, required this.value, required this.data})
      : super(key: key);

  final AsyncValue<T> value;

  final Widget Function(T data) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const LottieWidget(assets: Resources.lottieLoading),
      error: (e, __) => LottieWidget(
          assets: Resources.lottieError,
          description: NetworkExceptions.getErrorMessage(
            e as NetworkExceptions,
          )),
    );
  }
}
