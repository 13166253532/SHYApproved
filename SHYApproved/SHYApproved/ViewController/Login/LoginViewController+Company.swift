//
//  LoginViewController+Company.swift
//  SHYApproved
//
//  Created by xiejiangbo on 2017/12/12.
//  Copyright © 2017年 yin chen. All rights reserved.
//

import UIKit

extension LoginViewController {

    func initReturnBtns(){
        let leftN:UIBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: ""), style: .plain, target: self, action: #selector(arrowResponse))
        self.navigationItem.leftBarButtonItem = leftN
        let rightBtn = UIButton.init(type: .custom)
        rightBtn.frame = CGRect(x:0, y: 0, width:25 , height:20 )
        rightBtn.setImage(UIImage.init(named: "house_image"), for: .normal)
        rightBtn.addTarget(self, action: #selector(gotoCompanyListVC), for: .touchUpInside)
        let rightN:UIBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = rightN
    }
    func initCompanyLabel()  {
        companyLabel = UILabel.init(frame: CGRect(x:30*WHIDTH_RATIO(), y: 0, width:SCREEN_WHIDTH()-60*WHIDTH_RATIO() , height:(self.navigationController?.navigationBar.frame.size.height)! ))
        companyLabel.textColor = grayColor
        companyLabel.contentMode = .left
        companyLabel.font = UIFont.systemFont(ofSize: 14*WHIDTH_RATIO())
        if AccountInfo.sharedInstance().selecCompanyName != nil {
            companyLabel.text = AccountInfo.sharedInstance().selecCompanyName
        }
        //companyLabel.text = "上海医药·上药控股有限公司"
        //companyLabel.backgroundColor = UIColor.red
        self.navigationItem.titleView = companyLabel
        let linView = UIView.init(frame: CGRect(x:0, y:65*HEIGHT_RATIO() , width:SCREEN_WHIDTH() , height:1 ))
        linView.backgroundColor = grayColor
        linView.alpha = 0.5
        self.view .addSubview(linView)
    }
    @objc func gotoCompanyListVC()  {
//        let vc:CompanyListViewController=CompanyListViewController.createViewController(createArgs: nil) as! CompanyListViewController
//        vc.block = {[weak self] in
//            if AccountInfo.sharedInstance().selecCompanyName != nil {
//                self?.companyLabel.text = AccountInfo.sharedInstance().selecCompanyName
//            }
//        }
//        self.pushViewController(viewController: vc, animated: true)
    }
}

