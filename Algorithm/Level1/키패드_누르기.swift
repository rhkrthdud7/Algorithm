//
//  키패드_누르기.swift
//  Algorithm
//
//  Created by Soso on 2020/07/12.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/67256

import Foundation

class 키패드_누르기: Runnable {
    func solution(_ numbers: [Int], _ hand: String) -> String {
        /*
         let keypad = [
             [1, 4, 7, 10],
             [2, 5, 8, 11],
             [3, 6, 9, 12]
         ]
         */

        let isLeftHanded = hand == "left"
        var left = [0, 3]
        var right = [2, 3]
        var result = ""

        // next의 행 == (number - 1) % 3
        // next의 열 == (number - 1) / 3
        for number in numbers {
            var next = [(number - 1) % 3, (number - 1) / 3]
            if number == 0 {
                next = [1, 3]
            }
            if next[0] == 0 {
                left = next
                result += "L"
            } else if next[0] == 2 {
                right = next
                result += "R"
            } else {
                let leftDistance = distance(left, next)
                let rightDistance = distance(right, next)
                if leftDistance > rightDistance {
                    right = next
                    result += "R"
                } else if leftDistance < rightDistance {
                    left = next
                    result += "L"
                } else if isLeftHanded {
                    left = next
                    result += "L"
                } else {
                    right = next
                    result += "R"
                }
            }
        }

        return result
    }

    func distance(_ first: [Int], _ second: [Int]) -> Int {
        return abs(first[0] - second[0]) + abs(first[1] - second[1])
    }

    func run() -> Bool {
        let result = solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right")
        let expected = "LRLLLRLLRRL"
        return result == expected
    }
}
