// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:news_app/modules/webView/web_view_screen.dart';

Widget buildArticleItem(article, context) {
  return InkWell(
    onTap: () => navigateTo(
      context,
      WebViewScreen(
        article['url'],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  '${article["urlToImage"]}',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article['title']}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    "${article['publishedAt']}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget myDivider() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    ),
  );
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget defaultFormField({
  required String labeltext,
  required Icon prefixicon,
  required var validate,
  var onChange,
  required TextEditingController controller,
}) =>
    TextFormField(
      cursorColor: Colors.grey,
      
      onChanged: onChange,
      validator: validate,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        color: Colors.grey,
      ),
      
      decoration: InputDecoration(
        labelText: labeltext,
        prefixIcon: prefixicon,

        prefixStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
