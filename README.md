


# Magic

[![CI Status](https://img.shields.io/wercker/ci/wercker/docs.svg?style=flat)]()

[![Version](https://img.shields.io/badge/pod-v1.0.0-blue.svg?style=flat)]()

[![License](https://img.shields.io/badge/license-MIT-f27e40.svg?style=flat)]()

[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg?style=flat)]()

## Intro

Some useful Swift extensions.

## Requirements

Xcode 8.0+
Swift 3.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Magic into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Magic', '~> 1.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Alamofire into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Magic/Magic" ~> 1.0.0
```

Run `carthage update` to build the framework and drag the built `Magic.framework` into your Xcode project.

##Tests


## Author
 [Zeeyang](http://www.zeeyang.com)
 [broccoliii](http://broccoliii.me)

## License

Magic is available under the MIT license. See the LICENSE file for more info.

