//
//  LoginViewController+Department.swift
//  SHYApproved
//
//  Created by xiejiangbo on 2017/12/12.
//  Copyright © 2017年 yin chen. All rights reserved.
//

import UIKit

extension LoginViewController{

    func initMyTableView() {
        self.myTableView = UITableView.init()
        initdataSource()
        self.delegate = LoginViewControllerDelegate()
        self.delegate.dataSource=self.dataSource
        registerCell(self.myTableView, cell: CompanyTableViewCell.self)
        self.myTableView.delegate = self.delegate
        self.myTableView.dataSource = self.delegate
        self.myTableView.backgroundColor = grayBgColor
        self.myTableView.frame = CGRect(x:self.companyLineImage.originX, y: self.companyLineImage.originY, width:self.companyLineImage.width , height:35*HEIGHT_RATIO()*CGFloat(self.dataSource.count) )
        setExtraCellLineHidden(tableView: self.myTableView)
        self.myTableView.isHidden = true
        self.view .addSubview(self.myTableView)
    }
    func initdataSource(){
        let httpArray:NSMutableArray = ["1","2","3","4"]
        dataSource = NSMutableArray()
        for index in 0..<httpArray.count {
            let model = CompanyTableViewCellModel()
            model.className = "CompanyTableViewCell"
            model.titleValue = httpArray[index] as? String
            model.block = { [weak self](value:AnyObject) in
                self?.tableCellSelecAction(str: value as! String)
            }
            dataSource .add(model)
        }
        
    }
    func tableCellSelecAction(str:String)  {
        print(str)
        self.companyTextView.text = str
        self.myTableView.isHidden = true
    }
}
class LoginViewControllerDelegate: BaseOneTableViewDelegate {
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if (section==0){
            return 0
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 35*(SCREEN_HEIGHT()/667)
    }
}
