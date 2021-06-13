import UIKit

@objc(DatePickerPlugin) 
class DatePickerPlugin : CDVPlugin{
    
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    
    @objc(createDatePicker:) 
    func createDatePicker(command: CDVInvokedUrlCommand) {
        // Create a DatePicker
        let datePicker: UIDatePicker = UIDatePicker()
        
        // Posiiton date picket within a view
        datePicker.frame = CGRect(x: 10, y: 50, width: self.viewController.view.frame.width, height: 100)
        
        // Set some of UIDatePicker properties
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        
        // Add an event to call onDidChangeDate function when value is changed.
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
        
        // Add DataPicker to the view
        self.viewController.view.addSubview(datePicker)
        
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
