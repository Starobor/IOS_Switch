//
//  ViewController.swift
//  Switch
//
//  Created by Citizen on 02.09.2018.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let WIDTH_SCREEN = Int(UIScreen.main.bounds.size.width)
    let HEIGHT_SCREEN = Int(UIScreen.main.bounds.size.height)
    
    let backgroundSwitch = UISwitch()
    let clikerButton = UIButton()
    let clikerLabel = UILabel()
    let colorBlack = UIColor(red: 40/255, green: 43/255, blue: 53/255, alpha: 1)
    
    var countCliked = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        addSwitch()
        addButton()
        addLabel()
    }
    
    
    func addSwitch() {
        //self.backgroundSwitch.frame = CGRect.zero  ???
        
        self.backgroundSwitch.center = self.view.center
        self.view.addSubview(self.backgroundSwitch)
        self.backgroundSwitch.addTarget(self, action: #selector(switchChangeBackground(paramTarget:)), for: .valueChanged)
    }

    func addButton() {
        let widthButton = 200
        let heightButton = 30
        let margin = 20
        
        self.clikerButton.frame = CGRect(x: (WIDTH_SCREEN - widthButton)/2, y: HEIGHT_SCREEN-heightButton-margin, width: widthButton, height: heightButton)
        self.clikerButton.backgroundColor = UIColor.blue
        self.clikerButton.setTitle("Cliker count", for: .normal)
        self.clikerButton.layer.cornerRadius = 6
        self.clikerButton.addTarget(self, action: #selector(buttonPressed(paramTarget:)), for: .touchUpInside)
        self.view.addSubview(self.clikerButton)
        
    }
    
    func addLabel()  {
        let widthLabel = Int(view.bounds.width)
        let heightLabel = 30
        
        self.clikerLabel.frame = CGRect(x: (WIDTH_SCREEN-widthLabel)/2, y: heightLabel, width: widthLabel, height: heightLabel)
        self.clikerLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(clikerLabel)
    }
    
    @objc func switchChangeBackground(paramTarget: UISwitch) {
        if paramTarget.isOn {
            self.view.backgroundColor =  colorBlack
        } else {
            self.view.backgroundColor =  UIColor.white
        }
    }
    
    @objc func buttonPressed(paramTarget: UIButton) {
        countCliked += 1
        self.clikerLabel.text = String("\(countCliked) - count cliked")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

