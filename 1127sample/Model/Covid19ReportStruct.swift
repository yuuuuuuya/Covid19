//
//  ResponseListCovid19API.swift
//  koronaDataFromAPI
//

import Foundation

struct Covid19ReportStruct: Codable{
    var areaName: String
    var AreaId: Int /// エリアを区別するID。IndexPath.sectionと合わせている
    var todofukenID: Int
    var responseData :ResponseData
}

struct ResponseData: Codable{
    var id: Int
    var name_ja: String
    var population: Int
    var cases: Int
    var deaths: Int
    var pcr: Int
    var severe: Int
}
