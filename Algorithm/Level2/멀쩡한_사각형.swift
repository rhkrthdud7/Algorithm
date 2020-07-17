//
//  멀쩡한_사각형.swift
//  Algorithm
//
//  Created by Soso on 2020/07/17.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/62048

import Foundation

class 멀쩡한_사각형: Runnable {
    func solution(_ w: Int, _ h: Int) -> Int64 {
        let value = gcd(w, h)

        let minW = w / value
        let minH = h / value
        let count = minW - 1 + minH

        return Int64(w * h - count * value)
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        let remainder = abs(a) % abs(b)
        if remainder != 0 {
            return gcd(abs(b), remainder)
        } else {
            return abs(b)
        }
    }

    func run() -> Bool {
        let result = solution(8, 12)
        let expected = 80
        return result == expected
    }
}
