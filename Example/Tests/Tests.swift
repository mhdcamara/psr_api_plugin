// https://github.com/Quick/Quick

import Quick
import Nimble
import psr_api_plugin

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will fail") {

            it("can do maths") {
                expect(1) == 2
            }

            it("can read") {
                expect("number") == "string"
            }

            it("will eventually fail") {
                expect("time").toEventually( equal("done") )
            }
            
            context("these will pass") {

                it("can do maths") {
                    expect(23) == 23
                }

                it("can read") {
                    expect("🐮") == "🐮"
                }

                it("will eventually pass") {
                    var time = "passing"

                    DispatchQueue.main.async {
                        time = "done"
                    }

                    waitUntil { done in
                        Thread.sleep(forTimeInterval: 0.5)
                        expect(time) == "done"

                        done()
                    }
                }
            }
        }
    }
    
//    func test_circleImage() {
//        // This is an example of a functional test case.
//      let testImage = UIImageView()
//        testImage.circleImageView(borderColor: UIColor.black, borderWidth: 3.0)
//        
//        XCTAssert(testImage.layer.borderWidth == 3.0)
//    }
}
