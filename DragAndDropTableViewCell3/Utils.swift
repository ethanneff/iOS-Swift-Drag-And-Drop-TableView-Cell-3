//
//  Utils.swift
//  asdasd
//
//  Created by Ethan Neff on 2/4/16.
//  Copyright © 2016 Ethan Neff. All rights reserved.
//

import UIKit

class Utils {
  
  // multiple story board navigation
  class func navToStoryboard(currentController currentController:UIViewController, storyboard:String) {
    let storyboard = UIStoryboard(name: storyboard, bundle: nil)
    let controller = storyboard.instantiateInitialViewController()! as UIViewController
    currentController.presentViewController(controller, animated: true, completion: nil)
  }
  
  // changing the status bar color
  static func setStatusBarBackgroundColor(color: UIColor) {
    guard let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView else {
      return
    }
    statusBar.backgroundColor = color
  }
  
  // background thread delay
  static func delay(delay:Double, closure:()->()) {
    dispatch_after(
      dispatch_time(
        DISPATCH_TIME_NOW,
        Int64(delay * Double(NSEC_PER_SEC))
      ),
      dispatch_get_main_queue(), closure)
  }
  
  // logging
  static func log(logMessage: String?=nil, functionName: String = __FUNCTION__) {
    let currentDateTime = Int64(NSDate().timeIntervalSince1970*1000)
    print("[\(currentDateTime)] [\(functionName)] \(logMessage)")
  }
  
  // random
  static func randomString(length length: Int) -> String {
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let randomString : NSMutableString = NSMutableString(capacity: length)
    
    for (var i=0; i < length; i++) {
      let len = UInt32(letters.length)
      let rand = arc4random_uniform(len)
      randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
    }
    
    return String(randomString)
  }
  
  static func randomNumber(upperLimit upperLimit: UInt32) -> Int {
    return Int(arc4random_uniform(upperLimit))
  }
}


// add hex to UIColor function to UIColor
extension UIColor {
  convenience init(hex: String) {
    let hex = hex.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
    var int = UInt32()
    NSScanner(string: hex).scanHexInt(&int)
    let a, r, g, b: UInt32
    switch hex.characters.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }
}

// add guid: String property to UITableViewCell
extension UITableViewCell {
  private struct AssociatedKeys {
    static var guid:String?
  }
  
  var guid: String? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.guid) as? String
    }
    set {
      if let newValue = newValue {
        objc_setAssociatedObject(self, &AssociatedKeys.guid, newValue as String?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
    }
  }
}

// basic string functions
extension String {
  var isBlank: Bool {
    get {
      let trimmed = stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
      return trimmed.isEmpty
    }
  }
  var isEmail: Bool {
    do {
      let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .CaseInsensitive)
      return regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
    } catch {
      return false
    }
  }
  var isPhoneNumber: Bool {
    let charcter  = NSCharacterSet(charactersInString: "+0123456789").invertedSet
    var filtered:NSString!
    let inputString:NSArray = self.componentsSeparatedByCharactersInSet(charcter)
    filtered = inputString.componentsJoinedByString("")
    return  self == filtered
  }
  var isPassword: Bool {
    do {
      // 8+, 1 num, 1 letter, 1 cap, 1 lower
      let regex = try NSRegularExpression(pattern: "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$", options: .CaseInsensitive)
      return regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
    } catch {
      return false
    }
  }
  var trim: String {
    return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
  }
  var length: Int {
    return self.characters.count
  }
}