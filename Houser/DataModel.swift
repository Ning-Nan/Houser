
//This data model mainly used for the first search page.
//Functions are used to response the search filter functions
//datas are inital selection in the search filter screen
import Foundation

class DataModel
{
    //single instance in the whole application
    static let dataModel = DataModel()
    var currentMinPrice:Int
    var currentMaxPrice:Int
    
    var currentRoomNo:Int
    var currentBathNo:Int
    var currentCarSpaceNo:Int
    
    var suburb:String
    
    var petsAllowed:Bool
    
    var suburbOptions:[String]
    
    private init() {
        
        currentMinPrice = 0
        currentMaxPrice = 2000
        
        currentRoomNo = 0
        currentBathNo = 0
        currentCarSpaceNo = 0
        
        suburb = "Melbourne Region"
        
        petsAllowed = false
        
        suburbOptions = ["Melbourne Region"]
        
    }
    
    
    
    //min price will be always less than max price and cannot lower $0
    func plusMinPrice( minLabelText: String , maxLabelText: String) -> String{
        
        var minPrice : Int
        var maxPrice : Int
        var minPriceString = minLabelText
        var maxPriceString = maxLabelText
        
        if let i = minPriceString.characters.index(of: "$") {        minPriceString.remove(at: i)
        }
        
        if let j = maxPriceString.characters.index(of: "$"){
            
            maxPriceString.remove(at: j)
        }
        
        minPrice = Int(minPriceString)!
        maxPrice = Int(maxPriceString)!
        
        if(minPrice >= maxPrice) {
            
            currentMinPrice = minPrice
            
            return maxLabelText
        }
        else{
            currentMinPrice = currentMinPrice + 50
            
            minPriceString = "$" + String(currentMinPrice)
            
            
            return minPriceString
        }
    }
    
    
    
    
    
    func reduceMinPrice (minLabelText:String) -> String{
        
        var minPrice : Int
        var minPriceString = minLabelText
        
        if let i = minPriceString.characters.index(of: "$"){
            
            minPriceString.remove(at: i)
        }
        
        minPrice = Int(minPriceString)!
        
        if (minPrice == 0) {
            
            currentMinPrice = 0
            return minLabelText
            
        }
        else {
            
            currentMinPrice = currentMinPrice - 50
            
            minPriceString = "$" + String(currentMinPrice)
            
            return minPriceString
            
        }
        
        
    }
    
    //max price will be always more than min price and not more than $2000
    func plusMaxPrice (maxLabelText:String) -> String{
        
        var maxPrice: Int
        var maxPriceString = maxLabelText
        
        if let i = maxPriceString.characters.index(of: "$"){
            
            maxPriceString.remove(at: i)}
        
        maxPrice = Int(maxPriceString)!
        
        if(maxPrice == 2000){
            currentMaxPrice = 2000
            return maxLabelText
            
        }
            
        else {
            currentMaxPrice = currentMaxPrice + 50
            
            maxPriceString = "$" + String(currentMaxPrice)
            
            return maxPriceString
            
            
            
        }
        
        
        
        
    }
    
    
    
    func reduceMaxPrice (maxLabelText:String, minLabelText:String) -> String{
        
        var minPrice: Int
        var maxPrice: Int
        var maxPriceString = maxLabelText
        var minPriceString = minLabelText
        
        
        if let i = minPriceString.characters.index(of: "$") {        minPriceString.remove(at: i)
        }
        
        if let j = maxPriceString.characters.index(of: "$"){
            
            maxPriceString.remove(at: j)
        }
        
        
        maxPrice = Int(maxPriceString)!
        minPrice = Int(minPriceString)!
        
        
        
        
        
        
        if(maxPrice == minPrice){
            
            currentMaxPrice = minPrice
            
            return maxLabelText
            
        }
            
        else {
            currentMaxPrice = currentMaxPrice - 50
            
            maxPriceString = "$" + String(currentMaxPrice)
            
            return maxPriceString
            
            
            
        }
        
    }
    
    
    //0 room no means any is acceptable and 6 means moren than 5
    func plusRoomNo (roomLabelText: String) -> String
    {
        
        if (roomLabelText == "Any")
        {
            currentRoomNo = 1
            return "1"
        }
            
        else if (roomLabelText == "5+")
        {
            currentRoomNo = 6
            return "5+"
        }
            
        else if (roomLabelText == "5")
        {
            currentRoomNo = 6
            return "5+"
        }
        else
        {
            currentRoomNo = currentRoomNo + 1
            return String(currentRoomNo)
        }
    }
    
    func reduceRoomNo (roomLabelText: String) -> String
    {
        if(roomLabelText == "5+")
        {
            currentRoomNo = 5
            return "5"
        }
            
        else if (roomLabelText == "1"){
            
            currentRoomNo = 0
            return "Any"
        }
            
        else if (roomLabelText == "Any"){
            
            currentRoomNo = 0
            
            return "Any"
        }
            
        else
        {
            currentRoomNo = currentRoomNo - 1
            
            return String(currentRoomNo)
            
        }
        
        
        
    }
    
    func plusBathNo (bathLabelText: String) -> String
    {
        
        if (bathLabelText == "Any")
        {
            currentBathNo = 1
            return "1"
        }
            
        else if (bathLabelText == "5+")
        {
            currentBathNo = 6
            return "5+"
        }
            
        else if (bathLabelText == "5")
        {
            currentBathNo = 6
            return "5+"
        }
        else
        {
            currentBathNo = currentBathNo + 1
            return String(currentBathNo)
        }
    }
    
    func reduceBathNo (bathLabelText: String) -> String
    {
        if(bathLabelText == "5+")
        {
            currentBathNo = 5
            return "5"
        }
            
        else if (bathLabelText == "1"){
            
            currentBathNo = 0
            return "Any"
        }
            
        else if (bathLabelText == "Any"){
            
            currentBathNo = 0
            
            return "Any"
        }
            
        else
        {
            currentBathNo = currentBathNo - 1
            
            return String(currentBathNo)
            
        }
        
        
        
    }
    
    func plusCarSpaceNo (carSpaceLabelText: String) -> String
    {
        
        if (carSpaceLabelText == "Any")
        {
            currentCarSpaceNo = 1
            return "1"
        }
            
        else if (carSpaceLabelText == "5+")
        {
            currentCarSpaceNo = 6
            return "5+"
        }
            
        else if (carSpaceLabelText == "5")
        {
            currentCarSpaceNo = 6
            return "5+"
        }
        else
        {
            currentCarSpaceNo = currentCarSpaceNo + 1
            return String(currentCarSpaceNo)
        }
    }
    
    func reduceCarSpaceNo (carSpaceLabelText: String) -> String
    {
        if(carSpaceLabelText == "5+")
        {
            currentCarSpaceNo = 5
            return "5"
        }
            
        else if (carSpaceLabelText == "1"){
            
            currentCarSpaceNo = 0
            return "Any"
        }
            
        else if (carSpaceLabelText == "Any"){
            
            currentCarSpaceNo = 0
            
            return "Any"
        }
            
        else
        {
            currentCarSpaceNo = currentCarSpaceNo - 1
            
            return String(currentCarSpaceNo)
            
        }
        
        
        
    }
    
    
    
    
}































