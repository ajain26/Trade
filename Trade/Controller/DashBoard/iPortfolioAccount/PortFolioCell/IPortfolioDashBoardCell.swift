//
//  IPortfolioDashBoardCell.swift
//  Trade
//
//  Created by Anshul on 01/02/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit
import Charts

class IPortfolioDashBoardCell: UITableViewCell {
   @IBOutlet var chartView: BarChartView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    self.setup(barLineChartView: chartView)
              // chartView.delegate = self
                
                chartView.drawBarShadowEnabled = false
                chartView.drawValueAboveBarEnabled = false
                chartView.maxVisibleCount = 60
                
                 let xAxis = chartView.xAxis
                        xAxis.labelPosition = .bottom
                        xAxis.labelFont = .systemFont(ofSize: 10)
                        xAxis.labelTextColor = UIColor.white
                        xAxis.granularity = 0
                        xAxis.labelCount = 12
                        xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Jan","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"])
        //                let leftAxisFormatter = NumberFormatter()
        //                leftAxisFormatter.minimumFractionDigits = 0
        //                leftAxisFormatter.maximumFractionDigits = 1
        //                leftAxisFormatter.negativeSuffix = " $"
        //                leftAxisFormatter.positiveSuffix = " $"
        //
        //                let leftAxis = chartView.leftAxis
        //                leftAxis.labelFont = .systemFont(ofSize: 10)
        //                leftAxis.labelCount = 8
        //                leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
        //                leftAxis.labelPosition = .outsideChart
        //                leftAxis.spaceTop = 0.15
        //                leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
        //
        //                let rightAxis = chartView.rightAxis
        //                rightAxis.enabled = true
        //                rightAxis.labelFont = .systemFont(ofSize: 10)
        //                rightAxis.labelCount = 8
        //                rightAxis.valueFormatter = leftAxis.valueFormatter
        //                rightAxis.spaceTop = 0.15
        //                rightAxis.axisMinimum = 0
                               chartView.drawGridBackgroundEnabled = false
                               chartView.xAxis.drawAxisLineEnabled = false
                               chartView.xAxis.drawGridLinesEnabled = false
                               chartView.leftAxis.drawAxisLineEnabled = false
                               chartView.leftAxis.drawGridLinesEnabled = false
                               chartView.rightAxis.drawAxisLineEnabled = false
                               chartView.rightAxis.drawGridLinesEnabled = false
                               chartView.legend.enabled = false
                               chartView.rightAxis.enabled = false
                               chartView.leftAxis.enabled = false

        //                let l = chartView.legend
        //                l.horizontalAlignment = .left
        //                l.verticalAlignment = .bottom
        //                l.orientation = .horizontal
        //                l.drawInside = false
        //                l.form = .circle
        //                l.formSize = 9
        //                l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        //                l.xEntrySpace = 4
                     self.setDataCount(Int(10.0) + 1, range: UInt32(50.0))

                //        chartView.legend = l

        //                let marker = XYMarkerView(color: UIColor(white: 180/250, alpha: 1),
        //                                          font: .systemFont(ofSize: 12),
        //                                          textColor: .white,
        //                                          insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8),
        //                                          xAxisValueFormatter: chartView.xAxis.valueFormatter!)
        //                marker.chartView = chartView
        //                marker.minimumSize = CGSize(width: 80, height: 40)
        //                chartView.marker = marker
                        

                // Do any additional setup after loading the view.
                
                
            
            }
            
            func setup(barLineChartView chartView: BarLineChartViewBase) {
                  chartView.chartDescription?.enabled = false
                  chartView.dragEnabled = true
                  chartView.setScaleEnabled(true)
                  chartView.pinchZoomEnabled = false
                  // ChartYAxis *leftAxis = chartView.leftAxis;
                  let xAxis = chartView.xAxis
                  xAxis.labelPosition = .bottom
                  chartView.rightAxis.enabled = false
              }
            
            func setDataCount(_ count: Int , range: UInt32) {
                    let start = 1
                    
                    let yVals = (start..<start+count+1).map { (i) -> BarChartDataEntry in
                        let mult = range + 1
                        let val = Double(arc4random_uniform(mult))
                        if arc4random_uniform(100) < 25 {
                            return BarChartDataEntry(x: Double(i), y: val, icon: UIImage(named: "icon"))
                        } else {
                            return BarChartDataEntry(x: Double(i), y: val)
                        }
                    }
                    
                    var set1: BarChartDataSet! = nil
                    if let set = chartView.data?.dataSets.first as? BarChartDataSet {
                        set1 = set
                        set1.replaceEntries(yVals)
                        chartView.data?.notifyDataChanged()
                        chartView.notifyDataSetChanged()
                    } else {
                        set1 = BarChartDataSet(entries: yVals, label: "")
        //              set1.colors = ChartColorTemplates.material()
                        set1.colors = [UIColor.white]
                        set1.drawValuesEnabled = false

                        let data = BarChartData(dataSet: set1)
                       data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
                        data.barWidth = 0.6
                        chartView.data = data
                    }
                    
                  chartView.setNeedsDisplay()
                }
                

}
