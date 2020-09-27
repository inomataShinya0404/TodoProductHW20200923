//
//  TableViewCell.swift
//  TodoProductHW20200923
//
//  Created by Shinya  on 2020/09/27.
//  Copyright © 2020 Shinya . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func setCell(cell: Cell) {
//        self.titleLabel.text = cell.titleLabel as String
//    }
    
}
