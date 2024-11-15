//
//  Model.swift
//  MyNetworkManager
//
//  Created by Cotne Chubinidze on 11.11.24.
//
import Foundation

public struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

public struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

public struct Source: Codable {
    let id: String?
    let name: String
}
