//
//  ImageFormatCatalogTests.swift
//  ImageFormatCatalogTests
//
//  Created by 能登 要 on 2019/05/25.
//  Copyright © 2019 能登 要. All rights reserved.
//

import XCTest
@testable import ImageFormatCatalog
import SnapKit

class ImageFormatCatalogTests: XCTestCase {

    var window: UIWindow!
    var viewController: ViewController!
    
    override func setUp() {
        window = UIWindow()
        viewController = ViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        _ = viewController.view
    }
    
    override func tearDown() {
        window.resignKey()
    }
    
    func test_WebPイメージロード() {
        let expect = expectation(description: "WebPイメージロード")
        viewController.loadWebPImage(.jpeg) { (image, error) in
            XCTAssertNotNil(image)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5.0)
    }
    
    func test_シンプルテスト() {
        let view = UIView()
        view.snp.makeConstraints { (make) in
            
        }
    }

    func test_Jpegイメージロード() {
        let expect2 = expectation(description: "Jpegイメージロード")
        viewController.loadWebPImage(.jpeg) { (image, error) in
            XCTAssertNotNil(image)
            expect2.fulfill()
        }
        wait(for: [expect2], timeout: 5.0)
    }

}
