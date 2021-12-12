//
//  DashedLineButton.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation
import UIKit

class DashedLineButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.sublayers?.filter({ $0.name == "DashedBottomLine" }).map({ $0.removeFromSuperlayer() })
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "DashedBottomLine"
        shapeLayer.bounds = bounds
        shapeLayer.position = CGPoint(x: (frame.width / 2) - 2, y: frame.height + 12)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = AppColor.blueDot.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [2, 2]
        
        let path = CGMutablePath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: self.intrinsicContentSize.width + 4 , y: 0))
        shapeLayer.path = path
        
        layer.addSublayer(shapeLayer)
        
    }
}
