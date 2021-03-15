//
//  ViewController.swift
//  SPO_Pr_3
//
//  Created by Astemir Shibzuhov on 3/14/21.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var textViewEnteredBack: NSView!
    @IBOutlet weak var textsBackView: NSView!
    @IBOutlet weak var colorView: NSView!
    @IBOutlet weak var bSlider: NSSlider!
    @IBOutlet weak var gSlider: NSSlider!
    @IBOutlet weak var rSlider: NSSlider!
    var textView: NSTextView!
    var enteredTextView: NSTextView!
    
    var isChanged = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func viewDidLayout() {
        textView.frame = textsBackView.bounds
        enteredTextView.frame = textViewEnteredBack.bounds
        super.viewDidLayout()
        
        
    }
    
    override func viewWillLayout() {
        textView.frame = textsBackView.bounds
        enteredTextView.frame = textViewEnteredBack.bounds
        super.viewWillLayout()
    }
    
    func setup() {
        
        colorView.wantsLayer = true
        colorView.layer?.backgroundColor = NSColor(calibratedRed: 0.2, green: 0.54, blue: 0.32, alpha: 100).cgColor
        
        rSlider.target = self
        rSlider.sendAction(on: .leftMouseDragged)
        rSlider.action = #selector(rAction)
        
        gSlider.target = self
        gSlider.sendAction(on: .leftMouseDragged)
        gSlider.action = #selector(gAction)
        
        bSlider.target = self
        bSlider.sendAction(on: .leftMouseDragged)
        bSlider.action = #selector(bAction)
        
        textView = NSTextView()
        textView.isEditable = false
        textView.wantsLayer = true
        textView.backgroundColor = .clear
        textView.layer?.backgroundColor = .clear
        textsBackView.addSubview(textView)
        
        enteredTextView = NSTextView()
        enteredTextView.wantsLayer = true
        enteredTextView.backgroundColor = .clear
        enteredTextView.layer?.backgroundColor = .clear
        textViewEnteredBack.addSubview(enteredTextView)
        
        textViewEnteredBack.wantsLayer = true
        textViewEnteredBack.layer?.backgroundColor = #colorLiteral(red: 0.2243632972, green: 0.223036021, blue: 0.2253877521, alpha: 1)
        
        textsBackView.wantsLayer = true
        textsBackView.layer?.backgroundColor = #colorLiteral(red: 0.2243632972, green: 0.223036021, blue: 0.2253877521, alpha: 1)
    }
    
   

    @IBAction func applyAction(_ sender: Any) {
        if isChanged {
            textView.string = enteredTextView.string
            enteredTextView.string = ""
            isChanged = false
            return
        }
        let enter = textView.string == "" ? "" : "\n"
        textView.string += (enter + enteredTextView.string)
        enteredTextView.string = ""
    }
    
    @IBAction func changeAction(_ sender: Any) {
        enteredTextView.string = textView.string
        isChanged = true
    }
    
    @IBAction func openFirstWindow(_ sender: Any) {
        let vc = FirstWindowVC()
        presentAsSheet(vc)
    }
    
    @IBAction func openSecondWindow(_ sender: Any) {
    }
    
    @IBAction func openThirdWindow(_ sender: Any) {
    }
}


extension ViewController {
    @objc func rAction(_ sender: NSSlider) {
        let color = NSColor(calibratedRed: sender.floatValue.cgFloat,
                            green: gSlider.floatValue.cgFloat,
                            blue: bSlider.floatValue.cgFloat,
                            alpha: 100)
        colorView.layer?.backgroundColor = color.cgColor
    }
    
    @objc func gAction(_ sender: NSSlider) {
        print(sender.floatValue)
        let color = NSColor(calibratedRed: rSlider.floatValue.cgFloat,
                            green: sender.floatValue.cgFloat,
                            blue: bSlider.floatValue.cgFloat,
                            alpha: 100)
        colorView.layer?.backgroundColor = color.cgColor
    }
    
    @objc func bAction(_ sender: NSSlider) {
        print(sender.floatValue)
        let color = NSColor(calibratedRed: rSlider.floatValue.cgFloat,
                            green: gSlider.floatValue.cgFloat,
                            blue: sender.floatValue.cgFloat,
                            alpha: 100)
        colorView.layer?.backgroundColor = color.cgColor
    }
}

extension Float {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
