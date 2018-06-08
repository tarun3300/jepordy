//
//  CategoryTabControler.swift
//  Jeopardy
//
//  Created by TARUN GUDELA on 6/8/18.
//  Copyright © 2018 Mayago. All rights reserved.
//

import UIKit

class CategoryTabControler: UIViewController {

    @IBOutlet weak var category1: UIButton!
    @IBOutlet weak var category2: UIButton!
    @IBOutlet weak var category3: UIButton!
    
    @IBOutlet weak var category4: UIButton!
    @IBOutlet weak var category5: UIButton!
    
    var SendButton = ""
    
 
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        category1.setTitle(Singleton.sharedInstance.selectedCategoryObject[0], for: .normal)
        category2.setTitle(Singleton.sharedInstance.selectedCategoryObject[1], for: .normal)
        category3.setTitle(Singleton.sharedInstance.selectedCategoryObject[2], for: .normal)
        category4.setTitle(Singleton.sharedInstance.selectedCategoryObject[3], for: .normal)
        category5.setTitle(Singleton.sharedInstance.selectedCategoryObject[4], for: .normal)
        category1.layer.cornerRadius = 10
        category1.clipsToBounds = true
        category2.layer.cornerRadius = 10
        category2.clipsToBounds = true
        category3.layer.cornerRadius = 10
        category3.clipsToBounds = true
        category4.layer.cornerRadius = 10
        category4.clipsToBounds = true
        category5.layer.cornerRadius = 10
        category5.clipsToBounds = true
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //    MARK: ACTIONS
    

    @IBAction func cat1pressed(_ sender: Any) {
        SendButton = (category1.titleLabel?.text)!
        performSegue(withIdentifier: "cat-segue", sender: self)
        
    }
    


    @IBAction func cat2pressed(_ sender: Any) {
        SendButton = (category1.titleLabel?.text)!
        performSegue(withIdentifier: "cat-segue", sender: self)
    }
    
    
    @IBAction func cat4pressed(_ sender: Any) {
        SendButton = (category3.titleLabel?.text)!
        performSegue(withIdentifier: "cat-segue", sender: self)
    }
    
    @IBAction func cat3pressed(_ sender: Any) {
        SendButton = (category4.titleLabel?.text)!
    performSegue(withIdentifier: "cat-segue", sender: self)
    }
    
    
    @IBAction func cat5presseed(_ sender: Any) {
        SendButton = (category5.titleLabel?.text)!
        performSegue(withIdentifier: "cat-segue", sender: self)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "cat-segue"
        {
            let vc: valueTableViewController = segue.destination as! valueTableViewController
            vc.catName = SendButton
            //vc.arrPlayers = sendArray
        }
    }
    
    @IBAction func unwindToStart(segue: UIStoryboardSegue)
    {
        
    }

}
