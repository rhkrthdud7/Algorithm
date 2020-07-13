//
//  비밀지도.swift
//  Algorithm
//
//  Created by Soso on 2020/07/13.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/17681

import Foundation

class 비밀지도: Runnable {
    func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
        var values: [String] = []
        
        for (val1, val2) in zip(arr1, arr2) {
            var str = String(val1 | val2, radix: 2)
            while str.count < n {
                str = " " + str
            }
            values.append(str)
        }
        let answer = values.map({ value in
            return String(value.map({ $0 == "1" ? "#" : " " }))
        })
        
        return answer
    }
    
    func run() -> Bool {
        let result = solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
        let expected = ["#####", "# # #", "### #", "#  ##", "#####"]
        return result == expected
    }
}
