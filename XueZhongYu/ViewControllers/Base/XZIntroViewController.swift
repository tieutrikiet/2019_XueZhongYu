//
//  XZIntroViewController.swift
//  XueZhongYu
//
//  Created by Kiệt Tiêu on 10/21/19.
//  Copyright © 2019 KietTieu. All rights reserved.
//

import UIKit

class XZIntroViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.alpha = 0.0
        logoImageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showLogoView()
    }
    
    fileprivate func showLogoView() {
        UIView.animate(withDuration: 2.0,
                       delay: 1.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        self.logoImageView.transform = .identity
                        self.logoImageView.alpha = 1.0
        }, completion: nil)
    }
}
