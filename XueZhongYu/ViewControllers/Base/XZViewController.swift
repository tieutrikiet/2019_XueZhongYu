//
//  XZViewController.swift
//  XueZhongYu
//
//  Created by Kiệt Tiêu on 10/21/19.
//  Copyright © 2019 KietTieu. All rights reserved.
//

import UIKit

class XZViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackTitle(nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\n\n= = = \(self) appeared!")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        print("\n\n= = = Deinit: ", self)
    }
}

// MARK: - Common methods
extension XZViewController {
    func setTitle(_ title: String?) {
        self.navigationItem.title = title
    }
    
    func setTitle(_ titleView: UIView?) {
        self.navigationItem.titleView = titleView
    }
    
    func setBackTitle(_ title: String?) {
        let backButton = UIBarButtonItem(title: title ?? " ", style: .plain, target: self, action: nil)
        backButton.tintColor = XZ_Color.TintColor.text.color()
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

// MARK: - UIViewController extensions
extension UIViewController {
    /// This function will show an alert with an offical title and message.
    /// If ok or cancel action is not nil, it will display in this alert.
    func showAlert(_ title: String?, _ message: String?, okAction: ((UIAlertAction)->Void)?, cancelAction: ((UIAlertAction)->Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let action = cancelAction {
            let cancel = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: action)
            alert.addAction(cancel)
        }
        
        let ok = UIAlertAction(title: "OK".localized, style: .destructive, handler: okAction)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /// Present an alert controller with available data from parameters.
    /// If an array of actions are included in alert controller, alert will show these actions.
    /// Unless only show an action is OK.
    func showAlert(_ title: String?, _ message: String?, actions: [UIAlertAction]?, alertType: UIAlertController.Style = .alert) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let actions = actions {
            actions.forEach { (action) in
                alert.addAction(action)
            }
        } else {
            let ok = UIAlertAction(title: "OK".localized, style: .default, handler: nil)
            alert.addAction(ok)
        }
        
        let alertStyle = UIAlertViewStyle.plainTextInput
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /// Present a default alert to show "Something went wrong" popup.
    func showSomethingWentWrong() {
        self.showAlert("", "error_message_default".localized, actions: nil)
    }
    
    /// Present an alert to show error was responded from cloud functions.
    func showError(from error: Error?) {
        let message = error?.getErrorMessage() ?? "error_message_default".localized
        self.showAlert("", message, actions: nil)
    }
}
