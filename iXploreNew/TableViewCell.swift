//
//  TableViewCell.swift
//  iXploreNew
//
//  Created by Salomon serfati on 6/8/16.
//  Copyright © 2016 Salomon Serfati. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelTableCell: UILabel!
    @IBOutlet weak var imageTableCell: UIImageView!
    @IBOutlet weak var emoji1: UIButton!
    @IBOutlet weak var emoji2: UIButton!
    @IBOutlet weak var emoji3: UIButton!
    @IBOutlet weak var emoji4: UIButton!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func emoji1Tapped(sender: UIButton) {
        let image = UIImage(named: "Like.png") as UIImage!
        self.emoji1.setImage(image, forState: .Normal)
        
    }
    
    @IBAction func emoji2Tapped(sender: UIButton) {
        let image = UIImage(named: "Like.png") as UIImage!
        self.emoji1.setImage(image, forState: .Normal)
        self.emoji2.setImage(image, forState: .Normal)
    }
    
    @IBAction func emoji3Tapped(sender: UIButton) {
        let image = UIImage(named: "Like.png") as UIImage!
        self.emoji1.setImage(image, forState: .Normal)
        self.emoji2.setImage(image, forState: .Normal)
        self.emoji3.setImage(image, forState: .Normal)
    }
    @IBAction func emoji4Tapped(sender: AnyObject) {
        let image = UIImage(named: "Like.png") as UIImage!
        self.emoji1.setImage(image, forState: .Normal)
        self.emoji2.setImage(image, forState: .Normal)
        self.emoji3.setImage(image, forState: .Normal)
        self.emoji4.setImage(image, forState: .Normal)
    }
}
