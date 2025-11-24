//
//  TwoSum.swift
//  s-coding
//
//  Created by Lee Whitney on 3/27/25.
//

import Foundation

// Two Sum - Problem #1
//
// Problem:
//  Given an array of integers and a target sum, return the indices of two numbers
//  in the array that add up to the target.
//
// Requirements:
//  - Each input will have exactly one solution
//  - You may not use the same element twice
//  - Return the indices of the two numbers that add up to the target
//
// Example:
//  Input: nums = [1, 7, 11, 15], target = 9
//  Output: [0, 1] (because nums[0] + nums[1] = 2 + 7 = 9)
//
var i = 0

func twoSum_Test() {
//    let nums = [1, 7, 11]
    let nums = [2, 7, 11, 15, 18, 20, 22, 24, 26, 28]
    let target1 = 55

    if let solution = twoSum(nums, target1) {
        print("\nSolution is array indices:")
        print("\(solution[0]), \(solution[1])")
        print("\n")
    } else {
        print("\nNo solution")
        print("\n")
    }
    //print("n^2: \(nums1.count * nums1.count)")
    //print("n: \(nums1.count)")
    //print("iterations: \(i)")
}

// O(n), linear time solution., n(n-1)/2 in practice, basicaly n^2/2
func twoSum(_ nums: [Int], _ target: Int) -> [Int]? {
    var numToIndex = [Int:Int]()

    for (index, num) in nums.enumerated() {

        // Complement is the key in the hashtable
        // Array index is the value in the hashtable
        let complement = target - num
        numToIndex[complement] = index

        print("array index: \(index)   array element: \(num)   complement: \(complement)")

        if let foundIndex = numToIndex[num] {
            print("\nArray element \(num) exists as a key in our hashtable.")
            print("Looking up the key in the hashtable gives us the first array index: \(foundIndex)")
            return [foundIndex, index]
        }
    }

    print("\nSolution not found, here is the hashtable")
    print("index   comp")
    for (key, val) in numToIndex.sorted(by: { $0.value < $1.value }) {
        print("\(val)       \(key)")
    }
    return nil
}


// O(n^2) solution, n(n-1)/2 in practice, basicaly n^2/2
func twoSum_Quadratic(_ nums: [Int], _ target: Int) -> [Int]? {
    for (index1, num1) in nums.enumerated() {
        for index2 in (index1 + 1)..<nums.count {
            i += 1
            let num2 = nums[index2]
            if num1 + num2 == target {
                return [index1, index2]
            }
        }
    }
    return nil
}
