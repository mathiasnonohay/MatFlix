//
//  LayoutHelper.swift
//  MatFlix
//
//  Created by Mathias on 02/03/2023.
//

import UIKit

struct LayoutHelper {
    static func showLoading(view: UIView)  {
        let activityIndicatorBackground = UIView()
        activityIndicatorBackground.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityIndicatorBackground.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        activityIndicatorBackground.tag = 500
        view.addSubview(activityIndicatorBackground)
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = UIColor.white
        activityIndicator.sizeToFit()
        activityIndicator.center = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.5)
        activityIndicator.startAnimating()
        
        activityIndicatorBackground.addSubview(activityIndicator)
    }
    
    static func hideLoading(view: UIView) {
        for subview in view.subviews where subview.tag == 500 {
            subview.removeFromSuperview()
        }
    }
}
