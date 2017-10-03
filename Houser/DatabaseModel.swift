//Database Model class used to store properties information

import Foundation


class DatabaseModel
{
    static let dataBase = DatabaseModel()
    
    //Array Index as ID of each property
    var price : [Int]
    var streetDetail : [String]
    var suburb : [String]
    var postCode : [Int]
    var roomNo : [Int]
    var bathNo : [Int]
    var carSpaceNo: [Int]
    var petsAllowed:[Bool]
    var currentSearchResult : [Int]
    var favouriteIndex : [Int]
    var currentSelectIndex : Int
    var phoneNo : [Int]
    var description : [String]
    var tempFavourite : [Int]
    
    
    
    
    private init() {
        
        price = [200,300,400,450,600,700,800,1000,1200]
        streetDetail = ["15 Docklands Dr","16 Docklands Dr","20 Station Street","35 King Street","1 Queen Street","99 La Trobe Street","100 Russel Street","55 High Street","77 Main Street"]
    
        suburb = ["CBD","South Melbourne","RichMond","Kew","South Yarra","Toorak","Footscray","North Melbourne","Collinwood"]
        
        postCode = [3000,3022,3033,3044,3055,3066,3077,3088,3099]
        
        roomNo = [1,2,3,4,5,6,2,2,3]
        bathNo = [1,2,3,4,5,6,2,2,3]
        carSpaceNo = [1,2,3,4,5,6,2,2,3]
        petsAllowed = [false,true,false,true,false,true,false,true,false]
        currentSearchResult = []
        favouriteIndex = [3,4,5]
         description = ["Spectacular bushland setting with harbour & City views from this beautifully presented, fully renovated three bedroom cottage.\nStunning brand new open plan kitchen fitted with glass splash backs, wine storage, induction stove and dishwasher. The brand new quality bathroom is fitted with shower over bath and 2nd toilet within the separate laundry room. All bedrooms fitted with new carpet, built-in robes and roller blinds. The bright open living space has floor boards and flows to the two large entertaining decks. Lovely landscaped grounds. Under cover parking with space behind for 2nd car. Separate storage shed. Fitted with reverse cycle ducted air conditioning.","Spectacular bushland setting with harbour & City views from this beautifully presented, fully renovated three bedroom cottage.\nStunning brand new open plan kitchen fitted with glass splash backs, wine storage, induction stove and dishwasher. The brand new quality bathroom is fitted with shower over bath and 2nd toilet within the separate laundry room. All bedrooms fitted with new carpet, built-in robes and roller blinds. The bright open living space has floor boards and flows to the two large entertaining decks. Lovely landscaped grounds. Under cover parking with space behind for 2nd car. Separate storage shed. Fitted with reverse cycle ducted air conditioning.","Spectacular bushland setting with harbour & City views from this beautifully presented, fully renovated three bedroom cottage.\nStunning brand new open plan kitchen fitted with glass splash backs, wine storage, induction stove and dishwasher. The brand new quality bathroom is fitted with shower over bath and 2nd toilet within the separate laundry room. All bedrooms fitted with new carpet, built-in robes and roller blinds. The bright open living space has floor boards and flows to the two large entertaining decks. Lovely landscaped grounds. Under cover parking with space behind for 2nd car. Separate storage shed. Fitted with reverse cycle ducted air conditioning.","Spectacular bushland setting with harbour & City views from this beautifully presented, fully renovated three bedroom cottage.\nStunning brand new open plan kitchen fitted with glass splash backs, wine storage, induction stove and dishwasher. The brand new quality bathroom is fitted with shower over bath and 2nd toilet within the separate laundry room. All bedrooms fitted with new carpet, built-in robes and roller blinds. The bright open living space has floor boards and flows to the two large entertaining decks. Lovely landscaped grounds. Under cover parking with space behind for 2nd car. Separate storage shed. Fitted with reverse cycle ducted air conditioning.","Spectacular bushland setting with harbour & City views from this beautifully presented, fully renovated three bedroom cottage.\nStunning brand new open plan kitchen fitted with glass splash backs, wine storage, induction stove and dishwasher. The brand new quality bathroom is fitted with shower over bath and 2nd toilet within the separate laundry room. All bedrooms fitted with new carpet, built-in robes and roller blinds. The bright open living space has floor boards and flows to the two large entertaining decks. Lovely landscaped grounds. Under cover parking with space behind for 2nd car. Separate storage shed. Fitted with reverse cycle ducted air conditioning.","Spectacular bushland setting with harbour & City views from this beautifully presented, fully renovated three bedroom cottage.\nStunning brand new open plan kitchen fitted with glass splash backs, wine storage, induction stove and dishwasher. The brand new quality bathroom is fitted with shower over bath and 2nd toilet within the separate laundry room. All bedrooms fitted with new carpet, built-in robes and roller blinds. The bright open living space has floor boards and flows to the two large entertaining decks. Lovely landscaped grounds. Under cover parking with space behind for 2nd car. Separate storage shed. Fitted with reverse cycle ducted air conditioning.","Spectacular bushland setting with harbour & City views from this beautifully presented, fully renovated three bedroom cottage.\nStunning brand new open plan kitchen fitted with glass splash backs, wine storage, induction stove and dishwasher. The brand new quality bathroom is fitted with shower over bath and 2nd toilet within the separate laundry room. All bedrooms fitted with new carpet, built-in robes and roller blinds. The bright open living space has floor boards and flows to the two large entertaining decks. Lovely landscaped grounds. Under cover parking with space behind for 2nd car. Separate storage shed. Fitted with reverse cycle ducted air conditioning.","Spectacular bushland setting with harbour & City views from this beautifully presented, fully renovated three bedroom cottage.\nStunning brand new open plan kitchen fitted with glass splash backs, wine storage, induction stove and dishwasher. The brand new quality bathroom is fitted with shower over bath and 2nd toilet within the separate laundry room. All bedrooms fitted with new carpet, built-in robes and roller blinds. The bright open living space has floor boards and flows to the two large entertaining decks. Lovely landscaped grounds. Under cover parking with space behind for 2nd car. Separate storage shed. Fitted with reverse cycle ducted air conditioning.","Spectacular bushland setting with harbour & City views from this beautifully presented, fully renovated three bedroom cottage.\nStunning brand new open plan kitchen fitted with glass splash backs, wine storage, induction stove and dishwasher. The brand new quality bathroom is fitted with shower over bath and 2nd toilet within the separate laundry room. All bedrooms fitted with new carpet, built-in robes and roller blinds. The bright open living space has floor boards and flows to the two large entertaining decks. Lovely landscaped grounds. Under cover parking with space behind for 2nd car. Separate storage shed. Fitted with reverse cycle ducted air conditioning."]
        currentSelectIndex = 0
        phoneNo = [0305299999,0402043255,0402040255,0402040265,0402040223,0402040242,0402040257,0402040255,0402040256]
        
        tempFavourite = favouriteIndex
        
    }
    
