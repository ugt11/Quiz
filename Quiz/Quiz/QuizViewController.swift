//
//  QuizViewController.swift
//  Quiz
//
//  Created by spark-04 on 2024/05/07.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var nameText: String = ""
    
    @IBOutlet weak var quizCard: QuizCard!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.label.text = self.nameText
        
        self.quizCard.style = .initial
        let panGestureRecognizer =
        UIPanGestureRecognizer(target: self, action: #selector(dragQuizCard(_:)))
        self.quizCard.addGestureRecognizer(panGestureRecognizer)
    }
    @objc func dragQuizCard(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began, .changed:
            self.transformQuizCard(gesture: sender)
        case .ended:
            break
        default:
            break
        }
    }
    
    func transformQuizCard(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.quizCard)
        let translationTransform = CGAffineTransform(translationX: translation.x, y: translation.y)
        let translationPercent = translation.x/UIScreen.main.bounds.width/2
        let rotationAngle = CGFloat.pi/3 * translationPercent
        let rotationTranseform = CGAffineTransform(rotationAngle: rotationAngle)
        let transeform = translationTransform.concatenating(rotationTranseform)
        self.quizCard.transform = transeform
        
        if translation.x > 0 {
            self.quizCard.style = .right
        } else {
            self.quizCard.style = .wrong
        }
        
    }
    

}
