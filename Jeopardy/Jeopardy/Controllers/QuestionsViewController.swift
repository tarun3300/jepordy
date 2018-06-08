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
    
    var category : String = "Error loading the category"
    var value : Int = 0
    var question: String = "Error loading the question"
    var answer : String = ""
    
    var selectedPlayer = Player()
    
    // MARK: - Constants
    
    let players = Singleton.sharedInstance.playerArray
    
    // MARK: - Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnEvaluate.layer.cornerRadius = 30
        lblCategory.text = category
        lblValue.text = String(value)
        lblQuestion.text = question
        lblAnswered.isHidden = true
        
        selectedPlayer = players[0]
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
        
        selectedPlayer = players[row]
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    
    @IBAction func textFieldResign(_ sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    
    @IBAction func btnEvaluate(_ sender: UIButton) {
        
        if txtAnswer.text != ""
        {
            if txtAnswer.text == answer
            {
                selectedPlayer.score += value
                lblAnswered.isHidden = false
                lblAnswered.text = "Answered by " + selectedPlayer.name
            }
            else
            {
                lblAnswered.isHidden = false
                lblAnswered.text = "Wrong Answer"
            }
        }
        else
        {
            print("No input answer")
        }
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        
       
        self.performSegue(withIdentifier: "dismissQuestions", sender: self)
    }
    
    
}
