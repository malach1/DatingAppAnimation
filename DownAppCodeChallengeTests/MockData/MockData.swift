//
//  MockData.swift
//  DownAppCodeChallengeTests
//
//  Created by Malachi Hul on 2024/08/19.
//

import Foundation
@testable import DownAppCodeChallenge

struct MockData {
    // Count: 6 Daters
    static let usersMockDaters = """
    [
        {
            "name": "Sarah",
            "user_id": 13620233,
            "age": 19,
            "loc": "Napa, CA",
            "about_me": "I have a man, I’m looking for a lady that wants to have fun or a long term partnership!",
            "profile_pic_url": "https://down-static.s3.us-west-2.amazonaws.com/picks_filter/female_v2/pic00004.jpg",
        },
        {
            "name": "Megan",
            "user_id": 13620234,
            "age": 22,
            "loc": "Vallejo, CA",
            "about_me": "Out going looking for fwb ",
            "profile_pic_url": "https://down-static.s3.us-west-2.amazonaws.com/picks_filter/female_v2/pic00005.jpg",
        },
        {
            "name": "delilah",
            "user_id": 13620235,
            "age": 24,
            "loc": "Fremont, CA",
            "about_me": "Looking for another women who is interested in pleasuring my man. And for me, just wanting another girlfriend for friendship.\nAsians are a +",
            "profile_pic_url": "https://down-static.s3.us-west-2.amazonaws.com/picks_filter/female_v2/pic00006.jpg",
        },
        {
            "name": "Lizzz",
            "user_id": 13620236,
            "age": 26,
            "loc": "Tokyo",
            "about_me": "Looking for a third in our sex life to spice things up (;",
            "profile_pic_url": "https://down-static.s3.us-west-2.amazonaws.com/picks_filter/female_v2/pic00007.jpg",
        },
        {
            "name": "Nini",
            "user_id": 13620237,
            "age": 27,
            "loc": "Mumbai",
            "about_me": "I’m just looking for a fwb girly 👩‍❤️‍💋‍👩📲💗",
            "profile_pic_url": "https://down-static.s3.us-west-2.amazonaws.com/picks_filter/female_v2/pic00008.jpg",
        },
        {
            "name": "Sugar",
            "user_id": 13620238,
            "age": 28,
            "loc": "Taipei, Taiwan",
            "about_me": "🍣 👩‍🍳 🐈‍⬛ 🌊 ",
            "profile_pic_url": "https://down-static.s3.us-west-2.amazonaws.com/picks_filter/female_v2/pic00009.jpg",
        }
    ]
    """.data(using: .utf8)!
    
    static let mockDater = Dater(
        name: "Sarah",
        userId: 13620233,
        age: 19,
        profilePic: "https://down-static.s3.us-west-2.amazonaws.com/picks_filter/female_v2/pic00004.jpg"
    )
}
