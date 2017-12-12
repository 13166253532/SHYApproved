//
//  LoginViewController+http.swift
//  SHYApproved
//
//  Created by xiejiangbo on 2017/12/12.
//  Copyright © 2017年 yin chen. All rights reserved.
//

import UIKit

extension LoginViewController {

    //MARK:登录
    func loginAction(dic:NSMutableDictionary) {
        //http.requetGetAuthorizationListHttp(withParams: dic)
    }
    func getNCLoginHttpArray(_ dic: NSMutableDictionary!) {
        let dict:NSMutableDictionary = dic as NSMutableDictionary
        if (dict.object(forKey: "isError") as! String == "Y") {
            gotoHomeVC()
        }else{
            self.getHUDView(str: dict.object(forKey: "isError") as! String)
        }
    }
    //MARK:获取部门列表
    func getDepartmentListHttp(str:String)  {
        let dict = NSMutableDictionary()
        dict.setValue(str, forKey: "")
        //self.companyHttp.requetGetDepartmentList(withParams: dict)
    }
    func getGetGepartmentListHttpDic(_ dic: NSMutableDictionary!) {
        let dict:NSMutableDictionary = dic as NSMutableDictionary
        if (dict.object(forKey: "isError") as! String == "Y") {
            gotoHomeVC()
        }else{
            self.getHUDView(str: dict.object(forKey: "isError") as! String)
        }
    }
    
}
