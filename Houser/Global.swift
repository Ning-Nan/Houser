

import UIKit

var path = Bundle.main.path(forResource: "houser.db", ofType: nil)

var database = FMDatabase(path: path)

var databasePro = DatabaseOperation()

var imagePath = NSHomeDirectory().appending("/Documents/")
