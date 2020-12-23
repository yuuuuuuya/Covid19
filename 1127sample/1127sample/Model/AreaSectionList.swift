//
//  areaSectionList.swift
//  koronaDataFromAPI
//

import Foundation

struct AreaSectionList {
    var areaName: String //地域の名前
    var todofukensuu: Int //areaNameの地域にある都道府県の数
    var isShown: Bool      //true→セル表示,faulse→セル非表示
}
