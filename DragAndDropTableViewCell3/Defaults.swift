//
//  Globals.swift
//  asdasd
//
//  Created by Ethan Neff on 2/4/16.
//  Copyright © 2016 Ethan Neff. All rights reserved.
//

import UIKit

// global properties
struct Globals {
  static let colorBlue = UIColor(hex:"#3498db")
  static let colorWhite1 = UIColor(hex: "#ffffff")
  static let colorWhite2 = UIColor(hex: "#fafafa")
  static let colorWhite3 = UIColor(hex: "#f5f5f5")
  static let colorWhite4 = UIColor(hex: "#e0e0e0")
  static let colorBlack1 = UIColor(hex: "#000000")
  static let colorBlack2 = UIColor(hex: "#212121")
  static let colorBlack3 = UIColor(hex: "#303030")
  static let colorBlack4 = UIColor(hex: "#424242")
  static let colorGrey1 = UIColor(hex: "#212121")
  static let colorGrey2 = UIColor(hex: "#757575")
  
  static let fontText1 = UIFont.systemFontOfSize(24, weight: UIFontWeightRegular)
  static let fontText2 = UIFont.systemFontOfSize(20, weight: UIFontWeightBold)
  static let fontText3 = UIFont.systemFontOfSize(18, weight: UIFontWeightRegular)
  static let fontText4 = UIFont.systemFontOfSize(18, weight: UIFontWeightBold)
  static let fontText5 = UIFont.systemFontOfSize(18, weight: UIFontWeightRegular)
  static let colorText1 = colorBlue
  static let colorText2 = colorGrey1
  static let colorText3 = colorGrey1
  static let colorText4 = colorGrey2
  static let colorText5 = colorGrey2
  
    static var colorButton = UIColor(hex:"#3498db")
    static var colorBackground = UIColor(hex: "#ffffff")
    static var colorBorder = UIColor(hex: "#e0e0e0")
    static var colorTitle =  UIColor(hex: "#212121")
    static var colorSubtitle = UIColor(hex: "#757575")

//  static let colorButton = UIColor(hex:"#CB6724")
//  static let colorBackground = UIColor(hex: "#212121")
//  static let colorBorder = UIColor(hex: "#424242")
//  static let colorTitle =  UIColor(hex: "#fafafa")
//  static let colorSubtitle = UIColor(hex: "#757575")
//    navigationBar.barStyle = .BlackTranslucent
  
}


extension UINavigationController {
  // load
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    // color
    navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    navigationBar.backgroundColor = Globals.colorBackground
    navigationBar.tintColor = Globals.colorTitle
    navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Globals.colorTitle]
    Utils.setStatusBarBackgroundColor(Globals.colorBackground)
  }
}

extension UITableViewController {
  // load
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    // color
    tableView.backgroundColor = Globals.colorBorder
    
    // borders
    tableView.contentInset = UIEdgeInsetsZero
    tableView.separatorInset = UIEdgeInsetsZero
    tableView.scrollIndicatorInsets = UIEdgeInsetsZero
    tableView.layoutMargins = UIEdgeInsetsZero
    
    // refresh
    refreshControl = UIRefreshControl()
    refreshControl!.attributedTitle = NSAttributedString(string: "Refresh")
    refreshControl!.addTarget(self, action: "startRefresh:", forControlEvents: UIControlEvents.ValueChanged)
    tableView.addSubview(refreshControl!)
    edgesForExtendedLayout = .None
    
    // custom cell
    let nib = UINib(nibName: "Cell", bundle: nil)
    tableView.registerNib(nib, forCellReuseIdentifier: "cell")
  }
  
  // refresh
  func startRefresh(sender:AnyObject) {}
  
  func stopRefresh(sender:AnyObject) {
    self.refreshControl!.endRefreshing()
  }
}

extension UITableViewCell {
  override public func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = Globals.colorBackground
    separatorInset = UIEdgeInsetsZero
    layoutMargins = UIEdgeInsetsZero
  }
}

