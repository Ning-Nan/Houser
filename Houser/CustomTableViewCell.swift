//


import UIKit

class CustomTableViewCell: UITableViewCell {



    @IBOutlet weak var mark: UIButton!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var carNo: UILabel!
    @IBOutlet weak var bathNo: UILabel!
    @IBOutlet weak var bedNo: UILabel!
    
    
    @IBOutlet weak var bed: UIImageView!
    @IBOutlet weak var bath: UIImageView!
    
    @IBOutlet weak var car: UIImageView!
    
    


    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    //change mark situation
    @IBAction func markChange(_ sender: UIButton) {
        let tempIndex = self.mark.tag
        
        
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
