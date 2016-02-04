//
//  Cell.swift
//  asdasd
//
//  Created by Ethan Neff on 2/4/16.
//  Copyright © 2016 Ethan Neff. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var subtitle: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    title.textColor = Globals.colorTitle
    subtitle.textColor = Globals.colorSubtitle
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
