//
//  KenDetailsReportViewController.swift
//  koronaDataFromAPI
//

import UIKit
import Alamofire

// 各県詳細レポート画面
class KenDetailsReportViewController: UIViewController {

    //MARK : - Property

    /// エリア一覧で押下されたセルのセクション
    var receiveCell: Covid19ReportStruct?
    /// jsonデコーダー
    let decade = JSONDecoder()
    /// インジケーター
    let indicator = UIActivityIndicatorView()
    
    // MARK : - IBOutlet
    
    ///県名ラベル
    @IBOutlet weak var kennmeiLabel: UILabel!
    /// 人口ラベル
    @IBOutlet weak var jinkoLabel: UILabel!
    /// 感染者数ラベル
    @IBOutlet weak var kansenshaLabel: UILabel!
    /// 死者数ラベル
    @IBOutlet weak var deathesLabel: UILabel!
    /// pcr検査数ラベル
    @IBOutlet weak var pcrLabel: UILabel!
    /// 重症者数ラベル
    @IBOutlet weak var judoLabel: UILabel!
    /// 県名ラベルheight
    @IBOutlet weak var kennmeiLabelHeight: NSLayoutConstraint!
    /// 県名ラベルtop位置
    @IBOutlet weak var kennmeiLabelTop: NSLayoutConstraint!
    /// 感染者数ラベルtop位置
    @IBOutlet weak var kansenshaLabelTop: NSLayoutConstraint!
    /// 死者数ラベルtop位置
    @IBOutlet weak var deathesLabelTop: NSLayoutConstraint!
    /// pcr検査数ラベルtop位置
    @IBOutlet weak var pcrLabelTop: NSLayoutConstraint!
    /// 重傷者数ラベルtop位置
    @IBOutlet weak var judoLabelTop: NSLayoutConstraint!
    
    // MARK : - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK : - Private method

extension KenDetailsReportViewController {
    
    ///初期処理
    func setup() {
        setIndicate()
        labelRayout()
        labelSet()
    }
    
    /// ラベル書き換え
    func labelSet() {
        guard let cell = self.receiveCell?.responseData else {
            return
        }
        kennmeiLabel.text = "県名:\(cell.name_ja)"
        jinkoLabel.text = "人工:\(String(cell.population))"
        kansenshaLabel.text = "感染者数:\(String(cell.cases))"
        deathesLabel.text = "死者数:\(String(cell.deaths))"
        pcrLabel.text = "pcr検査数:\(String(cell.pcr))"
        judoLabel.text = "重傷者数:\(String(cell.severe))"
    }
    
    ///ラベルのAutolayout
    func labelRayout() {
        let vcFrame = self.view.frame
        let vcFrameSplit = vcFrame.height / 13
        kennmeiLabelTop.constant = vcFrameSplit
        kansenshaLabelTop.constant = vcFrameSplit
        deathesLabelTop.constant = vcFrameSplit
        pcrLabelTop.constant = vcFrameSplit
        judoLabelTop.constant = vcFrameSplit
    }
    
    ///インジケーター設定
    func setIndicate() {
        indicator.center = view.center
        indicator.style = .large
        indicator.color = .blue
        view.addSubview(indicator)
    }
    
    
}
