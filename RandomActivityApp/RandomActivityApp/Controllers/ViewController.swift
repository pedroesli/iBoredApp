//
//  ViewController.swift
//  RandomActivityApp
//
//  Created by Pedro Γsli Vieira do Nascimento on 30/08/21.
//

import UIKit
import Alamofire

enum Difficulty: String{
    case Easy
    case Medium
    case Hard
    
    init?(rawValue: Float) {
        let value = Int(rawValue * 100)
        switch value {
        case 0...20:
            self = .Easy
        case 21...45:
            self = .Medium
        case 46...100:
            self = .Hard
        default:
            self = .Easy
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var typeInfoLabel: UILabel!
    @IBOutlet weak var participantInfoLabel: UILabel!
    @IBOutlet weak var difficultyInfoLabel: UILabel!
    @IBOutlet weak var activityInfoLabel: UILabel!
    @IBOutlet weak var randomActivityButton: UIButton!
    
    var isRequesting = false
    let participantEmojis:[String] = ["π","π","π","π","π","π"]
    let randomActivityButtonEmojis:[String] = ["π€©","π€ ","π","π","π","π€","π","π","π","π","π","π","π","π","π","π","πΊ","πΈ","π½"]
    var repeatAnimation: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        configure()
        changeEmoji()
        animate()
    }
    
    func configure(){
        
        if !NetworkUtils.isConnectedToNetwork() {
            
            let alert = UIAlertController(title: "Network Error",
                                          message: "We were unable to detect an internet connection. Please check yout connection and try again.",
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in}))
            self.present(alert, animated: true, completion: nil)
            
            return
            
        }
        
        if isRequesting {
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            self.isRequesting = true
            ActivityRequest.getRandom(type: UserData.getFilters(), complition: { [weak self] result in
                switch result{
                case .success(let activity):
                    DispatchQueue.main.async {
                        self?.typeInfoLabel.text = activity.type.capitalized
                        self?.participantInfoLabel.text = self!.randomParticipantEmojis(participants: activity.participants)
                        let diffuculty = Difficulty(rawValue: activity.accessibility)
                        self?.difficultyInfoLabel.text = diffuculty?.rawValue
                        self?.activityInfoLabel.text = activity.activity
                        self?.isRequesting = false
                    }
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
    
    func randomParticipantEmojis(participants: Int) -> String{
        if participants > 5{
            //Caso tiver uma quantiade maior do que 5 retorna sΓ³ o numero
            return String(participants)
        }
        
        var pa = ""
        for _ in 0...participants{
            let randomIndex = Int.random(in: 0..<participantEmojis.count)
            
            pa = pa + participantEmojis[randomIndex]
        }
        
        return pa
    }
    
    func randomButtonEmoji() -> String{
        let randomIndex = Int.random(in: 0..<randomActivityButtonEmojis.count)
        return randomActivityButtonEmojis[randomIndex]
    }
    
    @IBAction func emojiFaceButtonClicked(_ sender: UIButton) {
        repeatAnimation = false
        changeEmoji()
        animate()
        configure()
    }
    
    func changeEmoji(){
        UIView.performWithoutAnimation {
            randomActivityButton.setTitle(randomButtonEmoji(), for: .normal)
        }
    }
    
    func animate(){
        let oldButtonTransform = randomActivityButton.transform
        let newButtonTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        UIView.animate(withDuration: 0.2, delay: 0,options: [.allowUserInteraction]) {
            self.randomActivityButton.transform = newButtonTransform
        } completion: { done in
            UIView.animate(withDuration: 0.3, delay: 0,options: [.allowUserInteraction]) {
                self.randomActivityButton.transform = oldButtonTransform
            } completion: { done in
                if done && self.repeatAnimation{
                    self.animate()
                }
            }
        }
    }
    
}

