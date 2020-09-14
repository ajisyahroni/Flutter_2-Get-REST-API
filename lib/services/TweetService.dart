import 'dart:convert';

import '../models/Tweet.dart';
import 'package:http/http.dart' as http;

class TweetService {
  static const API_URL =
      'https://alfabank-blog.herokuapp.com/api/v1/tweets/all';
  Future<List<Tweet>> getTweetList() {
    return http.get(API_URL).then((response) {
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final tweets = <Tweet>[];

        final tweetDataResponse = jsonData['data'];
        for (var singleTweet in tweetDataResponse) {
          final tweet = Tweet(
              id: singleTweet['id'],
              tweet: singleTweet['tweet'],
              username: singleTweet['user']['username'],
              avatarUser: singleTweet['user']['avatar'],
              createdAt: DateTime.parse(singleTweet['created_at']));
          tweets.add(tweet);
        }
        return tweets;
      }
    });
    // return [
    //   new Tweet(tweet: 'main lur', id: 1, createdAt: DateTime.now()),
    //   new Tweet(tweet: 'game lur', id: 2, createdAt: DateTime.now()),
    //   new Tweet(tweet: 'coding lur', id: 3, createdAt: DateTime.now()),
    //   new Tweet(tweet: 'podcast lur', id: 3, createdAt: DateTime.now()),
    //   new Tweet(tweet: 'gaminglagi lur', id: 3, createdAt: DateTime.now())
    // ];
  }
}
