//
//  podsTestTests.swift
//  podsTestTests
//
//  Created by Becca Nelson on 7/13/16.
//  Copyright © 2016 8th Light. All rights reserved.
//

@testable import iOS_tic_tac_toe
import Quick
import Nimble

class podsTestTests: QuickSpec {
    let controller = GameViewController()
    override func spec() {
        describe("test") {
            it("adds") {
                expect(2).to(equal(1+1))
            }
            
            it("subtracts") {
                expect(3).to(equal(5-2))
            }
            
            it("addsAgain") {
                expect(2).to(equal(1+1))
            }
        }
    }
}

