//
//  BookImageTableViewCell.swift
//  Book Memo
//
//  Created by 仲優樹 on 2023/03/21.
//

import UIKit

class BookImageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setBook(_ book: Book) {
        
        if book.image != nil {
            let imageData = UIImage(data: book.image!)!
            bookImageView.image = imageData
        } else {
            print("There is no image...")
        }
        
        // outlet接続をしたLabelに本のタイトルを表示する処理
        self.bookTitleLabel.text = "\(book.title)"
        
    }
}
