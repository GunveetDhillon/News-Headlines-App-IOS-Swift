//
//  MyTableViewCell.swift
//  News Headlines App
//
//  Created by Gunveet Singh Dhillon on 2023-08-13.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var myImageView: UIImageView!
    
    @IBOutlet var myLabel1: UILabel!
    
    @IBOutlet var myLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

        override func prepareForReuse() {
            super.prepareForReuse()
            myImageView.image = nil
        }

}
