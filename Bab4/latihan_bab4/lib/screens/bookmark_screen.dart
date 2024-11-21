import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  final List<Map<String, String>> bookmarkedNews;

  BookmarkScreen({required this.bookmarkedNews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmarked News',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1877F2),
      ),
      body: bookmarkedNews.isEmpty
          ? Center(
              child: Text(
                'No bookmarks yet',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedNews.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Text(
                        bookmarkedNews[index]['title']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        bookmarkedNews[index]['author']!,
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // Navigate to detail page if needed
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
