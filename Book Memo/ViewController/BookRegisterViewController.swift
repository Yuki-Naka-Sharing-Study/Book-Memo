//
//  BookRegisterViewController.swift
//  Book Memo
//
//  Created by 仲優樹 on 2023/03/09.
//

import UIKit
import RealmSwift
import CLImageEditor

class BookRegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLImageEditorDelegate {
    
    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var bookReviewTextView: UITextView!
    @IBOutlet weak var bookImageView: UIImageView!
    
    let realm = try! Realm()
    var book: Book!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
    @IBAction func registerBook(_ sender: Any) {
        
        if bookTitleTextField.text == "" || bookReviewTextView.text == "" || bookImageView.image == nil {
            // エラーメッセージ
            // 「本のタイトル」「本のレビュー」「本の画像」のいずれかが入力されていません。
            // ① UIAlertControllerクラスのインスタンスを生成
            let alert = UIAlertController(title: "エラーメッセージ", message: "「本のタイトル」「本のレビュー」「本の画像」のいずれかが入力されていません。", preferredStyle: .alert)
            // ②アクションの追加
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            // ③アラートの表示
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        book = Book()
        let allBooks = realm.objects(Book.self)
        if allBooks.count != 0 {
            book.id = allBooks.max(ofProperty: "id")! + 1
        }
        
        try! realm.write {
            self.book.title = self.bookTitleTextField.text!
            self.book.review = self.bookReviewTextView.text!
            self.book.image = self.bookImageView.image!.jpegData(compressionQuality: 1)
            self.realm.add(self.book, update: .modified)
        }
        
    }
    
    @IBAction func getImage(_ sender: Any) {
        // カメラを指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    
    //     写真を撮影/選択したときに呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // UIImagePickerController画面を閉じる
        picker.dismiss(animated: true, completion: nil)
        // 画像加工処理
        if info[.originalImage] != nil {
            // 撮影/選択された画像を取得する
            let image = info[.originalImage] as! UIImage
            // CLImageEditorライブラリで加工する
            print("DEBUG_PRINT: image = \(image)")
            // CLImageEditorにimageを渡して、加工画面を起動する。
            let editor = CLImageEditor(image: image)!
            editor.delegate = self
            self.present(editor, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // UIImagePickerController画面を閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
    //     CLImageEditorで加工が終わったときに呼ばれるメソッド
    func imageEditor(_ editor: CLImageEditor!, didFinishEditingWith image: UIImage!) {
        // imageViewに画像を渡す
        bookImageView.image = image
        editor.dismiss(animated: true, completion: nil)
    }
    
    //     CLImageEditorの編集がキャンセルされた時に呼ばれるメソッド
    func imageEditorDidCancel(_ editor: CLImageEditor!) {
        // CLImageEditor画面を閉じる
        editor.dismiss(animated: true, completion: nil)
    }
    
}
