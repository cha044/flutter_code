import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../apis_bloc/api_bloc.dart';
import '../apis_bloc/api_event_bloc.dart';
import '../apis_bloc/api_state_bloc.dart';

class CreateEmailView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imgLinkController = TextEditingController();
  final EmailBloc emailBloc;

  CreateEmailView({required this.emailBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Email'),
      ),
      body: BlocBuilder<EmailBloc, EmailState>(
        builder: (context, state) {
          if (state is EmailIsCreating) {
            return CircularProgressIndicator();
          } else if (state is EmailCreateSuccess) {
            return Text('Email created successfully: ${state.message}');
          } else if (state is EmailCreateFailure) {
            return Text('Failed to create email: ${state.error}');
          } else {
            return buildCreateForm();
          }
        },
      ),
    );
  }

  Widget buildCreateForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: imgLinkController,
            decoration: InputDecoration(labelText: 'Image Link'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final email = emailController.text;
              final description = descriptionController.text;
              final title = titleController.text;
              final imgLink = imgLinkController.text;

              emailBloc.add(CreateEmail(
                email: email,
                description: description,
                title: title,
                imgLink: imgLink,
              ));
            },
            child: Text('Create Email'),
          ),
        ],
      ),
    );
  }
}
