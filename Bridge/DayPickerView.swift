//
//  DayPickerView.swift
//  Bridge
//
//  Created by Владимир Киселев on 02.02.2022.
//

import Foundation
import UIKit


protocol DayPickerViewDataSource{
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String
}

class DayPickerView: UIControl{
    public var dataSource: DayPickerViewDataSource? {
        didSet { //when data is loaded
            setupView()
        }
    }
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds // daypicker size = view size
    }
    
    func setupView(){
        let count = dataSource?.dayPickerCount(self)
        
        for item in 0..<count!{
            let indexPath = IndexPath(row: item, section: 0)
            let title = dataSource?.dayPickerTitle(self, indexPath: indexPath)
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.tag = item
            button.setTitleColor(UIColor.lightGray, for: .normal)
            button.setTitleColor(UIColor.white, for: .selected)
            button.addTarget(self, action: #selector(selectedButton), for: .touchUpInside)
            buttons.append(button)
            self.addSubview(button) //add on screen
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        
        self.addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
    }
    
    @objc func selectedButton(sender: UIButton){
        for b in buttons {
            b.isSelected = false
        }
        
        let index = sender.tag
        let button = self.buttons[index]
        button.isSelected = true
        
        
//        print(#function) //signature of method
    }
    
//    override init(frame: CGRect){
//        super.init(frame: frame)
//    }
//
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

