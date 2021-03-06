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
    var randomcategoryArray = [[String: AnyObject]]()
    
    // MARK: - Constants
    
    let Players = ["1 Player", "2 Players", "3 players", "4 Players"]
    
    // MARK: - Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
         getDataFromServer()
        
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
    func getDataFromServer(){
        let url = URL(string: "http://jservice.io/api/clues")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.mutableContainers) as! Array<Any>
                    
                    
                    OperationQueue.main.addOperation({
//                        print("JSON",json)
//                        print(json.count)
//                        print("first object::",json[0])
                        var allCategory = [String]()
                       
                        //                        print(json[0][value(forKey: "value") as! String])
                        //                        print(json[0].keys)
                        
                        for jsonElement in json{
                            var jsonDict = [String: AnyObject]()
                            jsonDict = jsonElement as! [String : AnyObject]
//                            print(jsonDict["category"]!["title"] as! String)
                            allCategory.append(jsonDict["category"]!["title"] as! String)
                            allCategory = Array(Set(allCategory))
                            
                        }
                        print(allCategory.count)
                        let shuffledAllCategoryArray = allCategory.shuffled
                        let randomarray = shuffledAllCategoryArray.choose(5)
                        Singleton.sharedInstance.selectedCategoryObject = randomarray
                        print(randomarray)
                        //                        print("categoryArray1",categoryArray1[0]);
                        for jsonElement in json{
                            var jsonDict = [String: AnyObject]()
                            jsonDict = jsonElement as! [String : AnyObject]
                            
                            for element in randomarray{
                                
                                if (jsonDict["category"]!["title"] as! String == element){
                                    
                                    self.randomcategoryArray.append(jsonDict)
                                    
                                }
                                
                            }
                        }
                        
                        print("random Category Array:::",self.randomcategoryArray)
                        Singleton.sharedInstance.AllcategoryObject = self.randomcategoryArray
                        print(self.randomcategoryArray.count)
                    
                        
                    })
                    
                }catch let error as NSError{
                    print(error)
                
                }
            }
        }).resume()
        
    }

    // MARk: - Actions
    @IBAction func btnStart(_ sender: UIButton){
        
        print("******************")
       
            print(Singleton.sharedInstance.AllcategoryObject)
        
        
        
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
        
        
        Singleton.sharedInstance.playerArray = sendArray

    }
    
    @IBAction func clickDone(_ sender: Any) {
        let txt :UITextField = sender as! UITextField
        txt.resignFirstResponder()
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "segue"
        {
            let vc: QuestionsViewController = segue.destination as! QuestionsViewController
            
            //vc.arrPlayers = sendArray
        }
    }
    

}
