import UIKit

@objc(DatePickerPlugin) 
class DatePickerPlugin : CDVPlugin{
    
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    
    @objc(createDatePicker:) 
    func createDatePicker(command: CDVInvokedUrlCommand) {
        
        let label: UILabel = UILabel()
        label.text = command.arguments[0] as? String ?? ""
      
        
        let datePicker: UIDatePicker = UIDatePicker()
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
        
        
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 10.0
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(datePicker)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.viewController.view.addSubview(stackView)
        
        //Constraints
        let top            = command.arguments[1] as? CGFloat ?? 0
        let topIsActive    = command.arguments[2] as? Bool ?? false
        let bottom         = command.arguments[3] as? CGFloat ?? 0
        let bottomIsActive = command.arguments[4] as? Bool ?? false
        let left           = command.arguments[5] as? CGFloat ?? 0
        let leftIsActive   = command.arguments[6] as? Bool ?? false
        let right          = command.arguments[7] as? CGFloat ?? 0
        let rightIsActive  = command.arguments[8] as? Bool ?? false
        let centerX        = command.arguments[9] as? Bool ?? false
        let centerY        = command.arguments[10] as? Bool ?? false
        
        guard let myView = self.viewController.view else { return }
        stackView.topAnchor.constraint(equalTo: myView.topAnchor, constant: top).isActive = topIsActive
        stackView.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: bottom).isActive = bottomIsActive
        stackView.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: left).isActive = leftIsActive
        stackView.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: right).isActive = rightIsActive
        stackView.centerXAnchor.constraint(equalTo: myView.centerXAnchor).isActive = centerX
        stackView.centerYAnchor.constraint(equalTo: myView.centerYAnchor).isActive = centerY
        
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "DatePicker Created")
        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        print("Selected value \(selectedDate)")
    }
}
