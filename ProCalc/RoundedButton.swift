//
//  RoundedButton.swift
//  ProCalc
//
//  Created by Nils Grabenhorst on 08.11.17.
//  Copyright © 2017 SinnerSchrader Swipe. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = min(bounds.size.width, bounds.size.height) * 0.5
	}

}
