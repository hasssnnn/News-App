import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';

import '../Services/news_services.dart';
import 'news_view_list.dart';

class NewViewListBuilder extends StatefulWidget {
  const NewViewListBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewViewListBuilder> createState() => _NewViewListBuilderState();
}

class _NewViewListBuilderState extends State<NewViewListBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getTopHeadLines(category: widget.category);
  }  // for testing purposes only, to avoid hitting the API too much!
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return NewsViewList(articles: snapshot.data!);
        } else if (snapshot.hasError) {
         return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Oops, there was an error!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }else{
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }
      ),
    );
  }
}
    // return isLoading
    //     ? const SliverToBoxAdapter(
    //         child: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       )
    //     : isError
    //         ? const SliverToBoxAdapter(
    //             child: Center(
    //               child: Text(
    //                 'Oops, there was an error!',
    //                 style: TextStyle(
    //                   fontSize: 25,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ),
    //           )
    //         : articles.isNotEmpty
    //             ? NewsViewList(articles: articles)
    //             : const SliverToBoxAdapter(
    //                 child: Center(
    //                   child: Text(
    //                     'No news articles available.',
    //                     style: TextStyle(
    //                       fontSize: 25,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //               );



// class NewViewListBuilder extends StatefulWidget {
//   const NewViewListBuilder({
//     super.key,
//   });

//   @override
//   State<NewViewListBuilder> createState() => _NewViewListBuilderState();
// }

// class _NewViewListBuilderState extends State<NewViewListBuilder> {
//   List<ArticleModel> articles = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     getNews();
//isLoading = false;
//   }

//   Future<void> getNews() async {
//     articles = await NewsServices(Dio()).getNews();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//     ? const SliverToBoxAdapter(
//         child: Center(
//           child: CircularProgressIndicator(),
//         ),
//       )
//     : articles.isNotEmpty
//         ? NewsViewList(articles: articles)
//         : const SliverToBoxAdapter(
//             child: Center(
//               child: Text(
//                 'Oops, there was an error!',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           );

    // return isLoading
    //     ? const SliverToBoxAdapter(
    //         child: Center(
    //           child: CircularProgressIndicator()),
    //       )
    //     : articles.isNotEmpty? NewsViewList(articles: articles)
    //         : const SliverToBoxAdapter(
    //             child: Center(
    //                 child: Text(
    //               'oops, there was an error!',
    //               style: TextStyle(
    //                 fontSize: 25,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             )),
    //           );
  
