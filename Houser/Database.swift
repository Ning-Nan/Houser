
import Foundation


protocol DatabaseOperations{

    func queryDatabase(operation: String) -> FMResultSet?
    func modifyDatabase (operation: String) -> Bool
}

class DatabaseOperation : DatabaseOperations{
    
    
    func queryDatabase(operation: String) -> FMResultSet?{
        
        
        if(!database.open()){
            
            print("Error: \(database.lastErrorMessage())")
        
            database.close()
            return nil
        }
        else{
           
            let rs = database.executeQuery(operation, withArgumentsIn: [])
          
            
            return rs
        }
    }
    
    func modifyDatabase (operation: String) -> Bool{
    
        if(!database.open()){
            
            print("Error: \(database.lastErrorMessage())")
            
            database.close()
            return false
        }
        else{
            
            let rs = database.executeUpdate(operation, withArgumentsIn: [])
            database.close()
            return rs
        }

    
    }


}
