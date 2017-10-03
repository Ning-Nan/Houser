
import UIKit

class FavouriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var favouriteTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.topItem?.title = "Back"
        self.tabBarController?.navigationItem.title = "List"
        
            }
    
    
    override func viewWillAppear(_ animated: Bool) {

        Model.model.loadData()
        Model.model.current = Model.model.favourite
        self.favouriteTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return Model.model.favourite.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! CustomTableViewCell
        
        let tempIndex : Int = indexPath.row
        
        
        
        let imageData = NSData(contentsOfFile: imagePath.appending(Model.model.favourite[tempIndex].streetDetail + ".jpg"))
        
        cell.mainImage.image = UIImage(data: imageData! as Data)
        
        if(Model.model.favourite[tempIndex].favourite == true){
            
            cell.mark.setImage(UIImage(named:"mark.png"), for: .normal)
            
        }
        else{
            
            cell.mark.setImage(UIImage(named:"unmark.png"), for: .normal)
        }
        
        
        cell.price.text = "$" + String(Model.model.favourite[tempIndex].price)
        
        cell.location.text = Model.model.favourite[tempIndex].streetDetail + " " + Model.model.favourite[tempIndex].suburb + " " + String (Model.model.favourite[tempIndex].postCode)
        
        cell.bedNo.text = String (Model.model.favourite[tempIndex].roomNo)
        cell.bathNo.text = String(Model.model.favourite[tempIndex].bathNo)
        cell.carNo.text = String (Model.model.favourite[tempIndex].carSpaceNo)
        
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
