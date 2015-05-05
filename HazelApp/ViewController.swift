//
//  ViewController.swift
//  HazelApp
//
//  Created by Hazel Llanes on 2015-04-26.
//  Copyright (c) 2015 Hazel Llanes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UIImageView!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        
        textView.textAlignment = .Center
        textView.text = "I am a web designer and web developer with an affinity for good typography, clean markup and spinach pizza."
 
        self.startButton.layer.cornerRadius = 20.0
        
        var imgOne = UIImageView(frame: CGRectMake(0, 0,scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "bg1")
        var imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0,scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "bg2")
        var imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0,scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "bg3")
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 3, self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        // Test the offset and calculate the current page after scrolling ends
        var pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        var currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        
        // Change the text
        if Int(currentPage) == 0{
            textView.text = "I am a web designer and web developer with an affinity for good typography, clean markup and spinach pizza"
        }else if Int(currentPage) == 1{
            textView.text = "The projects I like to take on the most are the ones that make a positive impact in the community and allow me to collaborate with good, smart people."
        }else{
            textView.text = "I enjoy coming up with creative ways to tackle a problem, always iterating and keeping an open mind every step of the way."
            
            // Fade in button
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.startButton.alpha = 1.0
            })
        }
    }
    
    // ANIMATE - BEFORE
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        logo.center.y = view.bounds.height - 30
        logo.alpha = 0.0
        name.alpha = 0.0
        textView.alpha = 0.0
    }
    
    // ANIMATE - AFTER
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1.5, delay: 0.5, usingSpringWithDamping: 9.0, initialSpringVelocity: 15,
            options: .CurveEaseInOut, animations: {
                self.logo.center.y = self.view.bounds.height / 4
                self.logo.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(0.8, delay: 1.0, options: .CurveEaseInOut, animations: {
                self.name.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(0.8, delay: 1.5, options: .CurveEaseInOut, animations: {
                self.textView.alpha = 1.0
            }, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}