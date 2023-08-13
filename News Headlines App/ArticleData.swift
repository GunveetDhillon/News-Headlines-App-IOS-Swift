//
//  ArticleData.swift
//  News Headlines App
//
//  Created by Gunveet Singh Dhillon on 2023-08-13.
//

import Foundation

struct ArticleData:Codable
{
    let author:String?
    let title:String
    let urlToImage:String?
    let content:String?
}
