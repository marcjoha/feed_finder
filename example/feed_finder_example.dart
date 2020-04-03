import 'package:feed_finder/feed_finder.dart';

main() async {
  var feeds = await FeedFinder.scrape('http://www.braziltravelblog.com/');
  print(feeds);
}
