//
//  LoginViewController.swift
//  SHYERP
//
//  Created by xiejiangbo on 2017/10/19.
//  Copyright © 2017年 yin chen. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController,TimersControllerDelegate,UITextFieldDelegate {

    var backgroundImageView:UIImageView!
    var headTitleImage:UIImageView!
    var subHeadTitleImage:UIImageView!
    //var headBAGImage:UIImageView!
    //var headImage:UIImageView!
    //var titleLabel:UILabel!//智慧采购直通车
    
    
    var textViewImage:UIImageView!
    var textViewLineImage:UIImageView!
    var passwordLineImage:UIImageView!
    var companyLineImage:UIImageView!
    var advertisingView:UIImageView!
    
    var accountViewImage:UIImageView!
    var passViewImage:UIImageView!
    var companyViewImage:UIImageView!
    
    var userTextView:UITextField!
    var passTextView:UITextField!
    var companyTextView:UITextField!
    
    var buttonRemeberPassword:UIButton!
    var labelRemeberPassword:UILabel!
    var buttonAutoLogin:UIButton!
    var labelAutoLogin:UILabel!
    var loginButton:UIButton!
    var underButton:UIButton!
    
    var underImageView:UIImageView!
    
    
    var myTableView:UITableView!
    var delegate:LoginViewControllerDelegate!
    var dataSource:NSMutableArray!
    
    var scanningBNum = 0
    
    
    var companyLabel:UILabel!
    
    
    
    class func createViewController(createArgs:AnyObject?) ->AnyObject{
        let storyboard:UIStoryboard=UIStoryboard(name: "LoginViewController", bundle: nil)
        let vc:LoginViewController=storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.createArgs=createArgs
        return vc
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        hud = MBProgressHUD.init()
        self.view .addSubview(hud)
        hud.mode = MBProgressHUDModeText
        
       
        
        hideNavigationBar()
        
        addInitBackgroundImageView()
        addInitHeadTitleView()
        addInitTextView()
        addInitLoginButton()
        addMemoryView()
        initMyTableView()
        addInitAdvertisingView()
        setNamePassWord()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.hideNavigationBar()
        TimersController.share().delegate = self
        TimersController.share().startTime()
        
    }
    func setNamePassWord()  {
        if AccountInfo.sharedInstance().saveUaesNamePassWord != nil {
            self.buttonRemeberPassword.isSelected = self.getBool(str: AccountInfo.sharedInstance().saveUaesNamePassWord!)
        }
        if AccountInfo.sharedInstance().isAutoLogin != nil {
            self.buttonAutoLogin.isSelected = self.getBool(str: AccountInfo.sharedInstance().isAutoLogin!)
            if self.buttonAutoLogin.isSelected {
                onLogin()
            }
        }
        
    }
    
    func getIndex() {
        if scanningBNum == 3 {
            self.advertisingView.isHidden = true
            initReturnBtns()
            initCompanyLabel()
            TimersController.share().endTimer()
        }
        scanningBNum = scanningBNum + 1
    }
    func addInitAdvertisingView()  {
        advertisingView = UIImageView.init(frame: CGRect(x:0, y: 0, width:SCREEN_WHIDTH() , height:SCREEN_HEIGHT()))
        advertisingView.image = UIImage.init(named: "launch_image")
        self.view .addSubview(advertisingView)
    }
    
    func addInitBackgroundImageView(){
        backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = UIImage.init(named: "backgroundImage")
        self.view .addSubview(backgroundImageView)
    }
    func addInitHeadTitleView(){
        headTitleImage = UIImageView.init(frame: CGRect(x:30*WHIDTH_RATIO(), y: HEIGHT_RATIO()*90, width:SCREEN_WHIDTH()-60*WHIDTH_RATIO() , height:WHIDTH_RATIO()*75 ))
        headTitleImage.image = UIImage.init(named: "headTitle_image")
        headTitleImage.contentMode = .scaleAspectFit
        headTitleImage.centerX = SCREEN_WHIDTH()/2
        self.view .addSubview(headTitleImage)
        subHeadTitleImage = UIImageView.init(frame: CGRect(x:0, y: headTitleImage.originY+WHIDTH_RATIO()*65, width:SCREEN_WHIDTH() , height:WHIDTH_RATIO()*20 ))
        subHeadTitleImage.image = UIImage.init(named: "subTitle_image")
        subHeadTitleImage.contentMode = .scaleAspectFit
        subHeadTitleImage.centerX = SCREEN_WHIDTH()/2
        self.view .addSubview(subHeadTitleImage)
    }
