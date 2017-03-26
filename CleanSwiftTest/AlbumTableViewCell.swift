//
//  AlbumTableViewCell.swift
//  CleanSwiftTest
//
//  Created by anoop mohanan on 25/03/17.
//  Copyright © 2017 anoop mohanan. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbImage:UIImageView!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var artistLbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
