//
//  다리를_지나는_트럭.swift
//  Algorithm
//
//  Created by Soso on 2020/07/17.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/42583

import Foundation

class 다리를_지나는_트럭: Runnable {
    func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
        let weights = truck_weights
        let length = bridge_length
        var trucksOnTheBridge: [Truck] = []
        var currentIndex = 0
        var total = 0
        var result = 0

        repeat {
            result += 1
            if !trucksOnTheBridge.isEmpty && trucksOnTheBridge[0].location + length - 1 < result {
                let first = trucksOnTheBridge.removeFirst()
                total -= first.weight
            }
            guard currentIndex < weights.count else {
                continue
            }
            let current = weights[currentIndex]
            if total + current <= weight {
                total += current
                let truck = Truck(location: result, weight: current)
                trucksOnTheBridge.append(truck)
                currentIndex += 1
            }
        } while !trucksOnTheBridge.isEmpty

        return result
    }

    struct Truck {
        var location: Int
        var weight: Int
    }

    func run() -> Bool {
        let result = solution(2, 10, [7, 4, 5, 6])
        let expected = 8
        return result == expected
    }
}
