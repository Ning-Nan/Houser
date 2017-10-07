
import UIKit

class ResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var resultTable: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Model.model.delegate = databasePro
        
        self.tabBarController?.navigationItem.title = "List"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //refresh table will view changed
    override func viewWillAppear(_ animated: Bool) {
        Model.model.loadData()
        Model.model.current = Model.model.result
        
        
        //give alert while result list is empty
        if(Model.model.result.isEmpty){
            createAllert(title: "Result Not Found", message: "No result for this search!")
        }
        
        self.resultTable.reloadData()
    }
    
    //make an allert
    func createAllert(title:String, message:String){
        let alert = UIAlertController(title:title, message:message, preferredStyle:UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"OK", style:UIAlertActionStyle.default,handler:{(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true,completion: nil)
        
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return Model.model.result.count
    }
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! CustomTableViewCell
        
        let tempIndex : Int = indexPath.row
        
        
        let imageData = NSData(contentsOfFile: imagePath.appending(Model.model.result[tempIndex].streetDetail + ".jpg"))
        
        cell.mainImage.image = UIImage(data: imageData! as Data)
        
        
        if(Model.model.result[tempIndex].favourite == true){
            
            cell.mark.setImage(UIImage(named:"mark.png"), for: .normal)
            
        }
        else{
            
            cell.mark.setImage(UIImage(named:"unmark.png"), for: .normal)
        }
        
        
        cell.price.text = "$" + String(Model.model.result[tempIndex].price)
        
        cell.location.text = Model.model.result[tempIndex].streetDetail + " " + Model.model.result[tempIndex].suburb + " " + String (Model.model.result[tempIndex].postCode)
        
        cell.bedNo.text = String (Model.model.result[tempIndex].roomNo)
        cell.bathNo.text = String(Model.model.result[tempIndex].bathNo)
        cell.carNo.text = String (Model.model.result[tempIndex].carSpaceNo)
        
        cell.bed.image = UIImage(named:"bed.png")
        cell.bath.image = UIImage(named: "bath.png")
        cell.car.image = UIImage(named: "car.png")
        
        cell.mark.tag = tempIndex
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Model.model.selected = indexPath.row
    }
    
}
