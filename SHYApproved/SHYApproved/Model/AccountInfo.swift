//
//  AccountInfo.swift
//  SHYTB
//
//  Created by xiejiangbo on 2017/11/9.
//  Copyright © 2017年 yin chen. All rights reserved.
//

import UIKit
private let AccountInfo_qrCodeData:String="AccountInfo_qrCodeData"
private let AccountInfo_UserId:String="AccountInfo_UserId"

class AccountInfo: NSObject {
    
    var UserId:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_UserId)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_UserId) as? String
        }
    }

    var qrCodeData:String?{
        set{
            let userData:UserDefaults=UserDefaults.standard
            userData.set(newValue, forKey: AccountInfo_qrCodeData)
        }
        get{
            let userData:UserDefaults=UserDefaults.standard
            return userData.object(forKey: AccountInfo_qrCodeData) as? String
        }
    }
    
    class func sharedInstance()->AccountInfo {
        struct SharedStatic {
            static var instance: AccountInfo = AccountInfo()
        }
        return SharedStatic.instance
    }
}
