//
//  SumViewController.swift
//  Crisp
//
//  Created by Nikhil Anu on 6/8/19.
//  Copyright © 2019 Nikhil Anu. All rights reserved.
//

import UIKit

class SumViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var finalSumm: UITextView!
    var sumText = String()

    var quote = ""
    let tagger = NSLinguisticTagger(tagSchemes:[.tokenType, .language, .lexicalClass, .nameType, .lemma], options: 0)
    let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
    var allwords = [String]()
    var allSentences = [String]()
    var stopWords = [String]()
    var filteredWords = [String]()
    var frequency = [String:Int]()
    var score = [Int]()
    var summary = ""
    var finalwordcount = 0
    
    
    
    func tokenizeAsWord(for text: String) {
        tagger.string = text
        let range = NSRange(location: 0, length: text.utf16.count)
        tagger.enumerateTags(in: range, unit: .word, scheme: .tokenType, options: options) { tag, tokenRange, stop in
            let word = (text as NSString).substring(with: tokenRange)
            allwords.append(word)
        }
        //    print(allwords)
    }
    
    func tokenizeAsSentence(for text: String) {
        tagger.string = text
        let range = NSRange(location: 0, length: text.utf16.count)
        tagger.enumerateTags(in: range, unit: .sentence, scheme: .tokenType, options: options) { tag, tokenRange, stop in
            let sentence = (text as NSString).substring(with: tokenRange)
            allSentences.append(sentence)
        }
        //print(allSentences)
    }
    
    func priority(size: Int){
        var score1 = score
        var index = -1
        for _ in 1...size{
            var maxval = 0
            for k in 0..<score1.count{
                if score1[k]>maxval{
                    maxval = score1[k]
                    index = k
                }
            }
            score1[index] = 0
            summary += (allSentences[index])
        }
        finalSumm.text = summary
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalSumm.isEditable = false
        finalSumm.text = sumText
        quote = finalSumm.text.replacingOccurrences(of: "\n", with: " ")
        
        tokenizeAsWord(for: quote)
        
        if let stopWordsURL = Bundle.main.url(forResource: "stopwords", withExtension: "txt") {
            if let stopWordsContent = try? String(contentsOf: stopWordsURL){
                stopWords = stopWordsContent.components(separatedBy: "\n")
            }
        }
        
        for word in allwords {
            if !stopWords.contains(word.lowercased()){
                filteredWords.append(word)
            }
        }
        
        print(filteredWords)
        
        for i in filteredWords{
            if frequency.keys.contains(i){
                let oldValue = frequency.updateValue(1, forKey: i)
                let x = oldValue
                _ = frequency.updateValue(x!+1, forKey: i)
            }
            else{
                frequency[i] = 1
            }
        }
        
        //print(frequency)
        tokenizeAsSentence(for: quote)
        
        
        for sentence in allSentences{
            var x = 0
            for word in filteredWords{
                if sentence.contains(word){
                    x += frequency[word]!
                }
            }
            score.append(x)
        }
        //print(score)
        priority(size: 3)
        print(allwords.count)
        
        for i in summary{
            if i == " "{
                finalwordcount += 1
            }
        }
        print(finalwordcount)
        // Do any additional setup after loading the view.
        
        
        
        let shapeLayer = CAShapeLayer()
        //let center =  view.center
        
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 90, y: 180), radius: 50, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.gray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 10
        
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
        
        
        //        let circularPath = UIBezierPath(arcCenter: center, radius: 50, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.purple.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0.6
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
        
        
        
        let shapeLayer1 = CAShapeLayer()
        //let center =  view.center
        
        let trackLayer1 = CAShapeLayer()
        
        let circularPath1 = UIBezierPath(arcCenter: CGPoint(x: 280, y: 180), radius: 50, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer1.path = circularPath1.cgPath
        
        trackLayer1.strokeColor = UIColor.gray.cgColor
        trackLayer1.fillColor = UIColor.clear.cgColor
        trackLayer1.lineWidth = 10
        
        trackLayer1.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer1)
        
        
        //        let circularPath = UIBezierPath(arcCenter: center, radius: 50, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        shapeLayer1.path = circularPath1.cgPath
        
        shapeLayer1.strokeColor = UIColor.purple.cgColor
        shapeLayer1.fillColor = UIColor.clear.cgColor
        shapeLayer1.lineWidth = 10
        
        shapeLayer1.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer1.strokeEnd = 0
        view.layer.addSublayer(shapeLayer1)
        
        let basicAnimation1 = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation1.toValue = 0.4
        basicAnimation1.duration = 2
        
        basicAnimation1.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation1.isRemovedOnCompletion = false
        
        shapeLayer1.add(basicAnimation1, forKey: "urSoBasic1")
        
        
        let displayLink1 = CADisplayLink(target: self, selector: #selector(handleUpdate1))
        displayLink1.add(to: .main, forMode: .default)
        
    }
    
    var startValue = 0
    var endValue = 75
    //    let animationDuration = 3.2
    //
    //    let animationStartDate = Date()
    
    @objc func handleUpdate(){
        
        //let now = Date()
        //let elapsedTime = now.timeIntervalSinceNow(animationStartDate)
        
        //        let elapsedTime = Date(timeIntervalSinceNow: animationStartDate)
        //        if elapsedTime > animationDuration {
        //            self.label1.text = "\(endValue)"
        //        } else {
        //            let percentage = elapsedTime / animationDuration
        //            let value = percentage * (endValue - startValue)
        //            self.label1.text = "\(value)"
        //        }
        
        self.label1.text = "\(startValue)%"
        for _ in 1...100000{
            startValue += 1
        }
        startValue -= 100000
        startValue += 1
        
        if startValue > endValue {
            startValue = endValue
        }
        
    }
    
    var startValue1 = 0
    var endValue1 = 50
    //    let animationDuration = 3.2
    //
    //    let animationStartDate = Date()
    
    @objc func handleUpdate1(){
        
        //let now = Date()
        //let elapsedTime = now.timeIntervalSinceNow(animationStartDate)
        
        //        let elapsedTime = Date(timeIntervalSinceNow: animationStartDate)
        //        if elapsedTime > animationDuration {
        //            self.label1.text = "\(endValue)"
        //        } else {
        //            let percentage = elapsedTime / animationDuration
        //            let value = percentage * (endValue - startValue)
        //            self.label1.text = "\(value)"
        //        }
        
        self.label2.text = "\(startValue1)%"
        for _ in 1...100000{
            startValue1 += 1
        }
        startValue1 -= 100000
        startValue1 += 1
        
        if startValue1 > endValue1 {
            startValue1 = endValue1
        }
        
    }
    @IBAction func closeit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   

}
