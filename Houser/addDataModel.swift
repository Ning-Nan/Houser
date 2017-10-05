
//This data model mainly used for the first search page.
//Functions are used to response the search filter functions
//datas are inital selection in the search filter screen
import Foundation

class addDataModel
{
    //single instance in the whole application
    static let adddataModel = addDataModel()
    var currentPrice:Int
    
    
    var currentRoomNo:Int
    var currentBathNo:Int
    var currentCarSpaceNo:Int
    
    var suburb:String
    
    var petsAllowed:Bool
    var xlocation : Double
    var ylocation : Double
    var postCode : Int
    
    private init() {
        
        currentPrice = 0
        
        currentRoomNo = 0
        currentBathNo = 0
        currentCarSpaceNo = 0
        
        suburb = ""
        
        petsAllowed = false
        xlocation = 0.00000
        ylocation = 0.00000
        postCode = 0000
        
    }
    
    
    func plusPrice( LabelText: String) -> String{
        
        var Price : Int
        var PriceString = LabelText
        
        if let i = PriceString.characters.index(of: "$") {
            PriceString.remove(at: i)
        }
        
        
        
        Price = Int(PriceString)!
        currentPrice = Price
        if(Price >= 2000) {
            
            currentPrice = 2000
            
        }
        else{
            currentPrice = currentPrice + 50
            
            
        }
        
        PriceString = "$" + String(currentPrice)
        
        
        return PriceString
    }
    
    
    
    
    
    func reducePrice (LabelText:String) -> String{
        
        var Price : Int
        var PriceString = LabelText
        
        if let i = PriceString.characters.index(of: "$"){
            
            PriceString.remove(at: i)
        }
        
        Price = Int(PriceString)!
        currentPrice = Price
        
        if (Price == 0) {
            
            currentPrice = 0
            return LabelText
            
        }
        else {
            
            currentPrice = currentPrice - 50
            
            PriceString = "$" + String(currentPrice)
            
            return PriceString
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    func plusRoomNo (roomLabelText: String) -> String
    {
        
        currentRoomNo = Int(roomLabelText)!
        if(currentRoomNo >= 20){
            
            return String(currentRoomNo)
        }
            
        else{
            
            currentRoomNo = currentRoomNo + 1
            return String(currentRoomNo)
        }
    }
    
    func reduceRoomNo (roomLabelText: String) -> String
    {
        currentRoomNo = Int(roomLabelText)!

        if(currentRoomNo == 0){
            
            return String(currentRoomNo)
        }
            
        else
        {
            
            currentRoomNo = currentRoomNo - 1
            return String(currentRoomNo)
            
        }
        
        
        
    }
    
    func plusBathNo (bathLabelText: String) -> String
    {
        
        currentBathNo = Int(bathLabelText)!
        if(currentBathNo >= 20){
            
            return String(currentBathNo)
        }
            
        else{
            currentBathNo = Int(bathLabelText)!

            currentBathNo = currentBathNo + 1
            
            return String(currentBathNo)
        }
    }
    
    func reduceBathNo (bathLabelText: String) -> String
    {
        currentBathNo = Int(bathLabelText)!
        if(currentBathNo == 0){
            
            return String(currentBathNo)
        }
            
        else
        {
            currentBathNo = currentBathNo - 1
            return String(currentBathNo)
            
        }
        
        
        
        
    }
    
    func plusCarSpaceNo (carSpaceLabelText: String) -> String
    {
        
        currentCarSpaceNo = Int(carSpaceLabelText)!
        if(currentCarSpaceNo >= 20){
            
            return String(currentCarSpaceNo)
        }
            
        else{
            currentCarSpaceNo = currentCarSpaceNo + 1
            
            return String(currentCarSpaceNo)
        }
    }
    
    func reduceCarSpaceNo (carSpaceLabelText: String) -> String
    {
        currentCarSpaceNo = Int(carSpaceLabelText)!

        if(currentCarSpaceNo == 0){
            
            return String(currentCarSpaceNo)
        }
            
        else
        {
            currentCarSpaceNo = currentCarSpaceNo - 1
            
            return String(currentCarSpaceNo)
            
        }
        
        
        
    }
    
    
    func reset()
    {
        
        currentPrice = 0
        
        currentRoomNo = 0
        currentBathNo = 0
        currentCarSpaceNo = 0
        
        suburb = ""
        
        petsAllowed = false
        xlocation = 0.00000
        ylocation = 0.00000
        postCode = 0000
        
        
    }
    
    func addCheck(suburb : String, street: String, description: String, phone: String) -> String{
        
        if (currentPrice == 0){
            
            return "Price cannot be $0!"
            
        }
        
        if(currentBathNo == 0 && currentRoomNo == 0 && currentBathNo == 0){
            
            
            return "You should at least have one room!"
            
        }
        
        if (suburb.characters.count > 20 || suburb.characters.count < 3){
            
            return "Suburb name length error!"
            
        }
        
        if (description.characters.count > 700) {
            
            return "Description is too long!"
            
        }
        
        if(phone.characters.count != 10){
            
            return "Phone number length error!"
            
            
        }
        
        if(street.characters.count > 50 || street.characters.count < 5){
            
            
            return "Street length error!"
        }
        
        self.postCode = 0000
        self.xlocation = 0.00000
        self.ylocation = 0.00000
        
        json(address: street, suburb: suburb)

        sleep(2)
        if(self.postCode == 0000)
        {
            
            return "address or suburb is error! Please check your input!"
            
        }
        
        return ""
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func json(address : String, suburb : String)
    {
        
        
        let BASE_URL : String = "https://maps.googleapis.com/maps/api/geocode/json?address="
        
        let LIMIT : String = "&components=administrative_area:VIC|country:AU"
        let KEY :String = "&key=AIzaSyD8X2n5jN8x7Rddir7FFglz0laMvNCK9fs"
        
        
        let findAddress : String = BASE_URL + address + "," + suburb + LIMIT + KEY
        
        
        let url = URL(string: findAddress.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                
                print("error")
            }
            else
            {
                
                if let content = data
                {
                    
                    
                    do
                    {
                        
                        
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let result = myJson["results"] as? NSArray                        {
                            
                            
                            
                            for key in result {
                                
                                if let property = key as? NSDictionary
                                {
                                    
                                    if let location = property["geometry"] as? NSDictionary
                                    {
                                        
                                        if let xy = location["location"] as? NSDictionary
                                        {
                                            
                                            if let x = xy["lat"] as? Double{
                                                addDataModel.adddataModel.xlocation = x;
                                                print(x)
                                                print(self.xlocation)
                                            }
                                            
                                            if let y = xy["lng"] as? Double{
                                                addDataModel.adddataModel.ylocation = y
                                                print(y)
                                                print(self.ylocation)
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                    if let detail = property["address_components"] as? NSArray
                                    {
                                        if let components = detail.lastObject {
                                            
                                            if let parts = components as? NSDictionary
                                            {
                                                if let postCode = parts["short_name"]
                                                    
                                                {
                                                    
                                                    let postcode = (postCode as? NSString)?.integerValue
                                                    addDataModel.adddataModel.postCode = postcode!
                                                    print(postcode!)
                                                    print(self.postCode)
                                                    break
                                                    
                                                }
                                            }
                                            
                                            
                                        }
                                        
                                        
                                    }
                                    
                                    
                                }
                            }
                            
                            
                        }
                        
                        
                    }catch
                    {
                        fatalError()
                    }
                    
                }
            }
            
            
        }
        
        task.resume()
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}































