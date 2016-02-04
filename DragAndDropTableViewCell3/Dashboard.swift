//
//  TableViewController.swift
//  asdasd
//
//  Created by Ethan Neff on 2/3/16.
//  Copyright © 2016 Ethan Neff. All rights reserved.
//

import UIKit

class Dashboard: UITableViewController {
  // MARK: PROPERTIES
  var items : [[String: AnyObject]]
  
  // MARK: LOAD
  required init(coder aDecoder: NSCoder) {
    // init controller properties
    items = [[String: AnyObject]]()
    for var i = 0; i < 50; i++ {
      var item = [String: AnyObject]()
      item["title"] = Utils.randomString(length: Utils.randomNumber(upperLimit: 100))
      item["subtitle"] = Utils.randomString(length: Utils.randomNumber(upperLimit: 100))

      items.append(item)
    }
    
    super.init(coder: aDecoder)!
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: ERROR
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: TABLEVIEW DATASOURCE
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: Cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! Cell
    cell.title.text = String(items[indexPath.row]["title"]!)
    cell.subtitle.text = String(items[indexPath.row]["subtitle"]!)
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 46
  }
  
  // MARK: REORDER
  override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    swap(&items[sourceIndexPath.row], &items[destinationIndexPath.row])
  }
}
