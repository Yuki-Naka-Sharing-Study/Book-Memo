//
//  BookDisplayViewController.swift
//  Book Memo
//
//  Created by 仲優樹 on 2023/03/25.
//

import UIKit

class BookDisplayViewController: UIViewController {
    
    
    @IBAction func backBookManagement(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func removeBookData(_ sender: Any) {
        
    }
    
    @IBOutlet private weak var bookImageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // // imageViewに画像を渡す
    // bookImageView.image = image

}
