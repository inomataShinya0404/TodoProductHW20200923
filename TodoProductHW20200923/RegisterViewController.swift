//
//  RegisterViewController.swift
//  TodoProductHW20200923
//
//  Created by Shinya  on 2020/09/23.
//  Copyright © 2020 Shinya . All rights reserved.
//

import UIKit
//import RealmSwift

class RegisterViewController: UIViewController, UITextFieldDelegate {

    //保存用の配列
    var titleArray = [String]()
    var dateArray = [String]()
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    //(できればRealmでいきたい)
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //デリゲートの所在
        textField.delegate = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func saveButton() {
//        <------ 各UIパーツから値を取得する ------>
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd/HH:mm"
        
        //配列へのデータ追加
        titleArray.append(textField.text!)
        dateArray.append(dateFormatter.string(from: datePicker.date))
        
        //UserDafaultに書き込み
        saveData.set(titleArray, forKey: "title")
        saveData.set(dateArray, forKey: "date")
        
        
//        <------ アラート ------>
        //Save完了のアラートを出してやる
        let aleart: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        //アラートのOKボタン
        aleart.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    //ボタンが押された時の動作
                    self.navigationController?.popViewController(animated: true)
                    print("OKボタンが押されました")
            }
            )
        )
        present(aleart, animated: true, completion: nil)
    }

    //画面遷移時に値の受け渡しをする
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let viewController:ViewController = segue.destination as! ViewController
//        viewController.saveData = self.saveData
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
