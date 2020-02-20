//
//  DropDownPickerView.swift
//
//  Created by AnshulJain.
//

import UIKit

class DropDownPickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    var pickerData : [String]!
    var pickerTextField : UITextField!
    var selectionHandler : ( (String) -> Void)?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    init(pickerData: [String], selectedValue: String, dropdownField: UITextField, _selectionHandler : @escaping (String) -> Void) {
        super.init(frame: CGRect.zero)
                self.selectionHandler = _selectionHandler
        self.isHidden = false
        self.pickerData = pickerData
        self.pickerTextField = dropdownField
        self.pickerTextField.endEditing(true)
        self.delegate = self
        self.dataSource = self
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker(barbuttonItem:)));
        toolbar.setItems([doneButton], animated: false)
            if pickerData.count > 0 {
                self.pickerTextField.text = selectedValue
                self.pickerTextField.isEnabled = true
            } else {
                self.pickerTextField.text = nil
                self.pickerTextField.isEnabled = false
            }
        dropdownField.inputAccessoryView = toolbar
        if let index = pickerData.firstIndex(where: {$0 == selectedValue}) {
                self.selectRow(index, inComponent:0, animated:true)
            }
    }
    
  @objc func donedatePicker(barbuttonItem:UIBarButtonItem)
  {
    pickerTextField.resignFirstResponder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickerData[row]
        self.selectionHandler!(pickerData[row])
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

@IBDesignable class DropDownTextField: UITextField {
    
    override func awakeFromNib() {
        setUI()
    }
    
    func setUI() {
             // txtPhoneNumber.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 15.0)
              let padding = 19
              let size = 20
              let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding+20, height: size) )
              let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: 10, height: 21))
              iconView.image = UIImage(named: "dropdown")
              outerView.addSubview(iconView)
              self.rightViewMode = .always
              self.rightView = outerView
              self.borderStyle = .none
     //   self.backgroundColor = UIColor().hexStringToUIColor(hex: "#f4f9fb")
     //   self.layer.borderColor = UIColor().hexStringToUIColor(hex: "#C6E2E9").cgColor
        
    }
    
    override func prepareForInterfaceBuilder() {
        setUI()
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func borderColor(){
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
    
}

extension DropDownTextField
{
    func loadDropdownData(data: [String], selectedValue: String,  onSelect selectionHandler : @escaping (String) -> Void){
        self.inputView = DropDownPickerView(pickerData: data, selectedValue: selectedValue, dropdownField: self, _selectionHandler: selectionHandler)
    }
    
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero

    }
    
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []

    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(selectAll(_:)) || action == #selector(paste(_:)) {
            
            return false
    }
   
    return super.canPerformAction(action, withSender: sender)
    }
}
