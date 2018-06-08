//
//  StartViewController.swift
//  Jeopardy
//
//  Created by Bernardo Cervantes Mayagoitia on 6/8/18.
//  Copyright © 2018 Mayago. All rights reserved.
//

import UIKit

class StartViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate {
    
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}

    
    // MARK: - Interface
    
    @IBOutlet weak var lblPlayer2: UILabel!
    @IBOutlet weak var lblPlayer3: UILabel!
    @IBOutlet weak var lblPlayer4: UILabel!
    
    @IBOutlet weak var pickerPlayers: UIPickerView!
    
    @IBOutlet weak var txtPlayer1: UITextField!
    @IBOutlet weak var txtPlayer2: UITextField!
    @IBOutlet weak var txtPlayer3: UITextField!
    @IBOutlet weak var txtPlayer4: UITextField!
    
    @IBOutlet weak var btnStart: UIButton!
    
    // MARK: - Variables
    
    var sendArray = [Player]()
    
    // MARK: - Constants
    
    let Players = ["1 Player", "2 Players", "3 players", "4 Players"]
    
    // MARK: - Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnStart.layer.cornerRadius = 35
        
        lblPlayer2.isHidden = true
        lblPlayer3.isHidden = true
        lblPlayer4.isHidden = true
        
        txtPlayer2.isHidden = true
        txtPlayer3.isHidden = true
        txtPlayer4.isHidden = true
        
        txtPlayer1.text = "Player 1"
        txtPlayer2.text = "Player 2"
        txtPlayer3.text = "Player3"
        txtPlayer4.text = "Player4"
        
    }

    // MARK: - Delegates
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Players.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return Players[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        lblPlayer2.isHidden = true
        lblPlayer3.isHidden = true
        lblPlayer4.isHidden = true
        
        txtPlayer2.isHidden = true
        txtPlayer3.isHidden = true
        txtPlayer4.isHidden = true
        
        switch row {
        case 1:
            lblPlayer2.isHidden = false
            txtPlayer2.isHidden = false
            break
        case 2:
            lblPlayer2.isHidden = false
            txtPlayer2.isHidden = false
            lblPlayer3.isHidden = false
            txtPlayer3.isHidden = false
            break
        case 3:
            lblPlayer2.isHidden = false
            txtPlayer2.isHidden = false
            lblPlayer3.isHidden = false
            txtPlayer3.isHidden = false
            lblPlayer4.isHidden = false
            txtPlayer4.isHidden = false
            break
        default:
            print("Error filling the picker")
        }
    }
    
    // MARK: - Methods

    // MARk: - Actions
    @IBAction func btnStart(_ sender: UIButton)
    {
        sendArray = []
        var player1 = Player(Name: txtPlayer1.text!, Score: 0)
        sendArray.append(player1)
        
        if lblPlayer4.isHidden == false
        {
            var player2 = Player(Name: txtPlayer2.text!, Score: 0)
            var player3 = Player(Name: txtPlayer3.text!, Score: 0)
            var player4 = Player(Name: txtPlayer4.text!, Score: 0)
            sendArray.append(player2)
            sendArray.append(player3)
            sendArray.append(player4)
        }
        else if lblPlayer3.isHidden == false
        {
            var player2 = Player(Name: txtPlayer2.text!, Score: 0)
            var player3 = Player(Name: txtPlayer3.text!, Score: 0)
            sendArray.append(player2)
            sendArray.append(player3)
        }
        else if lblPlayer2.isHidden == false
        {
            var player2 = Player(Name: txtPlayer2.text!, Score: 0)
            sendArray.append(player2)
        }
        
        print(sendArray)
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    
    @IBAction func clickDone(_ sender: Any) {
        let txt :UITextField = sender as! UITextField
        txt.resignFirstResponder()
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        /*if segue.identifier "segue"
        {
            let vc: Destination = segue.destination as! Destination
            
            vc.object = object
        }*/
    }
    

}
