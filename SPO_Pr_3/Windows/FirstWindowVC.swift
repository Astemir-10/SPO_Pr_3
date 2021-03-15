//
//  FirstWindowVC.swift
//  SPO_Pr_3
//
//  Created by Astemir Shibzuhov on 3/14/21.
//

import Cocoa

class FirstWindowVC: NSViewController {

    @IBOutlet weak var listBackView: NSView!
    var listView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listView = NSTableView()
        listBackView.addSubview(listView)
        
       
        let nib = NSNib(nibNamed: .init("CellView"), bundle: nil)
        listView.register(nib, forIdentifier: NSUserInterfaceItemIdentifier(rawValue: "Cell"))
        listView.delegate = self
        listView.dataSource = self
    }
    
    override func viewWillLayout() {
        super.viewWillLayout()
        
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
    }
    
}

extension FirstWindowVC: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: NSTableView, dataCellFor tableColumn: NSTableColumn?, row: Int) -> NSCell? {
        return CellView()
    }
}
