//
//  VpnSessions.swift
//
//   You’re working on a VPN client that logs when apps on the device open and close secure network sessions.
//
//   You’re given a list of sessions, where each session is represented as:
//       •    start: an integer timestamp in seconds
//       •    end: an integer timestamp in seconds
//   (guaranteed start <= end)
//
//   Each session is [start, end) — inclusive of start, exclusive of end.
//
//   Write a function that, given this list of sessions, returns:
//       1.    totalActiveTime – the total number of seconds during which at least one session was active.
//       2.    maxConcurrentSessions – the maximum number of sessions that were active at the same time.
//
//   Order of input intervals is arbitrary; there may be overlaps, duplicates, and contained intervals.
//
//   You should handle up to 10^5 sessions efficiently.

import Collections


struct Range {
    var start: Int = 0
    var end: Int = 0

    var activeTime: Int {
        return end-start
    }

    mutating func merge(_ range: Range) {
        start = min(start, range.start)
        end = max(end, range.end)
    }

    func overlaps(_ range: Range) -> Bool {
        return false
    }
}

struct Activity {
    var totalActiveTime: Int = 0
    var maxConcurrentSessions: Int = 0
    // debug only
    var ranges = [Range]()
}

var count = 0

struct VpnSessions {
    init() {
        var sessions: [Range] = [
//            Range(start: 0, end: 3),
//            Range(start: 1, end: 4),
//            Range(start: 2, end: 5),

//            Range(start: 1, end: 9),
//            Range(start: 2, end: 10),
//            Range(start: 3, end: 8),
//            Range(start: 4, end: 10),
//            Range(start: 7, end: 16),
//            Range(start: 8, end: 13),
        ]

        let max = 30
        for _ in 0..<10 {
            let size = Int.random(in: 1..<max/3)
            let start = Int.random(in: 0..<max-size)
            let end = start+size

            sessions.append(Range(start: start, end: end))
        }


        sessions = sessions.sorted(by: { $0.start < $1.start })

        let activity = getStatus(sessions: sessions)

        let column = 9
        p("".appendAtColumn(column, String(repeating: "0123456789", count: 3)))
        p("Session ")
        for session in sessions {
            var s = "\(session.start),\(session.end)"
            s = s.appendAtColumn(column, String(repeating: " ", count: session.start))
            s = s + String(repeating: "x", count: session.activeTime)
            p(s)
        }
        p("\nRange ")
        for range in activity.ranges {
            var s = "\(range.start),\(range.end) (\(range.activeTime))"
            s = s.appendAtColumn(column, String(repeating: " ", count: range.start))
            s = s + String(repeating: "x", count: range.activeTime)
            p(s)
        }

        p()
        p("totalActiveTime:       \(activity.totalActiveTime)")
        p("maxConcurrentSessions: \(activity.maxConcurrentSessions)")

        p()
        p("n = \(sessions.count)")
        p("count: \(count)")

        p()
    }

    func getStatus(sessions: [Range]) -> Activity {
        var activity = Activity()

        // Merge sessions into contiguous ranges
        for session in sessions {
            if activity.ranges.isEmpty {
                activity.ranges.append(session)
                count += 1
            }
            else {
                var merged = false

                for (index, range) in activity.ranges.enumerated() {
                    // If contained, overlap, or adjacent
                    if (session.start >= range.start && session.start <= range.end) ||
                        (session.end >= range.start && session.end <= range.end) {
                        activity.ranges[index].merge(session)
                        merged = true
                    }
                    count += 1
                }
                if merged == false {
                    activity.ranges.append(session)
                }
            }
        }

        // Find total active time
        for range in activity.ranges {
            activity.totalActiveTime += range.activeTime
        }

        // Find max concurrent sessions
        var index = 0
        while index < sessions.count-1 {
            var concurrent = 1
            var session = sessions[index]
            var nextSession = sessions[index+1]

            while session.end > nextSession.start {
                concurrent += 1

                // shrink down to subset of nextSession
                session.start = max(session.start, nextSession.start)
                session.end = min(session.end, nextSession.end)

                count += 1

                index += 1
                if index >= sessions.count-1 {
                    break
                }

                nextSession = sessions[index+1]
            }
            activity.maxConcurrentSessions = max(concurrent,activity.maxConcurrentSessions)

            index += 1
        }


        return activity
    }
}
