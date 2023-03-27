//
//  BookManagementViewController.swift
//  Book Memo
//
//  Created by 仲優樹 on 2023/03/09.
// 「参考にすべきカリキュラム」はおそらく「Lesson 8 Chapter 9 タイムライン画面」

import UIKit
import RealmSwift

class BookManagementViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let realm = try! Realm()
    private var bookArray = try! Realm().objects(Book.self).sorted(byKeyPath: "date", ascending: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // カスタムセルを登録する
        let nib = UINib(nibName: "BookImageTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BookImageTableViewCell")
        setupView()
    }
    
    // 入力画面から戻ってきた時に TableView を更新させる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func setupView() {
        tableView.fillerRowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BookManagementViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Cellに値を設定する
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookImageTableViewCell", for: indexPath) as! BookImageTableViewCell
        cell.setBook(bookArray[indexPath.row])
        
        return cell
    }
    
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cellSegue",sender: nil)
    }
    
    // セルが削除が可能なことを伝えるメソッド
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle { .delete }
    
    // Delete ボタンが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // データベースから削除する
            try! realm.write {
                self.realm.delete(self.bookArray[indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        }
        
    }
    
}

