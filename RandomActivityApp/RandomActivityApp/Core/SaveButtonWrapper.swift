//
//  SaveButtonWrapper.swift
//  RandomActivityApp
//
//  Created by Rafael Basso on 09/09/21.
//

import UIKit

class SaveButtonWrapper {
    
    enum States {
        case enabled
        case disabled
    }
    
    private var buttonRef: UIButton!
    
    init(_ button: UIButton) {
        buttonRef = button
        buttonRef.titleLabel?.highlightedTextColor = UIColor.darkGray
    }
    
    init(_ button: UIButton, state: States) {
        buttonRef = button
        
        switch state {
            case .enabled:
                enable()
            case .disabled:
                disable()
        }
    }
    
    public func enable() {
        buttonRef.isEnabled = true
        buttonRef.titleLabel!.isHighlighted = false
    }
    
    public func disable() {
        buttonRef.isEnabled = false
        buttonRef.titleLabel!.isHighlighted = true
    }
    
}
