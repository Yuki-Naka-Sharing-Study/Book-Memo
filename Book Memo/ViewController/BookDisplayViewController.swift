//
//  BookDisplayViewController.swift
//  Book Memo
//
//  Created by 仲優樹 on 2023/03/25.
//

import UIKit
import RealmSwift

class BookDisplayViewController: UIViewController, UITableViewDelegate {
    
    private let realm = try! Realm()
    var book: Book!
    
    @IBOutlet private weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookReviewLabel: UILabel!
    
    @IBAction func Close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteBookData(_ sender: Any) {
        // データベースから削除する
        try! realm.write {
            self.realm.delete(self.book)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBook(book)
    }
    // BookImageTableViewCell から参考にしたコード
    func setBook(_ book: Book) {
        
        if book.image != nil {
            let imageData = UIImage(data: book.image!)!
            bookImageView.image = imageData
        } else {
            print("There is no image...")
        }
        
        // outlet接続をしたLabelに本のタイトルを表示する処理
        self.bookTitleLabel.text = "\(book.title)"
        self.bookReviewLabel.text = "\(book.review)"
        
    }
    
}
