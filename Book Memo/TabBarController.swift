//
//  TabBarController.swift
//  Book Memo
//
//  Created by 仲優樹 on 2023/03/09.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // タブアイコンの色
        self.tabBar.tintColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        // タブバーの背景色を設定
        let appearance = UITabBarAppearance()
        appearance.backgroundColor =  UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)
        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance
        // UITabBarControllerDelegateプロトコルのメソッドをこのクラスで処理する。
        self.delegate = self
    }
    
    // タブバーのアイコンがタップされた時に呼ばれるdelegateメソッドを処理する。
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            if viewController is BookRegisterViewController {
                // BookRegisterViewControllerは、タブ切り替えではなくモーダル画面遷移する
                let BookRegisterViewController = storyboard!.instantiateViewController(withIdentifier: "ImageSelect")
                present(BookRegisterViewController, animated: true)
                return false
            } else {
                // その他のViewControllerは通常のタブ切り替えを実施
                return true
            }
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
