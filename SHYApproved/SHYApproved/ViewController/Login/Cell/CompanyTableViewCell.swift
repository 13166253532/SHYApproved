//
//  CompanyTableViewCell.swift
//  SHYERP
//
//  Created by xiejiangbo on 2017/10/25.
//  Copyright © 2017年 yin chen. All rights reserved.
//

import UIKit

class CompanyTableViewCell: BaseTableViewCell {

    @IBOutlet weak var valueLable: UILabel!
    var infoModel = CompanyTableViewCellModel()
    var block:passParameterBlock!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configurateTheCell(_ xinfo: BaseCellModel) {
        self.infoModel = xinfo as! CompanyTableViewCellModel
        self.valueLable.text = self.infoModel.titleValue
        self.block = self.infoModel.block
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true {
            self.block(self.infoModel.titleValue as AnyObject)
        }
    }

}
class CompanyTableViewCellModel: BaseCellModel {
    
    var titleValue:String?
    var block:passParameterBlock!
}
