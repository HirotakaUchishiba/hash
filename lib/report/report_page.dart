import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hash/report/report_model.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddReportModel>(
        create: (_) => AddReportModel(),
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          '問題を報告する',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
      ),
      body: Consumer<AddReportModel>(builder: (context, model, child) {
        return Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text('問題のあるユーザーの名前を記入してください'),
            TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '該当ユーザー名',
              ),
              onChanged: (text) {
                model.reportedUserName = text;
              },
            ),
            const SizedBox(height: 50),
            const Text('どのような問題があったか具体的に内容を入力してください'),
            TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '報告内容',
              ),
              onChanged: (text) {
                model.reportContents = text;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () async {
                      try {
                        await model.addReport();
                        Navigator.of(context).pop(true);
                      } catch (e) {
                        final snackBar = SnackBar(
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text(
                      '送信する',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            )
          ],
        ));
      }),
    ),);
  }
}
