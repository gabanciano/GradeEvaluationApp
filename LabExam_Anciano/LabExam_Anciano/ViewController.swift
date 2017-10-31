//
//  ViewController.swift
//  LabExam_Anciano
//
//  Created by student on 03/10/2017.
//  Copyright © 2017 dlsud. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var BackgroundImageView: UIImageView!
    
    @IBOutlet var StudentNameField: UITextField!
    @IBOutlet var MathGradeField: UITextField!
    @IBOutlet var ScienceGradeField: UITextField!
    @IBOutlet var LanguageGradeFIeld: UITextField!
    @IBOutlet var HistoryGradeField: UITextField!
    @IBOutlet var LiteratureGradeField: UITextField!
    
    @IBOutlet var BackgroundPicker: UIPickerView!
    @IBOutlet var ChooseCollegeButton: UIButton!
    
    var universityColleges = ["Mathematic Department (MSD)",
                              "Biological Science Department (BSD",
                              "Computer Science Department (CSD)",
                              "Physical Science Department (PSD)"]
    
    var finalGrade : Double = 0
    var gradeSum : Double = 0
    
    var studentName : String = ""
    
    var mathGrade : Double = 0
    var scienceGrade : Double = 0
    var languageGrade : Double = 0
    var historyGrade : Double = 0
    var literatureGrade : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BackgroundPicker.dataSource = self
        self.BackgroundPicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ClearButton(_ sender: Any) {
        StudentNameField.text = "";
        MathGradeField.text = "";
        LanguageGradeFIeld.text = "";
        HistoryGradeField.text = "";
        LiteratureGradeField.text = "";
    }
    
    @IBAction func ComputeGradeButton(_ sender: Any) {
        ComputeGrade()
        ShowAlertBox()
    }
    
    func ShowAlertBox(){
        let alertBox = UIAlertController(title: "Grade Evaluation", message: "Hi, " + String(studentName) + "!\n Your average grade is " + String(finalGrade) + "%\n Remarks: " + GetGradeRemarks(finalGrade: finalGrade), preferredStyle: UIAlertControllerStyle.alert)
        
        alertBox.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertBox, animated: true, completion: nil)
    }
    
    func ComputeGrade(){
        studentName = String(StudentNameField.text!)!
        
        mathGrade = Double(MathGradeField.text!)!
        scienceGrade = Double(ScienceGradeField.text!)!
        languageGrade = Double(LanguageGradeFIeld.text!)!
        historyGrade = Double(HistoryGradeField.text!)!
        literatureGrade = Double(LiteratureGradeField.text!)!
        
        gradeSum = mathGrade + scienceGrade + languageGrade + historyGrade + literatureGrade
        
        finalGrade = gradeSum / 5
        //finalGrade = finalGrade.rounded()
    }
    
    func GetGradeRemarks(finalGrade : Double) -> String{
        
        if(finalGrade < 75){
            return "FAIL"
        } else if (finalGrade >= 75 && finalGrade <= 80){
            return "NEEDS IMPROVEMENT"
        } else if (finalGrade >= 81 && finalGrade <= 85 ) {
            return "PASSED"
        } else if (finalGrade >= 86 && finalGrade <= 90){
            return "GOOD"
        } else if (finalGrade >= 91 && finalGrade <= 95){
            return "EXCELLENT"
        } else if (finalGrade >= 96 && finalGrade <= 100){
            return "OUTSTANDING"
        } else if (finalGrade < 100){
            return "CHEATER"
        } else {
            return "WHAT?!"
        }
        
    }
    
    @IBAction func ChooseCollegeButton(_ sender: Any) {
        if(BackgroundPicker.isHidden == true){
            BackgroundPicker.isHidden = false
        } else if (BackgroundPicker.isHidden == false){
            BackgroundPicker.isHidden = true
        }
       
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return universityColleges.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return universityColleges[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(row == 0){
            BackgroundImageView.image = #imageLiteral(resourceName: "math")
        } else if(row == 1){
            BackgroundImageView.image = #imageLiteral(resourceName: "biology")
        } else if(row == 2){
            BackgroundImageView.image = #imageLiteral(resourceName: "comp")
        } else if (row == 3){
            BackgroundImageView.image = #imageLiteral(resourceName: "physci")
        }
    }
}

