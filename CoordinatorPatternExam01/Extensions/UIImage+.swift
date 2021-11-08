//
//  UIImage+.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/08.
//

import UIKit

extension UIImage {
    
    static func imageFromColor(_ color: UIColor, frame: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContext(frame.size)
        color.setFill()
        UIRectFill(frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
