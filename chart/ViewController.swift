//
//  ViewController.swift
//  chart
//
//  Created by Josie.Chung on 2024/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chartView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 計算甜甜圈圖表的大小
        let chartSize: CGFloat = 100
        
        // 創建甜甜圈圖表視圖
        let donutChartView = DonutChartView(frame: CGRect(x: 0, y: 0, width: chartSize, height: chartSize))
        
        donutChartView.translatesAutoresizingMaskIntoConstraints = false
        // 將甜甜圈圖表視圖添加到主視圖
        chartView.addSubview(donutChartView)

        NSLayoutConstraint.activate([
            donutChartView.centerXAnchor.constraint(equalTo: chartView.centerXAnchor),
            donutChartView.centerYAnchor.constraint(equalTo: chartView.centerYAnchor),
            donutChartView.widthAnchor.constraint(equalToConstant: chartSize),
            donutChartView.heightAnchor.constraint(equalToConstant: chartSize)
        ])
        
    }

}

