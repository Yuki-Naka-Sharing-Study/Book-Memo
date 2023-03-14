//
//  BookImageTableViewCell.swift
//  Book Memo
//
//  Created by 仲優樹 on 2023/03/14.
//

import UIKit

class BookImageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var BookImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
