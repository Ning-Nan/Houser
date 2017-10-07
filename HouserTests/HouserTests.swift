//
//  TestDataModel.swift
//  Houser
//
//  Created by bekah love u on 2017/10/7.
//  Copyright © 2017年 Iphone10. All rights reserved.
//

import XCTest
@testable import Houser

class HouserTests: XCTestCase {
    
    
    override func setUp() {
        
        super.setUp()
        continueAfterFailure = false

        
        let isFileManager = FileManager.default
        
        let srcUrl = NSHomeDirectory() + "/Documents"
        let fileArray = isFileManager.subpaths(atPath: srcUrl)
        
        for fn in fileArray!{
            
            
            try! isFileManager.removeItem(atPath: srcUrl + "/\(fn)")
            
        }
        
        Model.model.delegate = databasePro
        
        Model.model.firstRun()
        
        Model.model.landlordMode = false
        
        
        
        
        
        
        
    }
    
    override func tearDown() {
        let isFileManager = FileManager.default
        
        let srcUrl = NSHomeDirectory() + "/Documents"
        let fileArray = isFileManager.subpaths(atPath: srcUrl)
        
        for fn in fileArray!{
            
            
            try! isFileManager.removeItem(atPath: srcUrl + "/\(fn)")
            
        }
        super.tearDown()
    }
    
    func testLoadSuburb() {
        
        DataModel.dataModel.reset()
        Model.model.readSuburb()
        
        XCTAssertEqual(DataModel.dataModel.suburbOptions.count, 10)
        XCTAssertEqual(DataModel.dataModel.suburbOptions[0], "Melbourne Region")
        XCTAssertEqual(DataModel.dataModel.suburbOptions[1], "Richmond")
        XCTAssertEqual(DataModel.dataModel.suburbOptions[2], "Melbourne")
        
        
    }
    
    func testReduceAndPlus(){
        DataModel.dataModel.reset()
        Model.model.readSuburb()
        
        let result_1 = DataModel.dataModel.plusMinPrice(minLabelText: "$0", maxLabelText: "$2000")
        let result_2 = DataModel.dataModel.reduceMaxPrice(maxLabelText: "$2000", minLabelText: "$50")
        
        XCTAssertEqual(result_1, "$50")
        XCTAssertEqual(DataModel.dataModel.currentMinPrice, 50)
        
        XCTAssertEqual(result_2, "$1950")
        XCTAssertEqual(DataModel.dataModel.currentMaxPrice, 1950)
        
        
    }
    
    func testLoad(){
        
        DataModel.dataModel.reset()
        Model.model.readSuburb()
        Model.model.loadData()
        
        XCTAssertEqual(Model.model.result.count, 9)
        XCTAssertEqual(Model.model.favourite.count, 3)

        XCTAssertEqual(Model.model.own.count, 2)

        XCTAssertEqual(Model.model.result[0].price, 200)

        XCTAssertEqual(Model.model.favourite[0].price, 400)

        XCTAssertEqual(Model.model.own[0].price, 400)
        
    
    }
    
    func testModify(){
        
        
        DataModel.dataModel.reset()
        Model.model.readSuburb()
        Model.model.loadData()
        
        let address = Model.model.favourite[0].streetDetail
        
        Model.model.removeFavourite(detail: address)
        
        Model.model.loadData()
        
        XCTAssertEqual(Model.model.favourite.count, 2)
        
        Model.model.addFavourite(detail: address)
        
        Model.model.loadData()
        
        XCTAssertEqual(Model.model.favourite.count, 3)
    
    
    
    
    }
    
    func testAddAndJson(){
        DataModel.dataModel.reset()
        Model.model.readSuburb()
        Model.model.loadData()
        addDataModel.adddataModel.currentBathNo = 2
        addDataModel.adddataModel.currentPrice = 200
        addDataModel.adddataModel.currentRoomNo = 2
        addDataModel.adddataModel.currentCarSpaceNo = 2
        addDataModel.adddataModel.petsAllowed = false
        let address = "30 Olympiad Cres"
        let suburb = "Box Hill North"
        let description = "A nice Property"
        let phone = "0405727777"
        let image = UIImage(named: "test.jpg")
        
        
        
        let message = addDataModel.adddataModel.addCheck(suburb: suburb ,street: address, description:description, phone: phone)
        
        XCTAssertEqual(message, "")
        
        addDataModel.adddataModel.json(address: address, suburb: suburb)
        
        XCTAssert(addDataModel.adddataModel.postCode != 0000)
        XCTAssert(addDataModel.adddataModel.xlocation != 0.00)
        XCTAssert(addDataModel.adddataModel.ylocation != 0.00)
        
        Model.model.addProperty(address: address, description: description, suburb: suburb, phone: phone, image: image!)
        
        Model.model.loadData()
        
        XCTAssert(Model.model.own.count == 3)
        XCTAssert(Model.model.result.count == 10)
        
        
    
    }
    
}
