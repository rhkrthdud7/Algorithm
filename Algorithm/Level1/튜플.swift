//
//  튜플.swift
//  Algorithm
//
//  Created by Soso on 2020/07/13.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/64065

import Foundation

class 튜플: Runnable {
    func solution(_ s: String) -> [Int] {
        let array = Array(s)
        var level = 0
        var sets = [Set<String>]()
        var set = Set<String>()
        var temp = ""

        for i in array.indices {
            let value = String(array[i])
            if value == "{" {
                level += 1
                continue
            } else if value == "}" {
                if level == 2 {
                    set.insert(temp)
                    temp = ""
                    sets.append(set)
                    set = Set()
                }
                level -= 1
                continue
            }
            if level == 2 {
                if value == "," {
                    set.insert(temp)
                    temp = ""
                } else {
                    temp += value
                }
            }
        }

        sets.sort(by: { $0.count < $1.count })

        var answer = [Int]()
        for i in sets.indices {
            if i > 0 {
                answer.append(contentsOf: sets[i - 1].symmetricDifference(sets[i]).map({ Int($0)! }))
            } else {
                answer.append(contentsOf: sets.first!.map({ Int($0)! }))
            }
        }

        return answer
    }

    func run() -> Bool {
        let result = solution("{{2,1},{2,1,3},{2},{2,1,3,4}}")
        let expected = [2, 1, 3, 4]
        return result == expected
    }
}
