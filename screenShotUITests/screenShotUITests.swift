//
//  screenShotUITests.swift
//  screenShotUITests
//
//  Created by Ponkumar's Mac on 18/12/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import XCTest

class screenShotUITests: XCTestCase {

    override func setUp() {
     
        continueAfterFailure = false
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    func testTakeScreenShots(){
         let app = XCUIApplication()
        snapshot("home")
        app.tables.cells.element(boundBy: 2).tap()
           let detailViewcontroller =   app.navigationBars["detail"].buttons["Back"]
        sleep(2)
        snapshot("Detail")
        XCTAssertTrue(detailViewcontroller.exists)
        detailViewcontroller.tap()
        sleep(1)

    }
    
    override func tearDown() {
      
    }

  
   
}
