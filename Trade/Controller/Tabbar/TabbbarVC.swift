//
//  TabbbarVC.swift
//  Trade
//
//  Created by Anshul on 09/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit
protocol MiddleButtonDelegate {
    func btnMiddleTapped(isFromTutorial:Bool)
}

class MiddleTab:UIView{
    
    var delegate:MiddleButtonDelegate?
    @IBOutlet var viewBeizer:UIView!
    
    @IBOutlet weak var imgVIew: UIImageView!
    override func draw(_ rect: CGRect) {
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setPath()
    }

    @IBAction func middleBtnTapped(_ sender: Any) {
        delegate?.btnMiddleTapped(isFromTutorial:false)
    }
    
    private func setPath() {
        
        let size = viewBeizer.bounds.size
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x:0, y:0))
        arrowPath.addLine(to: CGPoint(x:0, y:size.height))
        arrowPath.addLine(to: CGPoint(x:size.width, y:size.height))
        arrowPath.addLine(to: CGPoint(x:size.width, y:0))
        let point = CGPoint(x:0, y:0)
        let controlPoint = CGPoint(x:size.width/2, y:40)
        arrowPath.addQuadCurve(to: point, controlPoint: controlPoint)
        arrowPath.addLine(to: CGPoint(x:0, y:0))
        arrowPath.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = arrowPath.cgPath
        shapeLayer.shadowPath = arrowPath.cgPath
        viewBeizer.layer.mask = shapeLayer
    }
    
    
    func getName() -> Int{
        return 10
    }
    
    func getName(b:String) -> String{
        return "10"
    }
    
    

}

class TabbbarVC: UITabBarController, MiddleButtonDelegate {
    private let middleBtnTag = 10101
    private var middleTapCount = 0
    private let middleBtnIndex = 2
    private let curveSize = CGFloat(30)
    
    private let kMiddleImage = 1000
    private let kMiddleButton = 1001
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMiddleButton()
        addCurveToTabBar()
        setTabBarUI()
        self.selectedIndex = 2
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func hideTabBar(isHidden:Bool){
        self.tabBar.isHidden = isHidden
        self.view.viewWithTag(middleBtnTag)?.isHidden = isHidden
    }
    
//    func changeBottomButtomImage()
//    {
//        let imageView:UIImageView? =   self.view.viewWithTag(1000) as? UIImageView
//        imageView?.image = UIImage.init(named: "chattab");
//
//    }
//
    func setTabBarUI(){
        
        guard let items = self.tabBar.items,items.count>3 else{
            return
        }
        
        items[0].image = UIImage(named: "search")
        items[0].selectedImage = UIImage(named: "search")
        items[0].title = "Search"
        
        items[1].image = UIImage(named: "cash")
        items[1].selectedImage = UIImage(named: "cash")
        items[1].title = "Cash"
        
        
        items[3].image = UIImage(named: "watchlist")
        items[3].selectedImage = UIImage(named: "watchlist")
        items[3].title = "Watchlist"
        
        
        items[4].image = UIImage(named: "settings")
        items[4].selectedImage = UIImage(named: "settings")
        items[4].title = "Settings"
        
     //   self.tabBar.backgroundColor = UIColor.white
        //UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
        
        for tabBarItem in self.tabBar.items! {
            //tabBarItem.title = "";
            tabBarItem.imageInsets = UIEdgeInsets(top: -6, left: 0, bottom: -6, right: 0)
        }


    }
    
}


extension TabbbarVC:UITabBarControllerDelegate{
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        let tabbarItemObj = self.viewControllers?[middleBtnIndex].tabBarItem
//        if item != tabbarItemObj{
//            middleTapCount = 0
//        }
//        if middleTapCount == 2{
//            middleTapCount = 0
//            let nav =  self.viewControllers?[selectedIndex] as? UINavigationController
//            guard let navigationVC = nav else{
//                return
//            }
//            navigationVC.popToRootViewController(animated: true)
//        }
//
//        let contactUsTab = self.viewControllers?[4].tabBarItem
//        let imageView:UIImageView? =   self.view.viewWithTag(kMiddleImage) as? UIImageView
//        let btnImage:UIButton? =   self.view.viewWithTag(kMiddleButton) as? UIButton
//
//        if contactUsTab != item{
//            btnImage?.isUserInteractionEnabled = true
//            imageView?.image = UIImage.init(named: "DataMarketTab");
//        }else{
//            imageView?.image = UIImage.init(named: "chattab");
//            btnImage?.isUserInteractionEnabled = false
//        }
//
//    }
}




extension TabbbarVC{
    func addCurveToTabBar(){
        let tabBarWidth = self.tabBar.frame.width
        let size = self.tabBar.bounds.size
        self.delegate = self
        let arrowPath = UIBezierPath()
        let startPoint = CGPoint(x:tabBarWidth/2 - curveSize,y:0)
        let endPoint = CGPoint(x:tabBarWidth/2 + curveSize,y:0)
        
        arrowPath.move(to: startPoint)
        arrowPath.addLine(to: startPoint)
        arrowPath.addLine(to: CGPoint(x:0, y:0))
        arrowPath.addLine(to: CGPoint(x:0, y:size.height))
        arrowPath.addLine(to: CGPoint(x:size.width, y:size.height))
        arrowPath.addLine(to: CGPoint(x:size.width, y:0))
        arrowPath.addLine(to: endPoint)
        arrowPath.move(to: endPoint)
        
        let point = CGPoint(x:tabBarWidth/2-curveSize, y:0)
        let controlPoint = CGPoint(x:size.width/2, y:40)
        arrowPath.addQuadCurve(to: point, controlPoint: controlPoint)
        arrowPath.move(to: endPoint)
        arrowPath.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = arrowPath.cgPath
        shapeLayer.shadowPath = arrowPath.cgPath
        self.tabBar.layer.mask = shapeLayer
        
    }
    private func setupMiddleButton() {
        guard let menuButton = UINib(nibName: "MiddleTab", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? MiddleTab else{
            return
        }
        menuButton.tag = middleBtnTag
        
        menuButton.delegate = self
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = self.view.bounds.height - menuButtonFrame.height
        menuButtonFrame.origin.x = self.view.bounds.width / 2 - menuButtonFrame.size.width / 2
        menuButton.frame = menuButtonFrame
        self.view.addSubview(menuButton)
    }
    func btnMiddleTapped(isFromTutorial:Bool) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        guard let datamarketVC = storyboard.instantiateViewController(withIdentifier: "DataMarketPlaceVC") as? DataMarketPlaceVC else{
//            return
//        }
//        datamarketVC.isFromTutorial = isFromTutorial
//        let navigationController = UINavigationController(rootViewController: datamarketVC)
//        navigationController.navigationBar.isHidden = true
//        self.present(navigationController, animated: true, completion: nil)
    }
}
