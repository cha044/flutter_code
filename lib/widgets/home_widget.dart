import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/apis_bloc/api_bloc.dart';
import 'package:fluttertest/views/create_email.dart';
import 'package:fluttertest/views/list_emails.dart';
import 'package:fluttertest/views/edit_email.dart';
import 'package:fluttertest/views/delete_email.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailBloc = BlocProvider.of<EmailBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreateEmailView(
                    emailBloc: emailBloc,
                  ),
                ));
              },
              child: Text('Create Email'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListEmailsView(),
                ));
              },
              child: Text('List Emails'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditEmailView(
                    emailId: 495,
                    emailBloc: emailBloc,
                  ),
                ));
              },
              child: Text('Edit Email'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DeleteEmailView(
                    emailId: 495,
                    emailBloc: emailBloc,
                  ),
                ));
              },
              child: Text('Delete Email'),
            ),
          ],
        ),
      ),
    );
  }
}
