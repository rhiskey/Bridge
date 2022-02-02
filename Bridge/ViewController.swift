//
//  ViewController.swift
//  Bridge
//
//  Created by Владимир Киселев on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayPicker: DayPickerView!
    
    var days = ["Md", "Th", "Tue", "Wed", "Th", "Sat", "Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayPicker.dataSource = self //not delegate
    }


}

extension ViewController: DayPickerViewDataSource{
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int {
        return days.count
    }
    
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String {
        return days[indexPath.row]
    }
    
    
}

