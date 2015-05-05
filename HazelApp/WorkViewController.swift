//
//  WorkViewController.swift
//  HazelApp
//
//  Created by Hazel Llanes on 2015-05-03.
//  Copyright (c) 2015 Hazel Llanes. All rights reserved.
//

import UIKit
import MessageUI

class WorkViewController: UIViewController, MFMailComposeViewControllerDelegate  {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBOutlet weak var workLink01: UIButton!
    @IBOutlet weak var workLink02: UIButton!
    @IBOutlet weak var workLink03: UIButton!
    @IBOutlet weak var workLink04: UIButton!
    @IBOutlet weak var sendMailButton: UIButton!
    
    @IBOutlet weak var sendMailButtonConstraint: NSLayoutConstraint!
    
    @IBAction func workLink01(sender: AnyObject) {
        if let url = NSURL(string: "http://llanes.ca") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func workLink02(sender: AnyObject) {
        if let url = NSURL(string: "http://llanes.ca/class/5") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    @IBAction func workLink03(sender: AnyObject) {
        if let url = NSURL(string: "http://alexandravotsis.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    @IBAction func workLink04(sender: AnyObject) {
        if let url = NSURL(string: "http://ibbyandpop.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    @IBAction func sendMailButton(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // ANIMATIONS
        //sendMailButtonConstraint.constant -= view.bounds.width
        workLink01.alpha = 0.0
        workLink02.alpha = 0.0
        workLink03.alpha = 0.0
        workLink04.alpha = 0.0
        sendMailButton.alpha = 0.0

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.8, delay: 0.5, usingSpringWithDamping: 9.0, initialSpringVelocity: 15,
            options: .CurveEaseIn, animations: {
            self.workLink01.alpha = 1.0
            //self.sendMailButtonConstraint.constant += self.view.bounds.width
        }, completion: nil)
        UIView.animateWithDuration(0.8, delay: 0.8, options: .CurveEaseInOut, animations: {
            self.workLink02.alpha = 1.0
        }, completion: nil)
        UIView.animateWithDuration(0.8, delay: 1.1, options: .CurveEaseInOut, animations: {
            self.workLink03.alpha = 1.0
        }, completion: nil)
        UIView.animateWithDuration(0.8, delay: 1.4, options: .CurveEaseInOut, animations: {
            self.workLink04.alpha = 1.0
        }, completion: nil)
        UIView.animateWithDuration(0.8, delay: 1.7, options: .CurveEaseInOut, animations: {
            self.sendMailButton.alpha = 1.0
        }, completion: nil)
    }
    
    // MAIL
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["hello@hzl.ca"])
        mailComposerVC.setSubject("Hello!")
        mailComposerVC.setMessageBody("--\n\nEmail sent from HazelApp\n", isHTML: false)
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail. Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
