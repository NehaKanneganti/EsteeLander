//
//  TrackerViewController.swift
//  promotionline
//
//  Created by Neha Kanneganti on 7/21/22.
//

import UIKit

class TrackerViewController: UIViewController {
    @IBOutlet weak var txtAdd: UITextField!
    
    @IBOutlet weak var txtField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        if let text = txtAdd.text {
            if text == "" {
                return
            }
            txtField.text.append("\(text)\n")
            txtAdd.text = ""
            txtAdd.resignFirstResponder()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
