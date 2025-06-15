import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/articles_provider.dart';

class Detailsscreen extends StatelessWidget {
  final int index;

  Detailsscreen({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final article = Provider.of<ArticlesProvider>(context, listen: false)
        .model
        ?.articles[index];

    if (article == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Article Details')),
        body: const Center(child: Text('Article not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Article Details"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: article['urlImage'] != null
                  ? Image.network(
                article['urlImage'],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 80),
              )
                  : const Icon(Icons.image, size: 80),
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              article['title'] ?? "No Title Available",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              article['description'] ?? "No description available.",
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Optional published date or author
            if (article['author'] != null)
              Text(
                "By ${article['author']}",
                style: TextStyle(color: Colors.grey[700]),
              ),
            if (article['publishedAt'] != null)
              Text(
                "Published: ${article['publishedAt']}",
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}
