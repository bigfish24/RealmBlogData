# RealmBlogData
Data culled from Realm's blog for use in Realm tutorials.

Includes a model: `BlogObject` that maps to the data in the included `blog.json` file. To load the data into your app's default Realm, call `loadBlogData` on the `BlogObject` class.

Also includes a helper function: `randomEmoji` which returns a random emoji character as an `NSString`.

This data is used in the example apps for [ABFRealmSearchViewController](https://github.com/bigfish24/ABFRealmSearchViewController) to demonstrate the search capabilities.

#### Installation
`RealmBlogData` is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

**Objective-C**
```
pod 'RealmBlogData'
```
**Swift**
```
pod 'RealmSwiftBlogData'
```

#### How To Use
**Objective-C**
```objc
#import <RealmBlogData/BlogObject.h>

// Call somewhere in your code
[BlogObject loadBlogData]
...
// Get a BlogObject
[BlogObject allObjects].first
```
**Swift**
```swift
import RealmSwiftBlogData

// Call somewhere in your code
BlogObject.loadBlogData()
...
// Get a BlogObject
try! Realm().objects(BlogObject).first
```
