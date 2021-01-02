//
//  ResponseListCovid19API.swift
//  koronaDataFromAPI
//

import Foundation

struct Covid19ReportStruct {
    var areaName: String
    var areaID: Int /// エリアを区別するID。IndexPath.sectionと合わせている
    var todofukenID: Int
    var isShown: Bool /// trueがtableviewに表示
    var responseData :ResponseData?
}

struct ResponseData: Codable{
    var id: Int
    var name_ja: String /// 県名
    var population: Int /// 人工
    var cases: Int      /// 感染者数
    var deaths: Int     /// 死者
    var pcr: Int        /// pcr検査数
    var severe: Int     /// 重傷者数
}
