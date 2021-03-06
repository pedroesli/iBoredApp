//
//  SecondViewController.swift
//  RandomActivityApp
//
//  Created by Gustavo da Silva Braghin on 09/09/21.
//

import UIKit
import SwiftUI

class SecondViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    
    public var saveButtonWrapper: SaveButtonWrapper!
    
    private var swiftUIView: SwiftUIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.titleLabel?.highlightedTextColor = UIColor.darkGray
        saveButtonWrapper = SaveButtonWrapper(saveButton, state: .disabled)
        
        swiftUIView = SwiftUIView(saveButton: saveButtonWrapper)
        
        let controller = UIHostingController(rootView: swiftUIView)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(controller)
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
        
        controller.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        controller.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        controller.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        saveButtonWrapper.disable()
        UserData.saveFilters()
    }
    
}
