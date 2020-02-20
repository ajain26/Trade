//
//  PortFolioServiceCell.swift
//  Trade
//
//  Created by Anshul on 30/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit
import Charts


class PortFolioServiceCell: UITableViewCell {
    @IBOutlet weak var lblServices: UILabel!
    @IBOutlet weak var serviceprice: UILabel!
    @IBOutlet weak var servicepoints: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var mChart: LineChartView!
    @IBOutlet weak var buyButton: UIButton!
    var buyButtonHandler = { }
    var dataEntries: [ChartDataEntry] = []



    override func awakeFromNib() {
        super.awakeFromNib()
          let segmentGrayColor = UIColor(red: 0.889415, green: 0.889436, blue:0.889424, alpha: 1.0 )

        //       segmentControl.layer.borderWidth = 1.0
        //        segmentControl.layer.cornerRadius = 120
        //        segmentControl.layer.borderColor = segmentGrayColor.cgColor
        //        segmentControl.layer.masksToBounds = true
        //
        //
                self.segmentControl?.layer.cornerRadius = 15.0;
                self.segmentControl?.selectedSegmentTintColor = UIColor(red: 0/255, green: 135/255, blue: 225/255, alpha: 1)
                segmentControl?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
                self.segmentControl?.layer.borderWidth = 0.5;
                segmentControl?.layer.borderColor = segmentGrayColor.cgColor
                self.segmentControl?.layer.masksToBounds = true;
         setChart(values: [10000,50000,80000,10000,56000.0,68000.0,48000.0,120.0,41000.0,50000,35664,33223])
        
        if let buyButton = buyButton {
//            buyButton.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 15.0)
//            buyButton.layer.borderColor = UIColor.lightGray.cgColor
            
            buyButton.setTitleColor(UIColor().hexStringToUIColor(hex: "#0176DD"), for: .normal)
        
            //    buyButton.backgroundColor = UIColor().hexStringToUIColor(hex: "#0176DD")
            buyButton.layer.borderColor = UIColor.gray.cgColor
            buyButton.layer.borderWidth = 2
          //  buyButton.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 15.0)
            buyButton.layer.cornerRadius = 15
            buyButton.setTitle("Buy", for: .normal)
        }
        // Initialization code
    }
    
    func setChart(values: [Double]) {
        if let mChart = mChart{
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
        line1.colors = [UIColor(red: 15/255, green: 182/255, blue: 186/255, alpha: 1)]
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
        
        mChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"])
        mChart.xAxis.granularity = 1
        mChart.xAxis.labelCount = 12
    
        let formatter = NumberFormatter()
        formatter.positiveFormat = "0K"
        formatter.multiplier = 0.001
        mChart.leftAxis.valueFormatter = DefaultAxisValueFormatter.init(formatter: formatter)
        mChart.leftAxis.granularityEnabled = true
        mChart.leftAxis.granularity = 1
        mChart.leftAxis.labelCount = 4
        mChart.leftAxis.axisMinimum = 0
        mChart.leftAxis.forceLabelsEnabled = true
        
        mChart.xAxis.labelTextColor = UIColor.black
        mChart.leftAxis.labelTextColor = UIColor.black
        mChart.leftAxis.enabled = true
        mChart.rightAxis.enabled = false
        mChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        mChart.xAxis.drawLabelsEnabled = true
        mChart.leftAxis.drawLabelsEnabled = true
        line1.drawValuesEnabled = false
    

        }
    }
    private func getGradientFilling() -> CGGradient {
           // Setting fill gradient color
           let coloTop = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1).cgColor
        let colorBottom = UIColor.white.cgColor
           // Colors of the gradient
           let gradientColors = [coloTop, colorBottom] as CFArray
           // Positioning of the gradient
           let colorLocations: [CGFloat] = [0.7, 0.0]
           // Gradient Object
           return CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)!
       }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: Services){
        lblServices.text = model.title
        serviceprice.text = model.serviceprice
        servicepoints.text = model.servicepoints
    }
    @IBAction func buyButtonClicked(){
        buyButtonHandler()
    }

}
