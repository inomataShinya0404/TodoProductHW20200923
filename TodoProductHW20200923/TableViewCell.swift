//
//  TableViewCell.swift
//  TodoProductHW20200923
//
//  Created by Shinya  on 2020/09/27.
//  Copyright © 2020 Shinya . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    func setCell(table: Table){
//        self.title.text = table.title as String
//        self.date.text = table.date as String
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func initNib() -> TableViewCell {
        //xibファイルのオブジェクトをインスタンス
        let className: String = String(describing: TableViewCell.self)
        return Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as! TableViewCell
    }
}
