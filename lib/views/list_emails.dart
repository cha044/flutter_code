import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../apis_bloc/api_bloc.dart';
import '../apis_bloc/api_state_bloc.dart';
import '../models/email_model.dart';

class ListEmailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailBloc = BlocProvider.of<EmailBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Emails'),
      ),
      body: BlocBuilder<EmailBloc, EmailState>(
        builder: (context, state) {
          if (state is EmailIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetEmailsListSuccess) {
            return buildEmailsList(state.emails.cast<EmailModel>());
          } else if (state is GetEmailsFailure) {
            return Center(
              child: Text('Failed to fetch emails'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildEmailsList(List<EmailModel> emails) {
    return ListView.builder(
      itemCount: emails.length,
      itemBuilder: (context, index) {
        final email = emails[index];

        return ListTile(
          title: Text(email.email),
          subtitle: Text(email.description),
        );
      },
    );
  }
}
