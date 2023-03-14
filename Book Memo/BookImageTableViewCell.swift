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
    
    // Bookクラスの内容をセルに表示 (Bookクラスの中に入っている画像データをセルのBookImageViewに表示)
    // if let をおそらく使う？
    func setBook(_ book: Book) {
        
        if let BookImageView.image = UIImage(data: book.image) {
            
        } else {
           fatalError()
        }
        
    }
    
}
