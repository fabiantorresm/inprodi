import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:inprodi/simple_bloc_observer.dart';

import 'package:inprodi/app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}
