import UIKit

// 定義各個部分的百分比
var percentages: [Double] = [49.6, 20, 9.8, 8, 12.6]

// 將角度轉換為弧度的常量
let aDegree = Double.pi / 180
// 設置線寬（即甜甜圈的寬度）
let lineWidth: Double = 20
// 設置圓的半徑
let radius: Double = 80
// 設置起始角度（270度，即12點鐘方向）
var startDegree: Double = 270

// 計算視圖的寬度
let viewWidth = 2*(radius+lineWidth)
// 創建視圖
let view = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewWidth))

// 計算圓心位置
let center = CGPoint(x: lineWidth + radius, y: lineWidth + radius)

// 遍歷每個百分比，繪製對應的圓弧
for percentage in percentages {
    // 計算結束角度
    let endDegree = startDegree + 360 * percentage / 100
    
    // 創建圓弧路徑
    let percentagePath = UIBezierPath(arcCenter: center,
                                      radius: radius,
                                      startAngle: aDegree * startDegree,
                                      endAngle: aDegree * endDegree,
                                      clockwise: true)
    
    // 創建形狀層
    let percentageLayer = CAShapeLayer()
    percentageLayer.path = percentagePath.cgPath
    
    // 設置隨機顏色
    percentageLayer.strokeColor = UIColor(red: .random(in: 0...1),
                                          green: .random(in: 0.35...1),
                                          blue: 1,
                                          alpha: 1).cgColor
    
    // 設置線寬
    percentageLayer.lineWidth = lineWidth
    
    // 設置填充顏色為透明
    percentageLayer.fillColor = UIColor.clear.cgColor
    
    // 將形狀層添加到視圖的圖層中
    view.layer.addSublayer(percentageLayer)
    
    // 更新起始角度為當前的結束角度，為下一個部分做準備
    startDegree = endDegree
}

// 創建中心標籤的函數
func createCenterLabel(text: String, fontSize: CGFloat, yOffset: CGFloat) -> UILabel {
    let label = UILabel()
    label.text = text
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: fontSize)
    label.sizeToFit()
    label.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY + yOffset)
    return label
}

// 創建三個標籤
let titleLabel = createCenterLabel(text: "總計", fontSize: 16, yOffset: -20)
let valueLabel = createCenterLabel(text: "100", fontSize: 24, yOffset: 10)
let unitLabel = createCenterLabel(text: "單位", fontSize: 14, yOffset: 30)

// 將標籤添加到視圖
view.addSubview(titleLabel)
view.addSubview(valueLabel)
view.addSubview(unitLabel)



// 返回創建的視圖
view
