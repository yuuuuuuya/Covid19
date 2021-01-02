//
//  KenDetailsReportViewController.swift
//  koronaDataFromAPI
//

import UIKit
import Alamofire

// 各県詳細レポート画面
class KenDetailsReportViewController: UIViewController {

    //MARK : - Property

    /// 県名
    var kennmeiText = ""
    /// 人口
    var jinkoText = ""
    /// 感染者数
    var kansenshaText = ""
    /// 死者数
    var deathesText = ""
    /// pcr検査数
    var pcrText = ""
    /// 重症者数
    var judoText = ""
    /// エリア一覧で押下されたセルのセクション
    var receiveCellSection: Int?
    /// エリア一覧で押下されたrowの番号
    var receiveCellRow: Int?
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
        communicationAPI()
        labelRayout()
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
    
    ///API通信してラベルを書き換え
    func communicationAPI() {
        //インジケーター開始
        self.indicator.startAnimating()
        
        //API通信開始
        AF.request("https://covid19-japan-web-api.now.sh/api/v1/prefectures").responseJSON{ response in
            guard let responseData = response.data else {
                return
            }
            guard let covid19Araay = try? self.decade.decode([ResponseData].self, from: responseData) else{
                return
            }
            
            guard let receiveCellSection = self.receiveCellSection else{ return }
            guard let receiveCellRow = self.receiveCellRow else{ return }
            
            let selectedRowArray: Covid19ReportStruct?
            
            /// エリア一覧から受け取ったセクション情報を元に、押下された県の配列を変数に代入
//            switch receiveCellSection {
//            case 0:
//                selectedRowArray = covid19Araay[0]
//            case 1:
//                let num = 1 + receiveCellRow
//                selectedRowArray  = covid19Araay[num]
//            case 2:
//                let num = 7 + receiveCellRow
//                selectedRowArray  = covid19Araay[num]
//            case 3:
//                let num = 14 + receiveCellRow
//                selectedRowArray  = covid19Araay[num]
//            case 4:
//                let num = 23 + receiveCellRow
//                selectedRowArray  = covid19Araay[num]
//            case 5:
//                let num = 30 + receiveCellRow
//                selectedRowArray  = covid19Araay[num]
//            case 6:
//                let num = 35 + receiveCellRow
//                selectedRowArray  = covid19Araay[num]
//            case 7:
//                let num = 39 + receiveCellRow
//                selectedRowArray  = covid19Araay[num]
//            default:
//                return
//            }
            
            /// 各ラベルを押下された県のデータに書き換え
//            self.kennmeiLabel.text = "\(selectedRowArray?.name_ja ?? "")のレポート"
//            self.jinkoLabel.text = "人工：\(String(selectedRowArray?.population ?? 0))"
//            self.kansenshaLabel.text = "総感染者数数：\(String(selectedRowArray?.cases ?? 0))"
//            self.deathesLabel.text = "総死亡者数：\(String(selectedRowArray?.deaths ?? 0))"
//            self.pcrLabel.text = "総pcr検査数：\(String(selectedRowArray?.pcr ?? 0))"
//            self.judoLabel.text = "総重症者数：\(String(selectedRowArray?.severe ?? 0))"
            
            //インジケーター終了
            self.indicator.stopAnimating()
        }
    }
}
