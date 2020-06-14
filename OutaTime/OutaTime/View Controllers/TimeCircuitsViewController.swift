//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Peggy Wollenhaupt on 6/9/20.
//  Copyright © 2020 Peggy Wollenhaupt. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destTimeLabel: UILabel!
    @IBOutlet weak var presTimeLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    var currentSpeed = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        presTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = String(currentSpeed)

    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presTimeLabel.text ?? "UNKNOWN")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
        } else {
            timer.invalidate()
            lastTimeLabel.text = presTimeLabel.text
            presTimeLabel.text = destTimeLabel.text
            currentSpeed = 0
            speedLabel.text = String(currentSpeed)
            showAlert()
        }
    }

    @IBAction func travelBackTapped(_ sender: UIButton) {
        
        startTimer()
        
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if let pickerVC = segue.destination as? DatePickerViewController {
            pickerVC.delegate = self
        }
        
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(date: Date) {
        destTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
