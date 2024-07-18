import 'package:asd/src/core/di/get_it_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextExt on BuildContext {
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      read<GetItProvider>().instance<T>(
        param1: param1,
        param2: param2,
        instanceName: instanceName,
      );
}
