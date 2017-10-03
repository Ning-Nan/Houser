
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var Tenant: UIButton!
    @IBOutlet weak var Landlord: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Model.model.delegate = databasePro
        
        Tenant.layer.borderColor = UIColor.white.cgColor
        Tenant.layer.borderWidth = 1
        Tenant.layer.cornerRadius = 4
        
        Landlord.layer.borderColor = UIColor.white.cgColor
        Landlord.layer.borderWidth = 1
        Landlord.layer.cornerRadius = 4
        
        print(imagePath)
        Model.model.firstRun()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
