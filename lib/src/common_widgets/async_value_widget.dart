// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:restr/src/common_widgets/common_widgets.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/exceptions/network_exceptions.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
    this.loading,
    this.error,
  }) : super(key: key);

  final AsyncValue<T> value;

  final Widget Function(T data) data;

  final Widget Function()? loading;

  final Widget Function(Object error, StackTrace stacktrace)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading:
          loading ?? () => const LottieWidget(assets: Resources.lottieLoading),
      error: error ??
          (e, __) {
            return LottieWidget(
              assets: Resources.lottieError,
              description: NetworkExceptions.getErrorMessage(
                e as NetworkExceptions,
              ),
            );
          },
    );
  }
}
