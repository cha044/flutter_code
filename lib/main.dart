import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/apis_bloc/api_bloc.dart';
import 'package:fluttertest/widgets/home_widget.dart';

import 'repository/apis_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EmailRepo emailRepo = EmailRepo();

    return BlocProvider(
      create: (context) => EmailBloc(emailRepo: emailRepo),
      child: MaterialApp(
        title: 'Email App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
