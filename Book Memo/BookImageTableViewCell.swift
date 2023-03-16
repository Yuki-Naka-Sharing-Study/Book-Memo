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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setBook(_ book: Book) {
        
        if book.image != nil {
            let imageData = UIImage(data: book.image!)!
            BookImageView.image = imageData
        } else {
            print("There is no image...")
        }
        
    }
    
}
