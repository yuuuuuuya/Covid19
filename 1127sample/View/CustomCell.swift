//
//  CustomCell.swift
//  koronaDataFromAPI
//

import UIKit


//エリア一覧セルクラス

class CustomCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    /// 都道府県名
    @IBOutlet weak var todoufukenLabel: UILabel!
    /// 総感染者数
    @IBOutlet weak var kansennshaLabel: UILabel!
    
    // MARK: - Property
    
    // MARK: - Initializer
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Method

    /// ラベルの文字変更
    func setLabelText(response: Covid19ReportStruct) {
        guard let responseDate = response.responseData else {
            return
        }
        todoufukenLabel.text = response.responseData?.name_ja
        /// セルの再利用防止
        kansennshaLabel.textColor = .black
        /// 感染者数5000人以上は赤文字
        if responseDate.cases > 5000{
            kansennshaLabel.textColor = .red
        }
        kansennshaLabel.text = "感染者数:\(String(responseDate.cases))"
    }
}
