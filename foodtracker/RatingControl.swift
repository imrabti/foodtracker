//
//  RatingControl.swift
//  foodtracker
//
//  Created by Idriss Mrabti on 28/12/15.
//  Copyright © 2015 Nuvola. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Constants
    let spacing: Int = 5
    let stars: Int = 5
    
    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButton = [UIButton]()
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let button = UIButton()
            button.addTarget(self, action: "ratingButtonTaped:", forControlEvents: .TouchDown)
            button.adjustsImageWhenHighlighted = false
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            ratingButton += [button]
            addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index, button) in ratingButton.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    // MARK: Button Action
    func ratingButtonTaped(button: UIButton) {
        rating = ratingButton.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButton.enumerate() {
            button.selected = index < rating
        }
    }
}
