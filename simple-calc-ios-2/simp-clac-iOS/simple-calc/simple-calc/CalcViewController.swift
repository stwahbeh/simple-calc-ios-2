//
//  CalcViewController.swift
//  simple-calc
//
//  Created by sam wahbeh on 10/29/16.
//  Copyright © 2016 sam wahbeh. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var btnResult: UITextField!

    
    private var pushedOperand = false
    private var currentOperand = ""
    private var result = 0.0
    private var inputArray = [Double]()
    private var input1 = 0.0
    private var input2 = 0.0
    private var indexCount = 0
    var history = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func numInput(_ sender: UIButton) {
        
        var number = Double(sender.currentTitle!)!
        if (inputArray.count == 0){
            inputArray.append(0.0)
        }
        if pushedOperand == true {
            pushedOperand = false
        } else {
            number = inputArray.popLast()! * 10 + number
        }
        inputArray.append(number)
        btnResult.text = "\(number)"
        
    }
    
    @IBAction func operandInput(_ sender: UIButton) {
        currentOperand = sender.currentTitle!
        print(sender.currentTitle!)
        //if (pushedOperand == true){
          //  calculate(sender)
        //}
        
        
        
        pushedOperand = true
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        
        switch currentOperand{
        case "+":
            input2 = inputArray.popLast()!
            input1 = inputArray.popLast()!
            result = input1 + input2
        case "-":
            input2 = inputArray.popLast()!
            input1 = inputArray.popLast()!
            result = input1 - input2
        case "*":
            input2 = inputArray.popLast()!
            input1 = inputArray.popLast()!
            result = input1 * input2
        case "/":
            input2 = inputArray.popLast()!
            input1 = inputArray.popLast()!
            result = input1 / input2
        case "AVG":
            result = 0
            for input in inputArray {
                result += input
                print(input)
            }
            result = result / Double(inputArray.count)
            inputArray.removeAll()
            inputArray.append(result)
        case "COUNT":
            result = Double(inputArray.count)
            print(Double(inputArray.count))
        case "FACT":
            result =  factorial(input: inputArray.popLast()!)
            inputArray.removeAll()
            inputArray.append(result)
        case "%":
            input2 = inputArray.popLast()!
            input1 = inputArray.popLast()!
            result = fmod(input1, input2)
            
        default:
            print("unkown error calculator has been cleared")

        }
        history.append("\(input1) \(currentOperand)\(input2) = \(result)")
        inputArray.append(result)
        btnResult.text = "\(result)"
        pushedOperand = false
    }
    
    
    func factorial (input: Double) -> Double {
//        if inputArray.count != 1 {
  //          print("please clear calculator")
    //        return 0.0
            
      //  } else {
        if input < 1 {
            return 1
        } else {
            return input * factorial(input: input - 1)
        //}
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScene = segue.destination as! HistoryViewController
        nextScene.history = history
    }

    @IBAction func Clear(_ sender: UIButton) {
        pushedOperand = false
        currentOperand = " "
        result = 0.0
        inputArray.removeAll()
        btnResult.text = "0.0"
    }




}
