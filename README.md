# ABLoadingView

[![CI Status](https://img.shields.io/travis/andreasbagias/ABLoadingView.svg?style=flat)](https://travis-ci.org/andreasbagias/ABLoadingView)
[![Version](https://img.shields.io/cocoapods/v/ABLoadingView.svg?style=flat)](https://cocoapods.org/pods/ABLoadingView)
[![License](https://img.shields.io/cocoapods/l/ABLoadingView.svg?style=flat)](https://cocoapods.org/pods/ABLoadingView)
[![Platform](https://img.shields.io/cocoapods/p/ABLoadingView.svg?style=flat)](https://cocoapods.org/pods/ABLoadingView)

## Example

<img src="https://github.com/andreasbagias/ABLoadingView/blob/master/Example/picture4.png" width="819" height="463">


## Requirements

## Installation

ABLoadingView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ABLoadingView'
```

## How to Use

```swift
//to start the default loading view just call
LoadingView.shared.start()

//to end the default loading view just call
LoadingView.shared.stop()

//to modify the appearance call the following
LoadingView.shared.cancelationEnabled(true)
LoadingView.shared.percentageEnabled(true)
LoadingView.shared.blurEnabled(false)

//percentage is a int from 0 to 100
LoadingView.shared.updatePercentage(percentage)

//the default values are:
//cancellation = false
//percentage = false
//

```

## Author

andreasbagias, andreasbagias@gmail.com

## License

ABLoadingView is available under the MIT license. See the LICENSE file for more info.
