//
//  쇠막대기.swift
//  Algorithm
//
//  Created by Soso on 2020/07/15.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/42585

import Foundation

class 쇠막대기: Runnable {
    func solution(_ arrangement: String) -> Int {
        let array = Array(arrangement).map(String.init)
        var level = 0
        var count = 0

        for i in array.indices {
            let value = array[i]
            if value == "(" {
                level += 1
            } else {
                level -= 1
                if array[i - 1] == "(" {
                    count += level
                } else {
                    count += 1
                }
            }
        }
        print(count)

        return count
    }

    func run() -> Bool {
        let result = solution("()(((()())(())()))(())")
        let expected = 17
        return result == expected
    }
}
