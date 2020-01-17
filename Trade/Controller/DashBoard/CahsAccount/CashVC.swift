//
//  CashVC.swift
//  Trade
//
//  Created by Anshul on 11/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

struct CashSummeryModel {
    let name: String
    var isSelected: Bool
}

class CashVC: UIViewController {
    @IBOutlet weak var collectionViewSegment: UICollectionView!
    var cashSummeryModelArray: [CashSummeryModel] = [CashSummeryModel(name: "Summary", isSelected:true), CashSummeryModel(name: "Bank Accounts", isSelected:false)]
   @IBOutlet weak var containerView:UIView!
    
    private lazy var summaryViewController: CashSummeryVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "CashSummeryVC") as! CashSummeryVC

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)

        return viewController
    }()
    
    private lazy var sessionsViewController: CashBankAccountVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "CashBankAccountVC") as! CashBankAccountVC

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)

        return viewController
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSegment.delegate = self
        collectionViewSegment.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        containerView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func removeChild() {
        // Notify Child View Controller
        
        for obj in self.children {
            obj.willMove(toParent: nil)
            
            // Remove Child View From Superview
            obj.view.removeFromSuperview()
            
            // Notify Child View Controller
            obj.removeFromParent()
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension CashVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<cashSummeryModelArray.count {
            cashSummeryModelArray[i].isSelected = false
        }
        cashSummeryModelArray[indexPath.row].isSelected = true
        self.collectionViewSegment.reloadData()
        removeChild()

        switch indexPath.row {
        case 0:
            self.add(asChildViewController: summaryViewController)
        default:
            self.add(asChildViewController: sessionsViewController)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}

extension CashVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cashSummeryModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let segmentcell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SegmentCell
        segmentcell.configure(model: cashSummeryModelArray[indexPath.row])
        return segmentcell
    }
    
}
