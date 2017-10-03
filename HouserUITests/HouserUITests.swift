

import XCTest

class HouserUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
     
        continueAfterFailure = false
      
        XCUIApplication().launch()

    }
    
    override func tearDown() {
       
        super.tearDown()
    }
    
    func testPicker() {

    let app = XCUIApplication()
        let buttonNumber = app.buttons.count
        let labelNumber = app.staticTexts.count
         let tablesQuery = app.tables
        let cellCount = app.cells.count
        
        XCTAssertEqual(buttonNumber, 11)
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
    
    func testAlert() {
        let app = XCUIApplication()
        
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
  
        app.tables.cells.buttons["Search"].tap()
        app.tables.cells.staticTexts.element(matching: .staticText, identifier: "$200").tap()
        XCTAssert(app.navigationBars.staticTexts["Detail"].exists)
        XCTAssert(app.staticTexts["$200"].exists)
        XCTAssert(app.staticTexts["15 Docklands Dr CBD 3000"].exists)
        XCTAssert(app.buttons["Call Landlord"].exists)
        XCTAssert(app.buttons["Text Landlord"].exists)

        
        app.navigationBars["Detail"].buttons["List"].tap()
        XCTAssert(app.navigationBars.staticTexts["List"].exists)
        
    
    }
    
}
