import 'package:flutter/material.dart';
import 'package:hashstrix_app/API/TrendingAPI.dart';

class TrendingDetails extends StatefulWidget {
  TrendingDetails({Key? key}) : super(key: key);

  @override
  State<TrendingDetails> createState() => _TrendingDetailsState();
}

class _TrendingDetailsState extends State<TrendingDetails> {
  TrendingData trendAPI = TrendingData();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: FutureBuilder<List>(
        future: trendAPI.getTrendingBlogs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  //Create to separate ListView TrendingBlogsFeed.dart for UI
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              iconSize: 50,
                              onPressed: () => {},
                              icon: CircleAvatar(
                                radius: 80.0,
                                backgroundColor: const Color(0xFF2b90d9),
                                backgroundImage: NetworkImage(
                                  snapshot.data?[i].ProfilePicture,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data?[i].Title,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Wrap(
                                    spacing: 10.0,
                                    children: [
                                      Text(
                                        "12 min ago",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      Icon(Icons.public),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              iconSize: 30,
                              onPressed: () => {},
                              icon: const Icon(Icons.more_horiz_outlined),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data?[i].Overview,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Image(
                                  image:
                                      NetworkImage(snapshot.data?[i].Thumbnail))
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.thumb_up_alt_outlined),
                                ),
                                Text(
                                  "12",
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(Icons.message_outlined),
                                ),
                                Text(
                                  "20",
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.share_outlined),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text("No Data Found"),
            );
          }
        },
      ),
    );
  }
}
