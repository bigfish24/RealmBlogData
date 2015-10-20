Pod::Spec.new do |s|
  s.name         = "RealmSwiftBlogData"
  s.version      = "0.4"
  s.summary      = "Blog data culled from Realm.io for use in Realm tutorials."
  s.description  = <<-DESC
Data culled from Realm's blog. Includes Realm Swift models for use in importing into Realm file.
                   DESC
  s.homepage     = "https://github.com/bigfish24/RealmBlogData"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Adam Fish" => "af@realm.io" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/bigfish24/RealmBlogData.git", :tag => "v#{s.version}" }
  s.source_files  = "swift/*.{swift}"
  s.resources = ["data/*.json"]
  s.requires_arc = true
  s.dependency "RealmSwift", ">= 0.96"

end
