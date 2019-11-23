//
//  Article.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 22/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct Article {
    let title: String
    let imageUrl: String?
    let urlString: String
    let description: String?
    let content: String?
    let publishDate: String
    let sourceName: String
}

extension Article {
    static func makeFirstMock() -> Article {
        return Article(title: "Scooter Braun Tells Taylor Swift His Family's Death Threats Are Because of Her Attacks - TMZ",
                       imageUrl: "https://kelseyrose.co.uk/wp-content/uploads/2016/02/landscape-1455583846-gettyimages-510441912-600x300.jpg",
                       urlString: "https://news.google.com/__i/rss/rd/articles/CBMiVGh0dHBzOi8vd3d3LnRtei5jb20vMjAxOS8xMS8yMi9zY29vdGVyLWJyYXVuLXNwZWFrcy10YXlsb3Itc3dpZnQtZmFucy1kZWF0aC10aHJlYXRzL9IBVGh0dHBzOi8vYW1wLnRtei5jb20vMjAxOS8xMS8yMi9zY29vdGVyLWJyYXVuLXNwZWFrcy10YXlsb3Itc3dpZnQtZmFucy1kZWF0aC10aHJlYXRzLw?oc=5",
                       description: nil,
                       content: nil,
                       publishDate: "2019-11-22T14:18:00Z",
                       sourceName: "Google News")
    }
    
    static func makeSecondMock() -> Article {
        return Article(title: "AG Barr says Jeffrey Epstein death was result of 'perfect storm of screw ups' - Fox News",
                       imageUrl: "https://media.foxbusiness.com/BrightCove/854081161001/201911/2756/854081161001_6106319488001_6106329630001-vs.jpg",
                       urlString: "https://www.foxnews.com/politics/attorney-general-barr-says-jeffrey-epstein-death-was-result-of-perfect-storm-of-screw-ups",
                       description: "Attorney General William Barr said that disgraced financier Jeffrey Epstein’s suicide death was the result of /“a perfect storm of screw ups./”",
                       content: "Attorney General William Barr said that disgraced financier Jeffrey Epstein’s suicide death was the result of “a perfect storm of screw ups.”\r\nBarr, during an interview with the Associated Press late Thursday, said that his concerns about Epstein’s death were… [+5602 chars]",
                       publishDate: "2019-11-22T13:43:55Z",
                       sourceName: "Fox News")
    }
    
    static func makeThirdMock() -> Article {
        return Article(title: "Amazon Black Friday 2019 deals start now: Big price cuts hit all Fire tablets, all Kindles and Echo Show 8 - CNET",
                       imageUrl: "https://cnet1.cbsistatic.com/img/HkDlAhQeXf9rBhMWeZEok6jzPJE=/756x567/2019/05/08/932f6249-2171-48e1-a360-30dd95b5f58e/amazon-fire-7-14.jpg",
                       urlString: "https://www.cnet.com/news/amazon-black-friday-2019-amazon-device-deals-start-now-big-price-cuts-hit-kindle-paperwhite-echo-show-8-and-most-fire/",
                       description: "Black Friday begins a week early at Amazon with some of the best prices seen since Prime Day.",
                       content: "This story is part of Holiday Gift Guide 2019, your source for the season's best gifts and deals, hand-picked by the experts at CNET.\r\n Black Friday doesn't officially start until Nov. 29, but it's officially arrived early at Amazon. The online retailer has d… [+2828 chars]",
                       publishDate: "2019-11-22T13:20:00Z",
                       sourceName: "Cnet.com")
    }
    
    static func makeFourthMock() -> Article {
        return Article(title: "Hill and Holmes' impeachment testimony, Netanyahu's indictment and Tesla's 'Cybertruck' reveal: The Morning Rundown - NBCNews.com",
                       imageUrl: nil,
                       urlString: "https://news.google.com/__i/rss/rd/articles/CBMiggFodHRwczovL3d3dy5uYmNuZXdzLmNvbS9uZXdzL21vcm5pbmctYnJpZWZpbmcvaGlsbC1ob2xtZXMtaW1wZWFjaG1lbnQtdGVzdGltb255LW5ldGFueWFodS1zLWluZGljdG1lbnQtdGVzbGEtcy1jeWJlcnRydWNrLW4xMDg5NDQ20gEsaHR0cHM6Ly93d3cubmJjbmV3cy5jb20vbmV3cy9hbXAvbmNuYTEwODk0NDY?oc=5",
                       description: nil,
                       content: nil,
                       publishDate: "2019-11-22T12:51:00Z",
                       sourceName: "Google News")
    }
}
