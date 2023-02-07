import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;

class ResumeBuilder extends StatefulWidget {
  @override
  State<ResumeBuilder> createState() => _ResumeBuilderState();
}

class _ResumeBuilderState extends State<ResumeBuilder> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name;
  late String _address;
  late String _email;
  late String _phone;
  late String _education;
  late String _skills;
  late String _workExperience;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Builder'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) => _address = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                },
                onSaved: (value) => _phone = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Education'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your education';
                  }
                  return null;
                },
                onSaved: (value) => _education = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Education'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your education';
                  }
                  return null;
                },
                onSaved: (value) => _education = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Skills'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your skills';
                  }
                  return null;
                },
                onSaved: (value) => _skills = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Work Experience'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your work experience';
                  }
                  return null;
                },
                onSaved: (value) => _workExperience = value!,
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    generatePdf();
                  }
                },
                child: Text('Generate PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(_name, style: pw.TextStyle(fontSize: 20)),
              pw.Text(_address),
              pw.Text(_email),
              pw.Text(_phone),
              pw.Text(_education),
              pw.Text(_skills),
              pw.Text(_workExperience),
            ],
          );
        },
      ),
    );

    final pdfBytes = await pdf.save();
    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final link = html.AnchorElement()..href = url;
    link.download = 'resume.pdf';
    link.click();
    html.Url.revokeObjectUrl(url);
  }

}
