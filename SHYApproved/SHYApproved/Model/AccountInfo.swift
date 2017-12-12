//
//  AccountInfo.swift
//  SHYERP
//
//  Created by xiejiangbo on 2017/10/26.
//  Copyright © 2017年 yin chen. All rights reserved.
//

import UIKit
private let AccountInfo_monitoringTime:String="AccountInfo_monitoringTime"
private let AccountInfo_UserId:String="AccountInfo_UserId"
private let AccountInfo_CompanyDate:String="AccountInfo_CompanyDate"
private let AccountInfo_selecCompanyName:String="AccountInfo_selecCompanyName"
private let AccountInfo_UaesName:String="AccountInfo_UaesName"
private let AccountInfo_PassWord:String="AccountInfo_PassWord"
private let AccountInfo_SaveUaesNamePassWord:String="AccountInfo_SaveUaesNamePassWord"
private let AccountInfo_isAutoLogin:String="AccountInfo_isAutoLogin"
private let AccountInfo_selecDepartment:String="AccountInfo_selecDepartment"
class AccountInfo: NSObject {
    var department:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_selecDepartment)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_selecDepartment) as? String
        }
    }
    
    var isAutoLogin:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_isAutoLogin)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_isAutoLogin) as? String
        }
    }
    
    var saveUaesNamePassWord:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_SaveUaesNamePassWord)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_SaveUaesNamePassWord) as? String
        }
    }
    
    var passWord:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_PassWord)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_PassWord) as? String
        }
    }
    
    var uaesName:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_UaesName)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_UaesName) as? String
        }
    }
    
    
    var selecCompanyName:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_selecCompanyName)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_selecCompanyName) as? String
        }
    }
    var companyDate:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_CompanyDate)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_CompanyDate) as? String
        }
    }
    var userId:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_UserId)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_UserId) as? String
        }
    }
    
    var monitoringTime:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_monitoringTime)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_monitoringTime) as? String
        }
    }
    
    //    private static let SharedStatic = AccountInfo()
    //    class func sharedInstanceInfo() ->AccountInfo {
    //        return SharedStatic
    //    }
    //    class func sharedInstanceInfo()-> AccountInfo  {
    //        struct SharedStatic{
    //            static var instance: AccountInfo = AccountInfo()
    //        }
    //        return SharedStatic.instance
    //    }
    //    static var sharedInstance: AccountInfo {
    //        struct Static {
    //            static let instance: AccountInfo = AccountInfo()
    //        }
    //        return Static.instance
    //    }
    //    private override init() {}
    class func sharedInstance()->AccountInfo {
        struct SharedStatic {
            static var instance: AccountInfo = AccountInfo()
        }
        return SharedStatic.instance
    }
    //退出登录，调用此方法，清楚所有数据
    func clearAccount(){
        AccountInfo.sharedInstance().monitoringTime = nil
        AccountInfo.sharedInstance().userId = nil
        AccountInfo.sharedInstance().companyDate = nil
        AccountInfo.sharedInstance().selecCompanyName = nil
    }
}

