//
//  DonutChartView.swift
//  chart
//
//  Created by Josie.Chung on 2024/7/22.
//

import UIKit

class DonutChartView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDonutChart()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDonutChart()
    }

    private func setupDonutChart() {
        // 定義各個部分的百分比
        var percentages: [Double] = [49.6, 20, 9.8, 8, 12.6]

        // 將角度轉換為弧度的常量
        let aDegree = Double.pi / 180
        // 設置線寬（即甜甜圈的寬度）
        let lineWidth: Double = 15
        // 設置圓的半徑
        let radius: Double = 70
        // 設置起始角度（270度，即12點鐘方向）
        var startDegree: Double = 270
        // 計算圓心位置
        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        // 遍歷每個百分比，繪製對應的圓弧
        for percentage in percentages {
            // 計算結束角度
            let endDegree = startDegree + 360 * percentage / 100
            
            // 創建圓弧路徑
            let percentagePath = UIBezierPath(
                arcCenter: center,
                radius: radius,
                startAngle: aDegree * startDegree,
                endAngle: aDegree * endDegree,
                clockwise: true
            )
            
            // 創建形狀層
            let percentageLayer = CAShapeLayer()
            percentageLayer.path = percentagePath.cgPath
            
            // 設置隨機顏色
            percentageLayer.strokeColor = UIColor(
                red: .random(in: 0...1),
                green: .random(in: 0.35...1),
                blue: 1,
                alpha: 1
            ).cgColor
            
            // 設置線寬
            percentageLayer.lineWidth = lineWidth
            
            // 設置填充顏色為透明
            percentageLayer.fillColor = UIColor.clear.cgColor
            
            // 將形狀層添加到視圖的圖層中
            layer.addSublayer(percentageLayer)
            
            // 更新起始角度為當前的結束角度，為下一個部分做準備
            startDegree = endDegree
        }
        addLabels()
    }
    
    
    private func addLabels() {
        let titleLabel = createLabel(text: "TWD", fontSize: 14, textColor: .darkGray, yOffset: -30)
        let valueLabel = createLabel(text: "100", fontSize: 16, textColor: .black, yOffset: 0)
        let unitLabel = createLabel(text: "(-4.46%)", fontSize: 12, textColor: .systemGreen, yOffset: 30)
        
        addSubview(titleLabel)
        addSubview(valueLabel)
        addSubview(unitLabel)
    }
    
    private func createLabel(text: String, fontSize: CGFloat, textColor: UIColor, yOffset: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = textColor
        label.sizeToFit()
        label.center = CGPoint(x: bounds.midX, y: bounds.midY + yOffset)
        return label
    }
}


