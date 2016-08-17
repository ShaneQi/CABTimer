//
//  CABTimerCell.swift
//  CarAndBike
//
//  Created by Shane Qi on 8/16/16.
//  Copyright © 2016 AuctionSoftware. All rights reserved.
//

import UIKit

class CABTimerCell: UIView {

	var digitalLabel = UILabel()
	
	var textLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.backgroundColor = UIColor.greenColor()
		
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(textLabel)
		textLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
		textLabel.heightAnchor.constraintEqualToAnchor(self.heightAnchor, multiplier: 0.5).active = true
		textLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
		textLabel.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
		textLabel.textAlignment = .Center
		textLabel.textColor = UIColor.whiteColor()
		textLabel.text = "HOURS"
		
		digitalLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(digitalLabel)
		digitalLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
		digitalLabel.heightAnchor.constraintEqualToAnchor(self.heightAnchor, multiplier: 0.4).active = true
		digitalLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
		digitalLabel.bottomAnchor.constraintEqualToAnchor(textLabel.topAnchor).active = true
		digitalLabel.textAlignment = .Center
		digitalLabel.textColor = UIColor.whiteColor()
		digitalLabel.text = "00"
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
