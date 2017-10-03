

import UIKit

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate{
    
    
    //data source
    @IBOutlet var addView: UITableView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    //choose photo
    @IBAction func pickPhoto(_ sender: UIButton) {
        
        //see if support photo liabrary
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            //init
            let picker = UIImagePickerController()
            
            //delegate
            picker.delegate = self
            //type of controller
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //no edit allowed
            picker.allowsEditing = false
            
            //present view
            self.view.window?.rootViewController?.present(picker, animated: true, completion: nil)
        
        }else{
            
            print("Failed to read the photo.")
        
        
        }
        
        
        
    }
    
    
    //after chose
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        
        //present image
        let image:UIImage!
        image = info[UIImagePickerControllerOriginalImage] as! UIImage!
        imageView.image = UIImage(named: "")
        imageView.image = image
        
        picker.dismiss(animated: true, completion: {() -> Void in})
        
    }
    
    
    
    
    //lables
    @IBOutlet weak var Price: UILabel!
    
    @IBOutlet weak var roomNo: UILabel!
    @IBOutlet weak var bathNo: UILabel!
    @IBOutlet weak var carSpaceNo: UILabel!
    
    //buttons
    @IBOutlet weak var plusPrice: UIButton!
    @IBOutlet weak var plusRoomNo: UIButton!
    @IBOutlet weak var plusBathNo: UIButton!
    @IBOutlet weak var plusCarSpaceNo: UIButton!
    
    
    @IBOutlet weak var reducePrice: UIButton!
    @IBOutlet weak var reduceRoomNo: UIButton!
    @IBOutlet weak var reduceBathNo: UIButton!
    @IBOutlet weak var reduceCarSpaceNo: UIButton!
    
    
    @IBOutlet weak var botton: UITableViewCell!
    
    
    @IBOutlet weak var buttonSection: UIButton!
    
    
    @IBAction func submit(_ sender: Any) {
        print("sse")
    }
    
    
 
    
    
    //textFiled as picker
    @IBOutlet weak var suburbFiled: UITextField!
    @IBOutlet weak var addressFiled: UITextField!
    @IBOutlet weak var descriptionFiled: UITextField!
    @IBOutlet weak var phoneFiled: UITextField!


    
    
    
    //button functions for change numbers on lables
    @IBAction func plusPrice(_ sender: UIButton) {
        
        Price.text = addDataModel.adddataModel.plusPrice(LabelText: Price.text!)
 
    }
    
    @IBAction func reducePrice(_ sender: UIButton) {
       Price.text = addDataModel.adddataModel.reducePrice(LabelText: Price.text!)
        
    }
    
    
    
    
    
    
    
    @IBAction func plusRoomNo(_ sender: UIButton) {
       
        roomNo.text = addDataModel.adddataModel.plusRoomNo(roomLabelText: roomNo.text!)
    }
    
    @IBAction func reduceRoomNo(_ sender: UIButton) {
        roomNo.text = addDataModel.adddataModel.reduceRoomNo(roomLabelText: roomNo.text!)
    }
    
    
    @IBAction func plusBathNo(_ sender: UIButton) {
        bathNo.text = addDataModel.adddataModel.plusBathNo(bathLabelText: bathNo.text!)
    }
    
    @IBAction func reduceBathNo(_ sender: UIButton) {
        bathNo.text = addDataModel.adddataModel.reduceBathNo(bathLabelText: bathNo.text!)
    }
    
    @IBAction func plusCarSpaceNo(_ sender: UIButton) {
        carSpaceNo.text = addDataModel.adddataModel.plusCarSpaceNo(carSpaceLabelText: carSpaceNo.text!)
    }
    
    @IBAction func reduceCarSpaceNo(_ sender: UIButton) {
        carSpaceNo.text = addDataModel.adddataModel.reduceCarSpaceNo(carSpaceLabelText: carSpaceNo.text!)
    }
    
    @IBAction func petsAllowSwitch(_ sender: UISwitch) {
        if(sender.isOn == true)
        {
            addDataModel.adddataModel.petsAllowed = true
        }
            
        else
        {
            addDataModel.adddataModel.petsAllowed = false
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        
        UIView.animate(withDuration: 0.4, animations: {
            
            self.view.frame.origin.y = -220
            
        })

    }
    

    
    //输入框编辑完成以后，将视图恢复到原始状态
    func textFieldDidEndEditing( _ textField: UITextField)
    {
        self.view.frame = CGRect(x:0, y:0, width: self.view.frame.size.width,
                                     height: self.view.frame.size.height)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suburbFiled.delegate = self
        addressFiled.delegate = self
        descriptionFiled.delegate = self
        phoneFiled.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        Model.model.landlordMode = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
}
