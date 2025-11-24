//
//  LongestSubString.swift
//  s-coding
//
//  Created by Lee Whitney on 4/2/25.
//

// Problem #3: Longest Substring Without Repeating Characters
//
// Given a string s, find the length of the longest substring without repeating characters.
//
// Example 1:
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.
//
// Example 2:
// Input: s = "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.
//
// Example 3:
// Input: s = "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
//
// Constraints:
// 0 <= s.length <= 5 * 10^4
// s consists of English letters, digits, symbols and spaces.
//
import Foundation

func longestSub_Test() {
//    let s = "dvdf"
    let s = "seed"
    print(s)
    print()
    let sublen = longestSub(s)
//    print(sublen)
    print()
}


func longestSub(_ s: String) -> Int {
    var longest = ""
    var subStringList: [String] = []
    var subString =  ""
    var set = Set<Character>()
    var i = 0, j = 0
    var c = s.characterAt(i)

    j = i
    while !set.contains(c) {
        subString += String(c)
        set.insert(c)
        print("j:\(j)    hash  \(c)")
        j += 1
        c = s.characterAt(j)
    }
    print("j:\(j)")
    subStringList.append(subString)
    print("       add  \(subString)")
    i += i
    print("i:\(j)")
    j = i
    print("j:\(j)")
    while !set.contains(c) {
        subString += String(c)
        set.insert(c)
        print("j:\(j)    hash  \(c)")
        j += 1
        c = s.characterAt(j)
    }
    print("j:\(j)")
    subStringList.append(subString)
    print("       add  \(subString)")
    i += i


    //            subStringList.append(subString)
    //            if subString.count > longest.count {
    //                longest = subString
    //            }
    //            set.removeAll()
    //            print("add  \(subString)")
    //            subString = ""
    //        } else {
    //            subString += String(c)
    //            set.insert(c)
    //            print("hash  \(c)")
    //        }

    print()
    print(longest)
    print()
    return longest.count
}

//func longestSub(_ s: String) -> Int {
//    var longest = ""
//    var subStringList: [String] = []
//    var subString =  ""
//    var set = Set<Character>()
////    var i = 0, j = 0
//
//    for i in 0..<s.count {
//        for j in i..<s.count+1 {
//            if i != j {
//                subString = s.substring(i, j)
//                print("\(i),\(j)  \(subString)")
//                if subString.count > longest.count {
//                    longest = subString
//                }
//            }
//        }
//    }
//    print()
//    print(longest)
//    print()
//    return longest.count
//}

//func longestSub(_ s: String) -> Int {
//    var longest = ""
//    var subStringList: [String] = []
//    var subString =  ""
//    var set = Set<Character>()
//
//    for (index, c) in s.enumerated() {
//        if set.contains(c) {
//            subStringList.append(subString)
//            if subString.count > longest.count {
//                longest = subString
//            }
//            set.removeAll()
//            print("add  \(subString)")
//            subString = ""
//        } else {
//            subString += String(c)
//            set.insert(c)
//            print("hash  \(c)")
//        }
//    }
//    if !subString.isEmpty {
//        subStringList.append(subString)
//        if subString.count > longest.count {
//            longest = subString
//        }
//        print("add  \(subString)")
//    }
//    print()
//    print(longest)
//    print()
//    return longest.count
//}

//func longestSub(_ s: String) -> Int {
//    var longest = ""
//    var subStringList: [String] = []
//    var subString =  ""
//    var set = Set<Character>()
//
//    for (index, c) in s.enumerated() {
//        if set.contains(c) {
//            if !subString.isEmpty {
//                subStringList.append(subString)
//                if subString.count > longest.count {
//                    longest = subString
//                }
//                set.removeAll()
//                print("add  \(subString)")
//                subString = ""
//            } else {
//                subStringList.append(String(c))
//                set.removeAll()
//                print("*add  \(subString)")
//            }
//        } else {
//            subString += String(c)
//            set.insert(c)
//            print("hash  \(c)")
//        }
//    }
//
//    if !subString.isEmpty {
//        subStringList.append(subString)
//        if subString.count > longest.count {
//            longest = subString
//        }
//        print("add  \(subString)")
//    }
//
//    print()
//    print(longest)
//    print()
//    return longest.count
//}
