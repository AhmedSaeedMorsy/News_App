import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/componant/componant.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStetes>(
      listener: (context, states) {},
      builder: (context, state) {
        
        var list = AppCubit.get(context).search;
        var searchController = TextEditingController();

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
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  labeltext: "Search",
                  prefixicon: const Icon(Icons.search_outlined),
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  controller: searchController,
                  onChange: (value) => AppCubit.get(context).getSearch(value),
                ),
              ),
              Expanded(
                child: ConditionalBuilderRec(
                  condition: list.isNotEmpty,
                  builder: (context) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildArticleItem(list[index], context),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: list.length,
                  ),
                  fallback: (context) =>  Container(),
                
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}