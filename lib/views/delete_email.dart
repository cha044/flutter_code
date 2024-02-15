import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../apis_bloc/api_bloc.dart';
import '../apis_bloc/api_event_bloc.dart';
import '../apis_bloc/api_state_bloc.dart';

class DeleteEmailView extends StatelessWidget {
  final int emailId;

  DeleteEmailView({required this.emailId});

  @override
  Widget build(BuildContext context) {
    final emailBloc = BlocProvider.of<EmailBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Email'),
      ),
      body: BlocBuilder<EmailBloc, EmailState>(
        builder: (context, state) {
          if (state is EmailIsDeleting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is EmailDeleteSuccess) {
            return Center(
              child: Text('Email deleted successfully'),
            );
          } else if (state is EmailDeleteFailure) {
            return Center(
              child: Text('Failed to delete email: ${state.error}'),
            );
          } else {
            return buildDeleteConfirmation();
          }
        },
      ),
    );
  }

  Widget buildDeleteConfirmation() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Are you sure you want to delete this email?'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              emailBloc.add(DeleteEmail(
                  id: emailId,
                  description: '',
                  email: '',
                  title: '',
                  imgLink: ''));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            child: Text('Delete Email'),
          ),
        ],
      ),
    );
  }
}
