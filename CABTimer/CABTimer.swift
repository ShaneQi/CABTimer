//
//  CABTimer.swift
//  CarAndBike
//
//  Created by Shane Qi on 8/16/16.
//  Copyright © 2016 AuctionSoftware. All rights reserved.
//

import UIKit

class CABTimer: UIView {
	
	private var height: CGFloat!
	private var width: CGFloat!
	
	private var iconView = UIView()
	
	private var daysView = CABTimerCell()
	private var hoursView = CABTimerCell()
	private var minutesView = CABTimerCell()
	private var secondsView = CABTimerCell()
	
	private var endDate: NSDate!
	
	private var views: [CABTimerCell] { return [daysView, hoursView, minutesView, secondsView] }
	
	private var daysColor = UIColor(red: 164/255, green: 210/255, blue: 113/255, alpha: 1)
	private var hoursColor = UIColor(red: 251/255, green: 207/255, blue: 100/255, alpha: 1)
	private var minutesColor = UIColor(red: 250/255, green: 181/255, blue: 104/255, alpha: 1)
	private var secondColor = UIColor(red: 239/255, green: 97/255, blue: 113/255, alpha: 1)
	private var invalidColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
	
	init(to endDate: NSDate, height: CGFloat) {
		super.init(frame: CGRectZero)
		self.height = height
		self.translatesAutoresizingMaskIntoConstraints = false
		self.heightAnchor.constraintEqualToConstant(self.height).active = true
		self.backgroundColor = UIColor.whiteColor()
		self.clipsToBounds = true

		views.forEach({
			
			self.addSubview($0)
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.heightAnchor.constraintEqualToConstant(height).active = true
			$0.widthAnchor.constraintEqualToConstant(height*1.2).active = true
			$0.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
			
			$0.digitalLabel.font = UIFont.monospacedDigitSystemFontOfSize(height/3, weight: 0)
			$0.textLabel.font = UIFont.systemFontOfSize(height/4)
			
		})
		
		self.addSubview(iconView)
		iconView.translatesAutoresizingMaskIntoConstraints = false
		iconView.heightAnchor.constraintEqualToConstant(height).active = true
		iconView.widthAnchor.constraintEqualToConstant(height).active = true
		iconView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
		iconView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 0).active = true
		let iconImage = UIImageView()
		iconView.addSubview(iconImage)
		iconImage.translatesAutoresizingMaskIntoConstraints = false
		iconImage.heightAnchor.constraintEqualToAnchor(iconView.heightAnchor, constant: -20).active = true
		iconImage.widthAnchor.constraintEqualToAnchor(iconView.widthAnchor, constant: -20).active = true
		iconImage.image = UIImage(named: "clock")
		iconImage.contentMode = .ScaleAspectFit
		iconImage.centerXAnchor.constraintEqualToAnchor(iconView.centerXAnchor).active = true
		iconImage.centerYAnchor.constraintEqualToAnchor(iconView.centerYAnchor).active = true
		
		daysView.leadingAnchor.constraintEqualToAnchor(iconView.trailingAnchor, constant: 0.5).active = true
		daysView.textLabel.text = "DAYS"
		hoursView.leadingAnchor.constraintEqualToAnchor(daysView.trailingAnchor, constant: 0.5).active = true
		hoursView.textLabel.text = "HRS"
		minutesView.leadingAnchor.constraintEqualToAnchor(hoursView.trailingAnchor, constant: 0.5).active = true
		minutesView.textLabel.text = "MIN"
		secondsView.leadingAnchor.constraintEqualToAnchor(minutesView.trailingAnchor, constant: 0.5).active = true
		secondsView.textLabel.text = "SEC"
		secondsView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor,constant: 0).active = true
		
		self.layer.cornerRadius = height/2
		self.layer.borderWidth = 0.5
		self.layer.borderColor = invalidColor.CGColor
		
		self.endDate = endDate
		refresh()
		let _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.refresh), userInfo: nil, repeats: true)
		
	}
	
	func refresh() {
		let interval = endDate.timeIntervalSinceNow
		
		guard interval >= 0 else { return }
		
		let days = floor(interval / 60 / 60 / 24)
		let hours = floor(interval / 60 / 60 % 24)
		let minutes = floor(interval / 60 % 60)
		let seconds = floor(interval % 60)
		daysView.digitalLabel.text = String(format: "%02.0f", arguments: [days])
		hoursView.digitalLabel.text = String(format: "%02.0f", arguments: [hours])
		minutesView.digitalLabel.text = String(format: "%02.0f", arguments: [minutes])
		secondsView.digitalLabel.text = String(format: "%02.0f", arguments: [seconds])
		
		var invalidViews = [CABTimerCell]()
		for (index, number) in [days, hours, minutes, seconds].enumerate() {
			if number < 1 { invalidViews.append(views[index]) }
			else {break}
		}
		
		var validColor = daysColor
		if invalidViews.count == 1 { validColor = hoursColor }
		else if invalidViews.count == 2 { validColor = minutesColor }
		else if invalidViews.count == 3 { validColor = secondColor }
		
		for view in views {
			if invalidViews.contains(view) {
				view.backgroundColor = invalidColor
			}
			else {
				view.backgroundColor = validColor
			}
			
		}
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
