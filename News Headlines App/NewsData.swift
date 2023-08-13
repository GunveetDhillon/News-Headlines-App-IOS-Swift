//
//  NewsData.swift
//  News Headlines App
//
//  Created by Gunveet Singh Dhillon on 2023-08-13.
//

import Foundation

struct NewsData:Codable
{
    let status:String
    let articles:[ArticleData]
   
}
