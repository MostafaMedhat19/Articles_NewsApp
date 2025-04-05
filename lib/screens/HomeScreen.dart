import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/articles_provider.dart';
import 'package:untitled/screens/DetailsScreen.dart';
import 'package:untitled/widgets/TextFieldCustom.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Articles")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textFieldCustom('Search', Icons.search, searchController),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ArticlesProvider>(context, listen: false)
                  .displayData(searchController.text);
            },
            child: const Text("Search"),
          ),
          Expanded(
            child: Consumer<ArticlesProvider>(
              builder: (context, provider, child) {
                var data = provider.model?.articles;
                if (data == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (data.isEmpty) {
                  return const Center(child: Text("No articles found"));
                }
                return ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final article = data?[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  Detailsscreen(index: index),));
                        data =null;
                      },
                      child: ListTile(
                        title: Text(article?['title'] ?? "No title"),
                        subtitle: Text(article?['description'] ?? "No description"),
                        leading: article?['urlImage'] != null
                            ? Image.network(article?['urlImage']!, width: 60, fit: BoxFit.cover)
                            : const Icon(Icons.image),
                      ),
                    );

                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
