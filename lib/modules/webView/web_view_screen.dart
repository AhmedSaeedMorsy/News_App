// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
    
  String url;
  WebViewScreen(this.url, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStetes>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("NewsApp"),
              actions: [
                IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeMoodApp();
                  },
                  icon: const Icon(Icons.brightness_3_outlined),
                ),
              ],
            ),
            body: WebView(initialUrl:url),
          );
        });
  }
}
