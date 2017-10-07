
import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var carNo: UILabel!
    @IBOutlet weak var bathNo: UILabel!
    @IBOutlet weak var bedNo: UILabel!
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var description11: UILabel!
    
    @IBOutlet weak var mark: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetail()
        
        //map set
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.010, 0.010)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(Model.model.current[Model.model.selected].xlocation, Model.model.current[Model.model.selected].ylocation)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = Model.model.current[Model.model.selected].streetDetail
        map.addAnnotation(annotation)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    @IBAction func markChange(_ sender: UIButton) {
        let tempIndex = Model.model.selected
        
        
        switch(Model.model.landlordMode){
            
        case true:
            
            removeFunc()            
            
            
        case false:
            
            if(Model.model.current[tempIndex].favourite == true){
                
                
                Model.model.removeFavourite(detail: Model.model.current[tempIndex].streetDetail)
                mark.setImage(UIImage(named:"unmark.png"), for: .normal)
                Model.model.current[tempIndex].favourite = false
                
                
            }
                
            else {
                
                Model.model.addFavourite(detail: Model.model.current[tempIndex].streetDetail)
                mark.setImage(UIImage(named:"mark.png"), for: .normal)
                Model.model.current[tempIndex].favourite = true
            }
            
            
        }
        
    }
    
    func showDetail(){
        
        let tempIndex = Model.model.selected
        
        switch Model.model.landlordMode {
        case true:
            
            mark.setImage(UIImage(named:"delete.png"), for: .normal)
            
            break
            
        case false:
            
            if(Model.model.current[tempIndex].favourite == true){
                
                mark.setImage(UIImage(named:"mark.png"), for: .normal)
                
            }
            else{
                
                mark.setImage(UIImage(named:"unmark.png"), for: .normal)
            }
            
        }
        
        let imageData = NSData(contentsOfFile: imagePath.appending(Model.model.current[tempIndex].streetDetail + ".jpg"))
        
        mainImage.image = UIImage(data: imageData! as Data)
        
        price.text = "$" + String (Model.model.current[tempIndex].price)
        location.text = String (Model.model.current[tempIndex].streetDetail) + " " + String (Model.model.current[tempIndex].suburb) + " " + String (Model.model.current[tempIndex].postCode)
        
        bedNo.text = String (Model.model.current[tempIndex].roomNo)
        
        bathNo.text = String (Model.model.current[tempIndex].bathNo)
        
        carNo.text = String (Model.model.current[tempIndex].carSpaceNo)
        description11.text = Model.model.current[tempIndex].description
        
    }
    
    
    @IBAction func creatActionSheet(_ sender: UIButton) {
        
        guard let numberCall = URL(string: "tel://" + String(Model.model.current[Model.model.selected].phoneNo)) else { return }
        
        
        guard let numberSMS = URL(string: "sms://" + String(Model.model.current[Model.model.selected].phoneNo)) else { return }
        
        let action = UIAlertController(title : "Contact Landlord", message: "You can cantact landlord via Phone call or SMS",preferredStyle : UIAlertControllerStyle.actionSheet)
        
        let callAction = UIAlertAction(title: "Call", style: UIAlertActionStyle.default)
        {(action) -> Void in
            
            
            UIApplication.shared.open(numberCall)
            
        }
        
        let SMSAction = UIAlertAction(title: "SMS", style: UIAlertActionStyle.default)
        {(action) -> Void in
            
            
            UIApplication.shared.open(numberSMS)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle
            .cancel)
        
        action.addAction(callAction)
        action.addAction(SMSAction)
        action.addAction(cancelAction)
        
        self.present(action, animated: true, completion: nil)
        
    }
    
    
    func removeFunc() {
        
        
        
        let action = UIAlertController(title : "Are you sure?", message: "The property will be deleted from database.",preferredStyle : UIAlertControllerStyle.actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive)
        {(action) -> Void in
            
            Model.model.removeHouse(detail: Model.model.current[Model.model.selected].streetDetail)
            
            self.navigationController?.popViewController(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle
            .cancel)
        
        action.addAction(deleteAction)
        action.addAction(cancelAction)
        
        self.present(action, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
}
