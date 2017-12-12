//
//  BaseViewController.swift
//  CarRental
//
//  Created by xiejiangbo on 2017/4/25.
//  Copyright © 2017年 yin chen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var createArgs:AnyObject!
    var hud:MBProgressHUD!
    deinit{
        
        print("------------------------------")
        print(NSStringFromClass(self.classForCoder)+"释放")
        print("------------------------------")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        //self.navigationController!.navigationBar.barStyle = UIBarStyle.black
        //UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        //UIApplication.shared.statusBarOrientation = UIInterfaceOrientation.portrait
        let ver:Float=(UIDevice.current.systemVersion as NSString).floatValue
        if(ver>=7.0){
            self.automaticallyAdjustsScrollViewInsets=false
            UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: false)
        }
        // Do any additional setup after loading the view.
    }
    func isNavigationBarObstructed(){
        self.edgesForExtendedLayout = UIRectEdge.bottom
    }
    // 设置状态栏颜色
    func initSetStatusBarColor(){
        // 无需设置 plist
        //self.navigationController!.navigationBar.barStyle = UIBarStyle.black
        //需要设置 plist
        //View controller-based status bar appearance 设置为 NO
        //UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func pushViewController(viewController:UIViewController,animated:Bool){
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func arrowResponse(){
        self.navigationController?.popViewController(animated: true)
    }
    // 设置导航栏
    func initTitleBar(){
        self.view.backgroundColor = viewBagColor
        self.defaultBackButtonItem()
        self.initTitleBarColor()
        self.initReturnBtn()
    }
    //左侧返回按钮
    func initReturnBtn(){
        let leftN:UIBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "return_image"), style: .plain, target: self, action: #selector(arrowResponse))
        self.navigationItem.leftBarButtonItem = leftN
    }
    private func defaultBackButtonItem(){
        let barButtonItem :UIBarButtonItem=UIBarButtonItem.init(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem=barButtonItem
        self.navigationController!.navigationBar.tintColor=UIColor.white
        self.navigationController?.navigationBar.barTintColor=navigationColor
        self.navigationController?.navigationBar.subviews[0].backgroundColor=navigationColor
    }
    private func initTitleBarColor(){
        //let dict:[NSAttributedStringKey:AnyObject]=[NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue):UIColor.white, NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue):UIFont.systemFont(ofSize: 17.0)]
        
        let dict:[String:AnyObject]=[NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont.systemFont(ofSize: 17.0)]
        self.navigationController!.navigationBar.titleTextAttributes = dict as [String : Any]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //隐藏导航栏
    func hideNavigationBar(){
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.lt_setBackgroundColor(UIColor.clear)
    }
    func displayNavigationBar(){
        self.navigationController?.navigationBar.lt_reset()
    }
    func isTelNumber(num:String)->Bool
    {
        let mobile = "^1(7[0-9]|3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluate(with: num) == true)
            || (regextestcm.evaluate(with: num)  == true)
            || (regextestct.evaluate(with: num) == true)
            || (regextestcu.evaluate(with: num) == true))
        {
            return true
        }
        else
        {
            return false
        }
    }
    func isExpired(time:String) -> Bool {
        let dformatters = DateFormatter.init()
        dformatters.dateFormat = "yyyy-MM-dd HH:mm"
        let now = NSDate()
        //let dateString1 = "2017-07-06 13:40"
        let date1 = dformatters.date(from: time)
        //let dateString2 = "2017-07-06 13:41"
        //let date2 = dformatters.date(from: dateString2)
        
        if date1?.compare(now as Date) == ComparisonResult.orderedAscending {
            //print("date1 is earlier")
            return false
        } else if date1?.compare(now as Date) == ComparisonResult.orderedDescending {
            //print("date2 is earlier")
            return true
        } else if date1?.compare(now as Date) == ComparisonResult.orderedSame {
            //print("Same date!!!")
        }
        return true
    }
    func isStartTime(time:String) -> Bool {
        let dformatters = DateFormatter.init()
        dformatters.dateFormat = "yyyy-MM-dd HH:mm"
        let now = NSDate()
        let date1 = dformatters.date(from: time)
        if date1?.compare(now as Date) == ComparisonResult.orderedAscending {
            //print("date1 is earlier")
            return true
        } else if date1?.compare(now as Date) == ComparisonResult.orderedDescending {
            //print("date2 is earlier")
            return false
        } else if date1?.compare(now as Date) == ComparisonResult.orderedSame {
            //print("Same date!!!")
        }
        return false
    }
    //退出登录
    func gotoBackLogin()  {
        self.navigationController?.popViewController(animated: true)
    }
    // 退出APP
    func dropOutAPP()  {
        let app:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let window:UIWindow = app.window!
        UIView.animate(withDuration: 1.0, animations: {
            window.alpha = 0
            window.frame = CGRect(x:0, y: window.bounds.size.width, width:0 , height:0 )
            
        }) { (finished:Bool) in
            exit(0)
        }
    }
    func delegateActionDict(dic:NSMutableDictionary,block:selectBlock) {
        let dict:NSMutableDictionary = dic as NSMutableDictionary
        if (dict.object(forKey: "isError") as! String == "Y") {
            block()
        }else{
            self.getHUDView(str: dict.object(forKey: "isError") as! String)
        }
    }
    func getHUDView(str:String) {
        self.view .addSubview(hud)
        hud.labelText = str
        hud.show(true)
        hud.hide(true, afterDelay: 1.5)
    }
    //指定字符 指定颜色并加上下划线
    func getNSAttributedString(str:String) -> NSAttributedString {
        let myMutableString = NSMutableAttributedString(string: str)
        let range2 = NSMakeRange(12, 4)
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: footBlueColor, range: range2)
        myMutableString.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleNone.rawValue, range: NSMakeRange(0, 12))
        myMutableString.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: range2)
        return myMutableString
    }
    //MARK:判断是否有汉字
    func isIncludeChineseIn(string: String) -> Bool {
        for (_, value) in string.characters.enumerated() {
            if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                return true
            }
        }
        return false
    }
}
