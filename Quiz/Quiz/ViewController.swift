//
//  ViewController.swift
//  Quiz
//
//  Created by spark-04 on 2024/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // タップジェスチャーリコグナイザーを追加
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 戻ってきたときに nameTextField の中を空欄にし、選択状態を解除する
        nameTextField.text = ""
        // 次のランループサイクルで選択状態を解除する
        DispatchQueue.main.async {
            self.nameTextField.resignFirstResponder()
        }
    }

    @IBAction func pressButton(_ sender: Any) {
        // ボタンが押されたときの処理
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let quizViewController = segue.destination as? QuizViewController {
            if let text = self.nameTextField.text {
                quizViewController.nameText = text
            }
        }
    }
    
    // キーボードを閉じる処理
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
