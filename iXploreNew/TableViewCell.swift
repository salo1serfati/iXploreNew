//
//  TableViewCell.swift
//  iXploreNew
//
//  Created by Salomon serfati on 6/8/16.
//  Copyright © 2016 Salomon Serfati. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var labelTableCell: UILabel!
    @IBOutlet weak var imageTableCell: UIImageView!
   
   
    override func awakeFromNib() {
        super.awakeFromNib()
//        imageTableCell = customImageView
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
