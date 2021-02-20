//
//  LoadingViewController.swift
//  BeerViewer
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    var loadingActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .white
        indicator.startAnimating()
        indicator.autoresizingMask = [.flexibleLeftMargin,
                                      .flexibleRightMargin,
                                      .flexibleTopMargin,
                                      .flexibleBottomMargin]
        return indicator
    }()
    
    var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.8
        blurEffectView.autoresizingMask = [
            .flexibleWidth, .flexibleHeight
        ]
        return blurEffectView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        // Add the blurEffectView with the same
        // size as view
        blurEffectView.frame = self.view.bounds
        view.insertSubview(blurEffectView, at: 0)
        
        // Add the loadingActivityIndicator in the
        // center of view
        loadingActivityIndicator.center = CGPoint(
            x: view.bounds.midX,
            y: view.bounds.midY
        )
        view.addSubview(loadingActivityIndicator)
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//        blurEffectView.frame = self.view.bounds
//        view.insertSubview(blurEffectView, at: 0)
//        loadingActivityIndicator.center = CGPoint(
//            x: view.bounds.midX,
//            y: view.bounds.midY
//        )
//        view.addSubview(loadingActivityIndicator)
//    }
}
