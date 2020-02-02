//
//  ViewController.swift
//  myApp
//
//  Created by Shinnosuke Harigaya on 2019/12/22.
//  Copyright © 2019 Shinnosuke Harigaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var plusLabel: UILabel!
    @IBOutlet var minusLabel: UILabel!
    @IBOutlet var multLabel: UILabel!
    @IBOutlet var divLabel: UILabel!
    @IBOutlet var ruijouLabel: UILabel!
    @IBOutlet var rootLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var maruTextField: UITextField!
    @IBOutlet var shikakuTextField: UITextField!
    
    
    var maru: Int = 0
    var shikaku: Int = 0
    var plusans: Int = 0
    var minusans: Int = 0
    var multans: Int = 0
    var divans: Double = 0
    var ruijouans: Double = 0
    var rootans: Double = 0
    var totalans: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shikakuTextField.keyboardType = .numberPad
        maruTextField.keyboardType = .numberPad
    }
    
    
    
    
    @IBAction func calculate() {
        if let shikakuText = shikakuTextField.text, let maruText = maruTextField.text {
            if let maru = Int(maruText), let shikaku = Int(shikakuText) {
                plusans = maru + shikaku
                plusLabel.text = String(plusans)
                
                minusans = maru - shikaku
                minusLabel.text = String(minusans)
                
                multans = maru * shikaku
                multLabel.text = String(multans)
                
                divans = Double(maru) / Double(shikaku)
                divLabel.text = String(divans)
                
                ruijouans = pow(Double(maru),Double(shikaku))
                ruijouLabel.text = String(ruijouans)
                
                rootans = pow(Double(maru), 1 / Double(shikaku))
                rootLabel.text = String(rootans)
                
                if maru < shikaku{
                    for i in maru...shikaku {
                        totalans += i
                    }
                }
                totalLabel.text = String(totalans)
            } else {
                
                showAlert()
                
            }
            
            
        } else {
            
            showAlert()
            
        }
        
        
    }
    
    @IBAction func clear() {
        
        shikakuTextField.text = ""
        maruTextField.text = ""
    }
    
    func showAlert() {
        
        let alert = UIAlertController(
            title: "emergency",
            message: "数値を入力してください",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "了解",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
        
    }
        
}
