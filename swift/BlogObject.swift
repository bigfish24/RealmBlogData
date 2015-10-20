//
//  BlogObject.swift
//  RealmSearchViewControllerExample
//
//  Created by Adam Fish on 10/2/15.
//  Copyright © 2015 Adam Fish. All rights reserved.
//

import RealmSwift

let emojiArray: [String] = {
    if let emojiFilePath = NSBundle(forClass: BlogObject.self).pathForResource("emoji", ofType: "json") {
        if let emojiData = NSData(contentsOfFile: emojiFilePath) {
            
            do {
                let jsonObject = try NSJSONSerialization.JSONObjectWithData(emojiData, options: NSJSONReadingOptions.MutableContainers)
                
                if let emojiArray = jsonObject as? [String] {
                    return emojiArray
                }
            } catch {
                print("Emoji JSON Error: \(error)")
            }
        }
    }
    
    print("Emoji JSON File Missing!")
    
    return [String]()
}()

public class BlogObject: Object {
    // MARK: Properties
    public dynamic var blogId: Int = 0
    public dynamic var title = ""
    public dynamic var urlString = ""
    public dynamic var date = NSDate.distantPast()
    public dynamic var content = ""
    public dynamic var imageURLString = ""
    public dynamic var emoji = ""
    
    // MARK: Generated Properties
    public var url: NSURL {
        return NSURL(string: self.urlString)!
    }
    
    public var imageURL: NSURL {
        return NSURL(string: self.imageURLString)!
    }
    
    // MARK: Property Attributes
    override public static func primaryKey() -> String? {
        return "blogId"
    }
    
    override public static func ignoredProperties() -> [String] {
        return ["url","imageURL"]
    }
    
    // MARK: Type Functions
    public static func loadBlogData() {
        if let jsonFilePath = NSBundle(forClass: BlogObject.self).pathForResource("blog", ofType: "json") {
            if let jsonData = NSData(contentsOfFile: jsonFilePath) {
                
                do {
                    let jsonObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers)
                    
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
                    
                    var index: Int = 0
                    
                    if let jsonArray = jsonObject as? [NSDictionary] {
                        
                        if let realm = try? Realm() {
                            
                            realm.beginWrite()
                            
                            for blogData in jsonArray {
                                
                                let blog = BlogObject()
                                
                                if let title = blogData["title"] as? String {
                                    blog.title = title
                                }
                                if let url = blogData["url"] as? String {
                                    blog.urlString = "http://www.realm.io\(url)"
                                }
                                if let dateString = blogData["date"] as? String {
                                    
                                    if let date = dateFormatter.dateFromString(dateString) {
                                        blog.date = date
                                    }
                                }
                                if let content = blogData["content"] as? String {
                                    blog.content = content
                                }
                                if let imageURLString = blogData["image"] as? String {
                                    blog.imageURLString = imageURLString
                                }
                                blog.emoji = self.randomEmoji()
                                
                                blog.blogId = index
                                
                                realm.add(blog, update: true)
                                
                                index += 1
                            }
                            
                            try! realm.commitWrite()
                        }
                    }
                } catch {
                    print("Blog JSON Error: \(error)")
                }
            }
        }
    }
    
    public static func randomEmoji() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(emojiArray.count)))
        
        return emojiArray[randomIndex]
    }
}