    //re-sort the list to let the favouite index match the orginal index
    func performSort(){
        
        currentSearchResult = []
        var index = 0
        
        //price
        for index in 0...price.count - 1 {
            if(DataModel.dataModel.currentMinPrice <= price[index] && price[index] <= DataModel.dataModel.currentMaxPrice){
            currentSearchResult.append(index)
            }
        }
        
        
        while (index < currentSearchResult.count){
            
            
            if(DataModel.dataModel.currentBathNo == 6){
            
                if(bathNo[currentSearchResult[index]] < 5){
                
                    currentSearchResult.remove(at: index)
                    continue
                }
            }
            
            if(DataModel.dataModel.currentRoomNo == 6){
                
                if(roomNo[currentSearchResult[index]] < 5){
                    
                    currentSearchResult.remove(at: index)
                 
                    continue
                }}
            
            if(DataModel.dataModel.currentCarSpaceNo == 6){
                
                if(carSpaceNo[currentSearchResult[index]] < 5){
                    
                    currentSearchResult.remove(at: index)
                    continue
                }}
            
            if(DataModel.dataModel.currentBathNo != 0){
            
                if(bathNo[currentSearchResult[index]] != DataModel.dataModel.currentBathNo){
                
                    currentSearchResult.remove(at: index)
                    continue
                    
                }
            }
            
            if(DataModel.dataModel.currentRoomNo != 0){
                
                if(roomNo[currentSearchResult[index]] != DataModel.dataModel.currentRoomNo){
                    
                    currentSearchResult.remove(at: index)
                    continue
                    
                }

            
            }
            
            if(DataModel.dataModel.currentCarSpaceNo != 0){
            
                if(carSpaceNo[currentSearchResult[index]] != DataModel.dataModel.currentCarSpaceNo){
                    
                    currentSearchResult.remove(at: index)
                    continue
                }

            }
            
            if(DatabaseModel.dataBase.suburb[currentSearchResult[index]] != DataModel.dataModel.suburb  && DataModel.dataModel.suburb != "Melbourne Region" ){
            
                currentSearchResult.remove(at: index)
                continue
            }
            
            if(DatabaseModel.dataBase.petsAllowed[currentSearchResult[index]] != DataModel.dataModel.petsAllowed  && DataModel.dataModel.petsAllowed == true){
            
                currentSearchResult.remove(at: index)
                continue
            
            }
        
        
        
        
        
        
        
        
        index = index + 1
        
        }//end sort
  

        
        
    
    
    
    
    }

    


}
