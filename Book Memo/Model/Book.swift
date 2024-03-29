//
//  Book.swift
//  Book Memo
//
//  Created by 仲優樹 on 2023/03/09.
// 「Lesson 6 Chapter 6.5 Realmのモデルクラス」から引用

import RealmSwift

class Book: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0

    // 本のタイトル
    @objc dynamic var title = ""
    
    // 本を読んだ日
    @objc dynamic var date = Date()
    
    // 本の感想
    @objc dynamic var review = ""
    
    // 本の画像 NSData とは？
    @objc dynamic var image: Data? = nil
    
    // 本の状態　（０が初期値）
    @objc dynamic var state = 0
    
    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }
}
