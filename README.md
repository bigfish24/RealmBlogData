# RealmBlogData
Data culled from Realm's blog for use in Realm tutorials.

Includes a model: `BlogObject` that maps to the data in the included `blog.json` file. To load the data into your app's default Realm, call `loadBlogData` on the `BlogObject` class.

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
// Call somewhere in your code
[BlogObject loadBlogData]
...
// Get a BlogObject
[BlogObject allObjects].first
```
**Swift**
```swift
// Call somewhere in your code
BlogObject.loadBlogData()
...
// Get a BlogObject
try! Realm().objects(BlogObject).first
```
