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
    func setBook(_ book: Book) {
        // if を使って、book.imageがnilでない時だけ画像を設定する処理を書けば良い
        if book.image != nil {
            // if を使って、 book.image の内容をアンラップした値を新しく宣言した変数に入れ、
            // if のブロックの中で、その新しく宣言した変数を使って画像を設定する処理を実施すればいい
            let displayImage = UIImage(data: book.image!)!
            BookImageView.image = displayImage
        } else {
            print("There is no image...")
        }
    }
    
}
