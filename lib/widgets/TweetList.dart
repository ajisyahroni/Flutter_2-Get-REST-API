import 'package:flutter/material.dart';
import '../services/TweetService.dart';
import '../models/Tweet.dart';

class TweetList extends StatefulWidget {
  @override
  _TweetListState createState() => _TweetListState();
}

class _TweetListState extends State<TweetList> {
  List<Tweet> tweetList = [];
  @override
  void initState() {
    _fetchTweet();
    super.initState();
  }

  _fetchTweet() async {
    tweetList = await TweetService().getTweetList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tweets Today'),
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (_, index) {
              return Card(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 55.0,
                      height: 55.0,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(tweetList[index].avatarUser),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tweetList[index].tweet,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            Text(
                              '@' + tweetList[index].username + '  ',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              tweetList[index].createdAt.toLocal().toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ));
            },
            separatorBuilder: (_, index) {
              return Divider(
                height: 1,
                color: Colors.black,
              );
            },
            itemCount: tweetList.length),
      ),
    );
  }
}
