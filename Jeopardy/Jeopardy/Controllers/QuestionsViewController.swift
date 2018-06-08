//
//  QuestionsViewController.swift
//  Jeopardy
//
//  Created by Bernardo Cervantes Mayagoitia on 6/8/18.
//  Copyright © 2018 Mayago. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate {
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    
    // MARK: - Interface
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var txtAnswer: UITextField!
    @IBOutlet weak var pickerPlayers: UIPickerView!
    @IBOutlet weak var btnEvaluate: UIButton!
    @IBOutlet weak var lblAnswered: UILabel!
    
    
    // MARK: - Variables
    
    var category : String = ""
    var value : Int = 0
    var question: String = ""
    
    // MARK: - Constants
    
    let players = Singleton.sharedInstance.playerArray
    
    // MARK: - Load

    override func viewDidLoad() {
        super.viewDidLoad()

        btnEvaluate.layer.cornerRadius = 30
        lblCategory.text = "lala"
        lblValue.text = "lala"
        lblQuestion.text = "lala"
        
        lblAnswered.isHidden = true
        
    }
    
    // MARK: - Delegates
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return players.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return players[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions

    @IBAction func textFieldResign(_ sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    
    @IBAction func btnEvaluate(_ sender: UIButton) {
    }
    
}
