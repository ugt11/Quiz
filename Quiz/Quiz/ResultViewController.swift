//
//  ResultViewController.swift
//  Quiz
//
//  Created by spark-04 on 2024/05/10.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var nameText: String = ""
    var score: Int = 0
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let count = quizManager.quizzes.count
        
        // Do any additional setup after loading the view.
        
        self.label.text = "\(self.nameText)さん　あなたのスコアは\(self.score)です。"
        
        var text = ""
        switch self.score {
        case 0...2:
            text = "動物に関してあまり興味はないでしょうか？\n\nもっと頑張りましょう！"
        case 3..<count:
            text = "動物にはかなり詳しい方ですね！\n\nもう少しです！"
        case count:
            text = "全問正解です！\n\nおめでとうございます！"
        default:
            break
        }
        self.textView.text = text
        
    }

    @IBAction func pushResultButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
