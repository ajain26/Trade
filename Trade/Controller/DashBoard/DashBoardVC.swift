//
//  DashBoardVC.swift
//  Trade
//
//  Created by Anshul on 09/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit
import Charts

struct DashBoardAccount {
    let imgName: String
    let point: String
    let title: String
}

class DashBoardVC: UIViewController {
    
    let headerViewMaxHeight: CGFloat = 590
    let headerViewMinHeight: CGFloat = 0
    @IBOutlet weak var heightConstant: NSLayoutConstraint!
    @IBOutlet weak var tabelDashBoard: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var mChart: LineChartView!
    var dataEntries: [ChartDataEntry] = []

    
    

    let dashBoardArray: [DashBoardAccount] = [DashBoardAccount(imgName: "wallet", point: "4000", title: "Cash Account"), DashBoardAccount(imgName: "portfolio", point: "9500", title: "iPortfolio Account"),DashBoardAccount(imgName: "stock", point: "100000", title: "Stock Account"), DashBoardAccount(imgName: "mutualfundaccount", point: "100000", title: "Mututal Fund Account"), DashBoardAccount(imgName: "realstate", point: "5500", title: "Real Estate Account"), DashBoardAccount(imgName: "iportfolio", point: "", title: "iPortfolio By ABC Corp"), DashBoardAccount(imgName: "iportfolio", point: "", title: "iPortfolio Managed")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelDashBoard.delegate = self
        tabelDashBoard.dataSource = self
        tabelDashBoard.separatorStyle = .none
       
        let segmentGrayColor = UIColor(red: 0.889415, green: 0.889436, blue:0.889424, alpha: 1.0 )

//       segmentControl.layer.borderWidth = 1.0
//        segmentControl.layer.cornerRadius = 120
//        segmentControl.layer.borderColor = segmentGrayColor.cgColor
//        segmentControl.layer.masksToBounds = true
//
//
        self.segmentControl.layer.cornerRadius = 15.0;
        self.segmentControl.selectedSegmentTintColor = UIColor.white
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)

        self.segmentControl.layer.borderWidth = 0.1;
        segmentControl.layer.borderColor = segmentGrayColor.cgColor
        self.segmentControl.layer.masksToBounds = true;
        setChart(values: [34.0,43.0,56.0,23.0,56.0,68.0,48.0,120.0,41.0])

        // Do any additional setup after loading the view.
    }
    
    func setChart(values: [Double]) {
        mChart.noDataText = "No data available!"
        for i in 0..<values.count {
            print("chart point : \(values[i])")
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let line1 = LineChartDataSet(entries: dataEntries, label: "Units Consumed")
        line1.colors = [NSUIColor.blue]
        line1.mode = .cubicBezier
        line1.cubicIntensity = 0.2

        let gradient = getGradientFilling()
        line1.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        line1.drawFilledEnabled = true
        
      //  graphdots
        line1.colors = [UIColor.white]
       line1.circleColors = [NSUIColor(red: 140.0/255.0, green: 234.0/255.0, blue: 255.0/255.0, alpha: 1.0)]

    
        let data = LineChartData()
        data.addDataSet(line1)
        mChart.data = data
        mChart.setScaleEnabled(false)
        
        mChart.animate(xAxisDuration: 1.5)
        mChart.drawGridBackgroundEnabled = false
        mChart.xAxis.drawAxisLineEnabled = false
        mChart.xAxis.drawGridLinesEnabled = false
        mChart.leftAxis.drawAxisLineEnabled = false
        mChart.leftAxis.drawGridLinesEnabled = false
        mChart.rightAxis.drawAxisLineEnabled = false
        mChart.rightAxis.drawGridLinesEnabled = false
        mChart.legend.enabled = false
        mChart.xAxis.enabled = true
        mChart.xAxis.labelTextColor = UIColor.white
        mChart.leftAxis.labelTextColor = UIColor.white
        mChart.leftAxis.enabled = true
        mChart.rightAxis.enabled = false
        mChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        mChart.xAxis.drawLabelsEnabled = true
        line1.drawValuesEnabled = false
    


    }
    private func getGradientFilling() -> CGGradient {
        // Setting fill gradient color
        let coloTop = UIColor(red: 141/255, green: 133/255, blue: 220/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 230/255, green: 155/255, blue: 210/255, alpha: 1).cgColor
        // Colors of the gradient
        let gradientColors = [coloTop, colorBottom] as CFArray
        // Positioning of the gradient
        let colorLocations: [CGFloat] = [0.7, 0.0]
        // Gradient Object
        return CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)!
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

extension DashBoardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dashBoardArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashBoardCellID", for: indexPath) as! DashBoardCell
        cell.titleAccount?.text = dashBoardArray[indexPath.row].title
        cell.accountImage?.image = UIImage(named: dashBoardArray[indexPath.row].imgName)
        cell.pointTitle.text = dashBoardArray[indexPath.row].point
        return cell
    }
    
    
}

extension DashBoardVC: UITableViewDelegate {
    
}

extension DashBoardVC: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let y: CGFloat = scrollView.contentOffset.y
           let newHeaderViewHeight: CGFloat = heightConstant.constant - y

           if newHeaderViewHeight > headerViewMaxHeight {
               heightConstant.constant = headerViewMaxHeight
           } else if newHeaderViewHeight < headerViewMinHeight {
               heightConstant.constant = headerViewMinHeight
           } else {
               heightConstant.constant = newHeaderViewHeight
               scrollView.contentOffset.y = 0 // block scroll view
           }
       }
    
}


