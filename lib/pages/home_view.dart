import 'package:flutter/material.dart';
import 'package:news/widgets/category_cards_list.dart';
import '../widgets/news_list_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'News',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            'Hub',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          )
        ]),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryCardsList()),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            NewViewListBuilder(category: 'general')
          ],
        ),
        // child: Column(
        //   children: [
        //     CategoryCardsList(),
        //     SizedBox(height: 32),
        //     Expanded(child: NewsViewList()),
        //   ],
        // ),
      ),
    );
  }
}
