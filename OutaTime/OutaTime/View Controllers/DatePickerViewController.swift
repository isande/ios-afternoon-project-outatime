//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Peggy Wollenhaupt on 6/9/20.
//  Copyright © 2020 Peggy Wollenhaupt. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func doneTapped(_ sender: UIButton) {
        
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
        
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

protocol  DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}