//    func addInitHeadImageView(){
//        titleLabel = UILabel.init(frame: CGRect(x:0, y: headTitleImage.originY+headTitleImage.height+HEIGHT_RATIO()*15, width:SCREEN_WHIDTH() , height:WHIDTH_RATIO()*70 ))
//        titleLabel.font = UIFont.systemFont(ofSize: 20)
//        headBAGImage.contentMode = .scaleAspectFit
//        headBAGImage.image = UIImage.init(named: "headBAG_image")
//        titleLabel.centerX = SCREEN_WHIDTH()/2
//        titleLabel.textAlignment = .center
//        self.view .addSubview(titleLabel)
//
//    }
    func addInitTextView(){
        textViewImage = UIImageView.init(frame: CGRect(x:15*WHIDTH_RATIO(), y: headTitleImage.originY+WHIDTH_RATIO()*140, width:SCREEN_WHIDTH()-30*WHIDTH_RATIO() , height:HEIGHT_RATIO()*100 ))
        //textViewImage.image = UIImage.init(named: "textView_image")
        textViewImage.centerX = SCREEN_WHIDTH()/2
        self.view .addSubview(textViewImage)
        
        // 账号
        accountViewImage = UIImageView.init(frame: CGRect(x:textViewImage.originX+WHIDTH_RATIO()*15, y: textViewImage.originY+WHIDTH_RATIO()*18, width:WHIDTH_RATIO()*18 , height:WHIDTH_RATIO()*18 ))
        accountViewImage.image = UIImage.init(named: "account_image")
        self.view .addSubview(accountViewImage)
        userTextView = self.getTextField(placeholder: "请输入账号", tag: 100)
        userTextView.frame = CGRect(x:accountViewImage.originX+WHIDTH_RATIO()*25, y: textViewImage.originY+WHIDTH_RATIO()*5, width:SCREEN_WHIDTH()/3*2 , height:textViewImage.height/2-5*HEIGHT_RATIO() )
        self.view .addSubview(userTextView)
        textViewLineImage = self.getLinViewImage()
        textViewLineImage.frame = CGRect(x:accountViewImage.originX, y: userTextView.originY+userTextView.height, width:userTextView.width+userTextView.originX , height:HEIGHT_RATIO()*1 )
        self.view .addSubview(textViewLineImage)
        
        //密码
        passViewImage = UIImageView.init(frame: CGRect(x:textViewImage.originX+WHIDTH_RATIO()*15, y: textViewLineImage.originY+WHIDTH_RATIO()*13, width:WHIDTH_RATIO()*18 , height:WHIDTH_RATIO()*18 ))
        passViewImage.image = UIImage.init(named: "pass_image")
        self.view .addSubview(passViewImage)
        passTextView = self.getTextField(placeholder: "请输入密码", tag: 101)
        passTextView.frame = CGRect(x:accountViewImage.originX+WHIDTH_RATIO()*25, y: textViewLineImage.originY, width:SCREEN_WHIDTH()/3*2 , height:textViewImage.height/2-5*HEIGHT_RATIO() )
        passTextView.isSecureTextEntry = true
        self.view .addSubview(passTextView)
        passwordLineImage = self.getLinViewImage()
        passwordLineImage.frame = CGRect(x:passViewImage.originX, y: passTextView.originY+passTextView.height, width:textViewLineImage.width , height:HEIGHT_RATIO()*1 )
        self.view .addSubview(passwordLineImage)
        
        
        //  公司
        companyViewImage = UIImageView.init(frame: CGRect(x:textViewImage.originX+WHIDTH_RATIO()*15, y: passwordLineImage.originY+WHIDTH_RATIO()*13, width:WHIDTH_RATIO()*18 , height:WHIDTH_RATIO()*18 ))
        companyViewImage.image = UIImage.init(named: "company")
        self.view .addSubview(companyViewImage)
        companyTextView = self.getTextField(placeholder: "请输入部门", tag: 101)
        companyTextView.frame = CGRect(x:companyViewImage.originX+WHIDTH_RATIO()*25, y: passwordLineImage.originY, width:SCREEN_WHIDTH()/3*2 , height:textViewImage.height/2-5*HEIGHT_RATIO() )
        
        self.view .addSubview(companyTextView)
        companyLineImage = self.getLinViewImage()
        companyLineImage.frame = CGRect(x:companyViewImage.originX, y: companyTextView.originY+companyTextView.height, width:textViewLineImage.width , height:HEIGHT_RATIO()*1 )
        self.view .addSubview(companyLineImage)
        
        let underButtonWidth = companyTextView.height/3
        underButton = UIButton.init(type: .custom)
        underButton.frame = CGRect(x:companyViewImage.originX+WHIDTH_RATIO()*25, y: passwordLineImage.originY, width:textViewLineImage.width , height:textViewImage.height/2-5*HEIGHT_RATIO() )
        //underButton.setBackgroundImage(UIImage.init(named: "under_image"), for: .normal)
        underButton.contentMode = .scaleToFill
        underButton.addTarget(self, action: #selector(segmentAction), for: .touchUpInside)
        //underButton.backgroundColor = UIColor.red
        underButton.alpha = 0.1
        self.view .addSubview(underButton)
        
        underImageView = UIImageView.init(frame: CGRect(x:passwordLineImage.originX+passwordLineImage.width-underButtonWidth, y: passwordLineImage.originY+(companyTextView.height-underButtonWidth)/2, width:underButtonWidth, height:underButtonWidth-5*WHIDTH_RATIO()  ))
        underImageView.image = UIImage.init(named: "under_image")
        underImageView.contentMode = .scaleAspectFit
        //underImageView.backgroundColor = UIColor.red
        self.view .addSubview(underImageView)
    }
    @objc func segmentAction()  {
        self.underButton.isSelected = !self.underButton.isSelected;
//        if (!self.underButton.isSelected) {
//           self.myTableView.isHidden = true
//        }else{
//           self.myTableView.isHidden = false
//        }
        self.myTableView.isHidden = false
    }
    func addInitLoginButton() {
        loginButton = UIButton.init(type: .custom)
        loginButton.frame = CGRect(x:(SCREEN_WHIDTH()-companyLineImage.width)/2, y: companyLineImage.originY+HEIGHT_RATIO()*50, width:companyLineImage.width , height:WHIDTH_RATIO()*35)
        //loginButton.centerX = SCREEN_WHIDTH()/2
        loginButton.setBackgroundImage(UIImage.init(named: "loginBtn_image"), for: .normal)
        loginButton.setTitle("登录", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        loginButton.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
        self.view .addSubview(loginButton)
    }
    func addMemoryView() {
        buttonRemeberPassword = self.getUIButton()
        buttonRemeberPassword.frame = CGRect(x:loginButton.originX+WHIDTH_RATIO()*15, y: loginButton.originY+loginButton.height+WHIDTH_RATIO()*25, width:WHIDTH_RATIO()*20 , height:WHIDTH_RATIO()*20)
        buttonRemeberPassword.addTarget(self, action: #selector(clileft), for: .touchUpInside)
        self.view .addSubview(buttonRemeberPassword)
        labelRemeberPassword = self.getUILabel(str: "保存账号密码")
        labelRemeberPassword.frame = CGRect(x:buttonRemeberPassword.originX+WHIDTH_RATIO()*20, y: loginButton.originY+loginButton.height+WHIDTH_RATIO()*10, width:WHIDTH_RATIO()*120 , height:WHIDTH_RATIO()*20)
        labelRemeberPassword.centerY = buttonRemeberPassword.centerY;
        self.view .addSubview(labelRemeberPassword)
        
        
        buttonAutoLogin = self.getUIButton()
        buttonAutoLogin.frame = CGRect(x:SCREEN_WHIDTH()/2+loginButton.originX+WHIDTH_RATIO()*15, y: buttonRemeberPassword.originY, width:WHIDTH_RATIO()*20 , height:WHIDTH_RATIO()*20)
        buttonAutoLogin.addTarget(self, action: #selector(cliright), for: .touchUpInside)
        self.view .addSubview(buttonAutoLogin)
        labelAutoLogin = self.getUILabel(str: "自动登录")
        labelAutoLogin.frame = CGRect(x:buttonAutoLogin.originX+WHIDTH_RATIO()*20, y: loginButton.originY+loginButton.height+WHIDTH_RATIO()*10, width:WHIDTH_RATIO()*120 , height:WHIDTH_RATIO()*20)
        labelAutoLogin.centerY = buttonAutoLogin.centerY;
        self.view .addSubview(labelAutoLogin)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.userTextView.resignFirstResponder()
        self.passTextView.resignFirstResponder()
        self.companyTextView.resignFirstResponder()
        self.myTableView.isHidden = true
    }
    func getLinViewImage() -> UIImageView{
        let lineImageView = UIImageView.init()
        lineImageView.image = UIImage.init(named: "textViewLine_image")
        lineImageView.centerX = SCREEN_WHIDTH()/2
        return lineImageView
    }
    
    func getTextField(placeholder:String,tag:NSInteger) -> UITextField {
        let text = UITextField.init()
        text.placeholder = placeholder
        text.tag = tag
        text.clearButtonMode = .whileEditing
        text.delegate = self
        //text.backgroundColor = UIColor.red
        return text
    }
    func getUIButton() -> UIButton{
        let btn = UIButton.init(type: .custom)
        btn.contentMode = .scaleToFill
        btn.setBackgroundImage(UIImage.init(named: "normal_image"), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: "selec_image"), for: .selected)
        btn.setBackgroundImage(UIImage.init(named: "selec_image"), for: .highlighted)
        return btn
    }
    
    func getUILabel(str:String) -> UILabel {
        let label = UILabel.init()
        label.text = str
        label.centerY = buttonRemeberPassword.centerY
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }
    @objc func clileft(){
        self.buttonRemeberPassword.isSelected = !self.buttonRemeberPassword.isSelected;
        if (!self.buttonRemeberPassword.isSelected) {
            self.buttonAutoLogin.isSelected = false;
        }
        
    }
    @objc func cliright(){
        self.buttonAutoLogin.isSelected = !self.buttonAutoLogin.isSelected;
        self.buttonRemeberPassword.isSelected = true;
        
    }
    
    @objc func onLogin() {
        userTextView.resignFirstResponder()
        passTextView.resignFirstResponder()
        companyTextView.resignFirstResponder()
//        if userTextView.text == nil || userTextView.text?.characters.count == 0 {
//            getHUDView(str: "账号不能为空")
//            return
//        }
//        if passTextView.text == nil || passTextView.text?.characters.count == 0 {
//            getHUDView(str: "密码不能为空")
//            return
//        }
//        if companyTextView.text == nil || companyTextView.text?.characters.count == 0 {
//            getHUDView(str: "部门不能为空")
//            return
//        }
        let dic = NSMutableDictionary()
//        dic.setValue(userTextView.text, forKey: "param1")
//        dic.setValue(passTextView.text, forKey: "param2")
//        dic.setValue(companyTextView.text, forKey: "param3")
//        dic.setValue("shyyerp", forKey: "param1")
//        dic.setValue("0321", forKey: "param2")
//        dic.setValue("1", forKey: "param3")
//        http.requetGetAuthorizationListHttp(withParams: dic)
        
        
        hud = MBProgressHUD.init()
        self.view .addSubview(hud)
        hud.center = self.view.center
        hud.mode = MBProgressHUDModeIndeterminate
        //hud.show(true)
        gotoHomeVC()
        AccountInfo.sharedInstance().uaesName = userTextView.text
        AccountInfo.sharedInstance().passWord = passTextView.text
        AccountInfo.sharedInstance().department = companyTextView.text
        
        AccountInfo.sharedInstance().saveUaesNamePassWord = self.getBoolStr(bool: self.buttonRemeberPassword.isSelected)
        AccountInfo.sharedInstance().isAutoLogin = self.getBoolStr(bool: self.buttonAutoLogin.isSelected)
        //设置别名  cywu
//        JPUSHService.setTags(nil, alias:"123456789", fetchCompletionHandle: { (code, tags, alias) in
//            NSLog("code : %d", code)
//        })
    }
    func getBoolStr(bool:Bool) -> String {
        if bool {
            return "1"
        }
        return "0"
    }
    func getBool(str:String) -> Bool {
        if str == "1" {
             userTextView.text =  AccountInfo.sharedInstance().uaesName
             passTextView.text =  AccountInfo.sharedInstance().passWord
             companyTextView.text =  AccountInfo.sharedInstance().department
            return true
        }
        return false
    }
    func gotoHomeVC() {
        hud.hide(true)
//        let vc:HomeViewController=HomeViewController.createViewController(createArgs: nil) as! HomeViewController
//        vc.hidesBottomBarWhenPushed = false
//        self.pushViewController(viewController: vc, animated: true)
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userTextView.resignFirstResponder()
        passTextView.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK:UITextField 代理方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textField.tag2=="+String(textField.tag))
        if textField.tag == 100 {
            getDepartmentListHttp(str: textField.text!)
        }
    }
}
