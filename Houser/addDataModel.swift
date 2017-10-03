
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
    
    
    private init() {
        
        currentPrice = 0
        
        currentRoomNo = 0
        currentBathNo = 0
        currentCarSpaceNo = 0
        
        suburb = "Melbourne Region"
        
        petsAllowed = false
        
    }
    
    
    
    func plusPrice( LabelText: String) -> String{
        
        var Price : Int
        var PriceString = LabelText
        
        if let i = PriceString.characters.index(of: "$") {
            PriceString.remove(at: i)
        }
        
        
        
        Price = Int(PriceString)!
        
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
        
        if(currentBathNo >= 20){
            
            return String(currentBathNo)
        }
            
        else{
            
            currentBathNo = currentBathNo + 1
            
            return String(currentBathNo)
        }
    }
    
    func reduceBathNo (bathLabelText: String) -> String
    {
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
        if(currentCarSpaceNo == 0){
            
            return String(currentCarSpaceNo)
        }
            
        else
        {
            currentCarSpaceNo = currentCarSpaceNo - 1
            
            return String(currentCarSpaceNo)
            
        }
        
        
        
    }
    
    
    
    
}































