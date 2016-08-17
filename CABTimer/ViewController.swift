//
//  ViewController.swift
//  CABTimer
//
//  Created by Shane Qi on 8/17/16.
//  Copyright © 2016 Shane Qi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let timer0 = CABTimer(to: NSDate(timeIntervalSinceNow: 86420), height: 60)
		let timer1 = CABTimer(to: NSDate(timeIntervalSinceNow: 3620), height: 60)
		let timer2 = CABTimer(to: NSDate(timeIntervalSinceNow: 80), height: 60)
		let timer3 = CABTimer(to: NSDate(timeIntervalSinceNow: 20), height: 60)
		
		self.view.addSubview(timer0)
		self.view.addSubview(timer1)
		self.view.addSubview(timer2)
		self.view.addSubview(timer3)
		
		timer0.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
		timer1.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
		timer2.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
		timer3.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
		
		timer0.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 100).active = true
		timer1.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 200).active = true
		timer2.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 300).active = true
		timer3.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 400).active = true
	}

}

