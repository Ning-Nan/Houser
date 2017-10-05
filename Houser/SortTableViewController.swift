

import UIKit

class SortTableViewController: UITableViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    //data source
  
    @IBOutlet var sortView: UITableView!
    
    //lables
    @IBOutlet weak var minPrice: UILabel!
    @IBOutlet weak var maxPrice: UILabel!
    @IBOutlet weak var roomNo: UILabel!
    @IBOutlet weak var bathNo: UILabel!
    @IBOutlet weak var carSpaceNo: UILabel!
    
    //buttons
    @IBOutlet weak var plusMinPrice: UIButton!
    @IBOutlet weak var plusMaxPrice: UIButton!
    @IBOutlet weak var plusRoomNo: UIButton!
    @IBOutlet weak var plusBathNo: UIButton!
    @IBOutlet weak var plusCarSpaceNo: UIButton!
    
    
    @IBOutlet weak var reduceMinPrice: UIButton!
    @IBOutlet weak var reduceMaxPrice: UIButton!
    @IBOutlet weak var reduceRoomNo: UIButton!
    @IBOutlet weak var reduceBathNo: UIButton!
    @IBOutlet weak var reduceCarSpaceNo: UIButton!
    
    
    //textFiled as picker
    @IBOutlet weak var suburbFiled: UITextField!
    let picker = UIPickerView()
    

    
    //button functions for change numbers on lables
    @IBAction func plusMinPrice(_ sender: UIButton) {
        
        minPrice.text = DataModel.dataModel.plusMinPrice(minLabelText: minPrice.text!, maxLabelText: maxPrice.text!)
        
    }
    
    @IBAction func reduceMinPrice(_ sender: UIButton) {
        minPrice.text = DataModel.dataModel.reduceMinPrice(minLabelText: minPrice.text!)
    }
    
    
    @IBAction func plusMaxPrice(_ sender: UIButton) {
        maxPrice.text = DataModel.dataModel.plusMaxPrice(maxLabelText: maxPrice.text!)
    }
    
    @IBAction func reduceMaxPrice(_ sender: UIButton) {
        
        maxPrice.text = DataModel.dataModel.reduceMaxPrice(maxLabelText: maxPrice.text!, minLabelText: minPrice.text!)
    }
    
    @IBAction func plusRoomNo(_ sender: UIButton) {
        roomNo.text = DataModel.dataModel.plusRoomNo(roomLabelText: roomNo.text!)
    }
    
    @IBAction func reduceRoomNo(_ sender: UIButton) {
        roomNo.text = DataModel.dataModel.reduceRoomNo(roomLabelText: roomNo.text!)
    }
    
    
    @IBAction func plusBathNo(_ sender: UIButton) {
        bathNo.text = DataModel.dataModel.plusBathNo(bathLabelText: bathNo.text!)
    }
    
    @IBAction func reduceBathNo(_ sender: UIButton) {
        bathNo.text = DataModel.dataModel.reduceBathNo(bathLabelText: bathNo.text!)
    }
    
    @IBAction func plusCarSpaceNo(_ sender: UIButton) {
        carSpaceNo.text = DataModel.dataModel.plusCarSpaceNo(carSpaceLabelText: carSpaceNo.text!)
    }
    
    @IBAction func reduceCarSpaceNo(_ sender: UIButton) {
        carSpaceNo.text = DataModel.dataModel.reduceCarSpaceNo(carSpaceLabelText: carSpaceNo.text!)
    }
    
    @IBAction func petsAllowSwitch(_ sender: UISwitch) {
        if(sender.isOn == true)
        {
            DataModel.dataModel.petsAllowed = true
        }
        
        else
        {
            DataModel.dataModel.petsAllowed = false
        }
    }
    
    //picker view components
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1}
    
    //picker view rows
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return DataModel.dataModel.suburbOptions.count
    }
    
    
    //picker view selections
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataModel.dataModel.suburbOptions[row]
    }
    
    
    //picker view action
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        suburbFiled.text = DataModel.dataModel.suburbOptions[row]
        DataModel.dataModel.suburb = DataModel.dataModel.suburbOptions[row]
        self.view.endEditing(false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         Model.model.delegate = databasePro
        picker.dataSource = self
        picker.delegate = self
        
        //replace keyboard to picker view
        suburbFiled.inputView = picker
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        reset()
        DataModel.dataModel.reset()
        Model.model.readSuburb()
        self.sortView.reloadData()
        Model.model.landlordMode = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    func reset(){
        
        minPrice.text = "$0"
        maxPrice.text = "$2000"
        roomNo.text = "Any"
        bathNo.text = "Any"
        carSpaceNo.text = "Any"
    
    
    
    }
    
    
}
