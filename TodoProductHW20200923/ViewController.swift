//
//  ViewController.swift
//  TodoProductHW20200923
//
//  Created by Shinya  on 2020/09/23.
//  Copyright © 2020 Shinya . All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //StoryBoardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    //RegisterViewControllerでUserDefaultsに保存されたデータを受け取る変数
    var remindTitle: String!
    var remindDate: Date!
    
    var titleArray = [String]()
    var dateArray = [String]()

    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //テーブルビューのデータメソッドはViewControllerクラスに書く
        table.dataSource = self
        table.delegate = self
        
        //identiferを設定
        self.table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }

    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelにコンテンツを表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! TableViewCell
        
        //cellにコンテンツを表示する
        cell.title.text = titleArray[indexPath.row]
        cell.date.text = dateArray[indexPath.row]
        
        return cell
    }
    
    //cellをスライドでdeleteできるようにする
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.titleArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //XibカスタムCellのLabelに持ってきた値を表示する
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "title") != nil {
            titleArray = UserDefaults.standard.object(forKey: "title") as! [String]
            dateArray = UserDefaults.standard.object(forKey: "date") as! [String]
        }
        
        self.table.reloadData()
    }

}
