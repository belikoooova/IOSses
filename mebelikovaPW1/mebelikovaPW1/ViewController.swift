//
//  ViewController.swift
//  mebelikovaPW1
//
//  Created by Мария Беликова on 13.09.2023.
//

import UIKit

// MARK: - UIColor extension (init with HEX)

extension UIColor {
    convenience init(hex: String) {
        let r, g, b : CGFloat
        let scanner = Scanner(string: hex)
        var hexNumber : UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            r = CGFloat(((hexNumber & 0xff0000) >> 16)) / 255
            g = CGFloat(((hexNumber & 0x00ff00) >> 8)) / 255
            b = CGFloat((hexNumber & 0x0000ff)) / 255
            self.init(red: r, green: g, blue: b, alpha: 1)
            return
        }
        self.init(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

// MARK: - Main

class ViewController: UIViewController {
    @IBOutlet var views: [UIButton]!
    @IBOutlet weak var translateButton: UISwitch!
    @IBOutlet weak var translatedText: UITextView!
    
    // MARK: - Translate function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColorsOfBUttonsRandomely()
        changeCornersRadiusesOfButtonsRandomely()
        translateButton.isOn = false
    }
    
    // MARK: - Translating switch function
    
    @IBAction func translateSwitchDidChange(_ sender: UISwitch) {
        if sender.isOn {
            translatedText.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            translatedText.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    // MARK: - Pressing buttons function

    @IBAction func buttonWasPressed(_ sender: Any) {
        UIView.animate(
            withDuration: 3.51,
            animations: {
                self.changeColorsOfBUttonsRandomely()
                self.changeCornersRadiusesOfButtonsRandomely()
            },
            completion: {_ in
                for view in self.views {
                    view.isEnabled = true
                }
            }
        )
    }
    
    // MARK: - Change corner function
    
    private func changeCornersRadiusesOfButtonsRandomely() {
        for i in 0..<views.count {
            views[i].layer.cornerRadius = .random(in: 0...25)
        }
    }
    
    // MARK: - Change color functions
    
    private func changeColorsOfBUttonsRandomely() {
        let randomColors : [UIColor] = getUniqueColors(numberOfColors: Int64(views.count))
        for i in 0..<views.count {
            views[i].backgroundColor = randomColors[i]
        }
    }
    
    private func getUniqueColors(numberOfColors : Int64) -> [UIColor] {
        let hexColors : [String] = getRandomHexRange(numberOfColors: numberOfColors)
        var randomColors : [UIColor] = []
        for hexColor in hexColors {
            randomColors.append(UIColor(hex: hexColor))
        }
        
        return randomColors
    }
    
    private func getRandomHexRange(numberOfColors : Int64) -> [String] {
        let maxValueOfHex : Int64 = 16777216
        var numbers = Set<Int64>()
        while numbers.count < numberOfColors {
            numbers.insert(.random(in: 0..<maxValueOfHex))
        }
        
        var hexStrings : [String] = []
        while !numbers.isEmpty {
            hexStrings.append(String(format:"%06x", numbers.popFirst() ?? 0))
        }
        
        return hexStrings
    }
}
