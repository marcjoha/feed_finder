Extracts RSS/Atom feed links from a website.

Will both look for feeds in the <link> tags, but also throughout the website itself.

Modelled after https://alex.miller.im/posts/python-3-feedfinder-rss-detection-from-url/.

## Usage

A simple usage example:

```dart
import 'package:feed_finder/feed_finder.dart';

main() async {
  var feeds = await FeedFinder.scrape('http://www.braziltravelblog.com/');
  print(feeds);
}
```
