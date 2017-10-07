

import XCTest

class HouserUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
     
        continueAfterFailure = false
      
        XCUIApplication().launch()
        
        
        
        
        let isFileManager = FileManager.default
        
        let srcUrl = NSHomeDirectory() + "/Documents"
        let fileArray = isFileManager.subpaths(atPath: srcUrl)
        
        for fn in fileArray!{
            
            
            try! isFileManager.removeItem(atPath: srcUrl + "/\(fn)")
            
        }
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
    
    func testSearch() {

    let app = XCUIApplication()

        app.buttons["Tenant"].tap()
        let buttonNumber = app.buttons.count
        let labelNumber = app.staticTexts.count
         let tablesQuery = app.tables
        let cellCount = app.cells.count
        
        XCTAssertEqual(buttonNumber, 15)
        XCTAssertEqual(labelNumber, 12)
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "$0").label, "$0")
        XCTAssertEqual(cellCount, 13)
        tablesQuery.cells.containing(.staticText, identifier:"$0").buttons["+"].tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "$50").label, "$50")

        XCTAssert(app.staticTexts["Search"].exists)
        
       
        let textField = tablesQuery.children(matching: .cell).element(boundBy: 10).children(matching: .textField).element
        textField.tap()
        let pickerNo = app.pickerWheels.count
        XCTAssertEqual(pickerNo, 1)
        
    }
    
    func testResult() {
        let app = XCUIApplication()
        app.buttons["Tenant"].tap()

        let tablesQuery = XCUIApplication().tables
        
        
        let button = tablesQuery.cells.containing(.staticText, identifier:"minPrice").buttons["+"]
        button.tap(withNumberOfTaps: 10, numberOfTouches: 1)
         button.tap(withNumberOfTaps: 10, numberOfTouches: 1)
         button.tap(withNumberOfTaps: 10, numberOfTouches: 1)
         button.tap(withNumberOfTaps: 10, numberOfTouches: 1)

        
        app.buttons["Search"].tap()
        
        let alertCount = app.alerts.count
        XCTAssertEqual(alertCount, 1)
    
    }
    
    func testResultAndFavourite(){
    
        let app = XCUIApplication()
        app.buttons["Tenant"].tap()

        app.buttons["Search"].tap()
        sleep(2)

        
        let cellCount = app.cells.count
                let buttonCount = app.buttons.count
        
        
        XCTAssertEqual(cellCount, 9)
        XCTAssertEqual(buttonCount, 13)
        XCTAssert(app.navigationBars.staticTexts["List"].exists)
        XCTAssert(app.tabBars.buttons["Result"].exists)
        XCTAssert(app.tabBars.buttons["Favorites"].exists)
        
 
        app.tabBars.buttons["Favorites"].tap()
        sleep(2)
        XCTAssertEqual(app.cells.count, 3)
        
        XCUIApplication().tabBars.buttons["Favorites"].tap()
        
    
    }
    
    func testDetailScreen(){
        
        let app = XCUIApplication()
        app.buttons["Tenant"].tap()

  
        app.tables.cells.buttons["Search"].tap()
        app.tables.cells.staticTexts.element(matching: .staticText, identifier: "$200").tap()
        XCTAssert(app.navigationBars.staticTexts["Detail"].exists)
        XCTAssert(app.staticTexts["$200"].exists)
        XCTAssert(app.staticTexts["2 McGoun Street Richmond 3121"].exists)
        XCTAssert(app.buttons["Contact Landlord"].exists)

        
        app.navigationBars["Detail"].buttons["List"].tap()
        XCTAssert(app.navigationBars.staticTexts["List"].exists)
        
        
        
    }
    
    func testHome(){
    
        let app = XCUIApplication()
        let appButton = app.buttons.count
        
        XCTAssert(appButton == 2)
    
    }
    
    func testOwnAndAdd(){
    
        let app = XCUIApplication()
        app.buttons["Landlord"].tap()
        
        
        let appButton = app.buttons.count
        let appLabel = app.staticTexts.count
        XCTAssertEqual(appButton, 7)
        XCTAssertEqual(appLabel, 11)
        
        XCTAssert(app.navigationBars.staticTexts["My Property"].exists)
        app.tables.cells.staticTexts.element(matching: .staticText, identifier: "$400").tap()
        XCTAssert(app.navigationBars.staticTexts["Detail"].exists)
        XCTAssert(app.staticTexts["$400"].exists)
        XCTAssert(app.staticTexts["40 Cootamundra Crescent Blackburn 3130"].exists)
        app.navigationBars["Detail"].buttons["My Property"].tap()
        
        app.navigationBars["My Property"].buttons["Add"].tap()
        
        let tablesQuery2 = app.tables
        tablesQuery2.children(matching: .button).element.tap()
        app.navigationBars["Photos"].buttons["Cancel"].tap()
        
        let tablesQuery = tablesQuery2
        app.otherElements.containing(.navigationBar, identifier:"Add Property").children(matching: .other).element.children(matching: .other).element.swipeUp()
        tablesQuery.buttons["Add"].tap()
        
        let alertCount = app.alerts.count
        XCTAssertEqual(alertCount, 1)
        app.alerts["No Image!"].buttons["OK"].tap()
        
    
    }
    
    
    
    
}
