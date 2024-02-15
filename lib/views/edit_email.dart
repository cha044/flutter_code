import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../apis_bloc/api_bloc.dart';
import '../apis_bloc/api_event_bloc.dart';
import '../apis_bloc/api_state_bloc.dart';

class EditEmailView extends StatelessWidget {
  final int emailId;
  final EmailBloc emailBloc; // Add this field

  EditEmailView(
      {required this.emailId,
      required this.emailBloc}); // Update the constructor

  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imgLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Email'),
      ),
      body: BlocBuilder<EmailBloc, EmailState>(
        builder: (context, state) {
          if (state is EmailIsEditing) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is EmailEditSuccess) {
            return Center(
              child: Text('Email edited successfully'),
            );
          } else if (state is EmailEditFailure) {
            return Center(
              child: Text('Failed to edit email: ${state.error}'),
            );
          } else {
            return buildEditForm();
          }
        },
      ),
    );
  }

  Widget buildEditForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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

              emailBloc.add(EditEmail(
                email: email,
                id: emailId,
                description: description,
                title: title,
                imgLink: imgLink,
              ));
            },
            child: Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}
