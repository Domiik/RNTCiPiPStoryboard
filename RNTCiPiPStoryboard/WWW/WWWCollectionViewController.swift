//
//  WWWCollectionViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 22.03.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CellCards"

struct PointWWW {
    let whatPoint: Int
    let wherePoint: Int
}

class WWWCollectionViewController: UICollectionViewController {
    
    
    enum Mode {
        case view
        case select
    }
    
    var collectionWho: (name: [String],whatPoint: [Int],wherePoint: [Int]) = (["K-1.Специальные знания - хорошая ориентировка в конкртеной области, в своем деле"],[1,3,4,5,6,7,8,13,19,23,24,27],[1,2,8,9,13,15,16,18,21,27])
    //var a: [Int] = [1]
    
    var firstCollection: [(name: [String],whatPoint: [Int],wherePoint: [Int])] =
        [(["K-1.Специальные знания - хорошая ориентировка в конкртеной области, в своем деле"],[1,3,4,5,6,7,8,13,19,23,24,27],[1,2,8,9,13,15,16,18,21,27]),
        (["K-2.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21],[36,7,10,16,17,27]),
        (["К-3.Творческое воображение, интуиция "],[1,4,5,7,9,11,12,13,19,21],[3,6,7,16,17]),
        (["К-4.Жизненный опыт, мудрость "],[2,3,4,5,9,10,14,20,21,23,25],[1,2,3,5,10,11,12,14,17,18,19,24,26,27]),
        (["К-5.Умение общаться: обаяние, воспитанность, находчивость "],[2,4,5,8,10,11,21,23,25,26],[1,2,3,4,6,7,14,17,18,19,22,24,26,27]),
        (["К-6.Гуманность, доброта, бескорыстность "],[2,4,5,9,10,11,21,22,23],[1,6,7,12,13,14,17,18,19,27]),
        (["К-7.Активность, инициативность, предприимчивость "],[4,5,8,14,19,20,25],[2,11,14,19,24,26]),
        (["К-8.Воля, смелость, принципиальность "],[4,5,8,9,12,18,20,24],[1,2,3,4,7,11,18,19,21,22,25,27]),
        (["К-9.Самокритичность – умение признаваться в собственных ошибках"],[2,4,5,9,11,12,13,21],[1,2,3,10,14,16,17,19,21,25,27]),
        (["К-10.Достоинство и честь, порядочность, репутация "],[2,4,5,9,11,18,20,23,24],[1,2,3,12,14,17,18,19,20,21,25,26,27]),
        (["К-11.Уравновешенность – способность сдерживать себя и не впадать в отчаяние "],[1,2,4,5,6,7,10,14,15,16,17,19,21,22,23,24,27],[1,8,12,14,15,17,19,21,23,24,26,27]),
        (["К-12.Оптимизм, чувство юмора "],[2,4,9,10,11,12,21,23,25],[1,3,7,16,17,19,26]),
        (["К-13.Логичность, строгость мышления "],[1,3,5,6,7,12,15,17,19,20,24,27], [1,2,4,9,15,16,18,19,20,25]),
        (["К-14.Умение сосредоточиваться на конкретном деле "],[1,3,5,6,12,15,16,17,19,23,24,27],[8,9,10,15,16,18,21,23,24]),
        (["К-15.Умение переключать внимание, быстро улавливать изменения в ситуации "],[2,4,5,7,8,11,12,14,15,17,19,20,21,23,24,27], [2,3,4,9,12,14,15,16,17,18,19,21,24,26]),
        (["К-16.Хорошая память "],[1,3,4,5,7,10,11,16,17,19,21,23,24,25,26,27], [1,2,3,6,7,8,10,11,13,14,16,17,18,19,20,21,24,26,27]),
        (["К-17.Умение оперативно искать информацию – через Интернет, пользоваться записными книжками, картотеками, каталогами, справочниками "],[1,3,4,5,9,12,15,19,23,24,25], [1,2,3,6,8,10,11,15,16]),
        (["К-18.Владение мимикой, позами, жестами – умение выглядеть изящно, привлекательно и убедительно "],[2,4,5,10,11,20,21,22,23], [1,3,7,13,17,26,27]),
        (["К-19.Владение телом – ловкость, координация движений "],[2,4,8,11,14,18,20], [3,7,11,18,19,21,22,25]),
        (["К-20. «Золотые руки» - отличная координация кистей и пальцев рук, умение работать все быстро и качественно"],[6,7,13,16,17,19,27], [8,9,12,20]),
        (["К-21.Физическая сила "],[2,8,16,18,20,22], [4,5,7,11,13,14,17,18,19,20,22,24,25]),
        (["К-22.Внешние достоинства, красота "],[2,4,10,11,21,23,26], [1,3,7,25,26,27]),
        (["К-23.Здоровье – отличная работа различных систем организма "],[2,8,11,14,15,18,20,22,25,26],[4,5,7,11,13,18,19,21,22,24,25,26]),
        (["К-24.Выносливость и работоспособность – умение работать с постоянными нагрузками, надолго мобилизовывать свои силы "],[2,4,5,7,8,9,11,14,17,18,20,25,26,27],[2,3,4,5,7,11,13,14,17,18,19,21,22,23,24,25,26,27]),
        (["К-25.Быстродействие, хорошая реакция "],[2,8,14,17,18,20,22,24],[4,5,6,7,9,12,15,17,18,19,20,21,23,24,25,26]),
        (["К-26.Владение голосом: интонациями, тембром, высотой, силой "],[2,4,5,8,10,11,21], [1,3,7,14,17,18,19,27]),
        (["К-27.Развитые органы чувств: зрение, слух, обоняние, вкус, кожномышечная чувствительность, вестибулярный аппарат, чувство времени "],[6,8,14,20], [13,18,19,21,23,24,25])
        ]
//    var nameWhatCards : [(name: [String], point: [Int])] = [
//        (["Ч-1.Работать с текстами. Много читать, писать, печатать, редактировать, корректировать"],[1]),
//        (["Ч-2.Обслуживать посетителей. Торговать, давать справки, оказывать услуги"],[2]),
//        (["Ч-3.Соста влять планы, программы. Обрабатывать информацию, вести расчеты"],[3]),
//        (["Ч-4.Преподавать, выступать перед аудиториями. Обучать, воспитывать, читать лекции"],[4]),
//        (["Ч-5.Руководить, организовывать взаимодействие. Командовать, контролировать, налаживать деловые «связи»"],[5]),
//        (["Ч-6.Ремонтировать, настраивать, регулировать. Готовить технику и оборудование; ремонтировать помещения"],[6]),
//        (["Ч-7.Делать чертежи, конструировать"],[7]),
//        (["Ч-8.Сооружать что-либо. Возводить объекты; собирать, монтировать крупные блоки "],[5]),
//        (["Ч-9.Постоянно работать над собой. Непрерывное образование и самообразование; тренировки, репетиции "],[5]),
//        (["Ч-10.Беседовать с людьми (клиентами, пациентами, посетителями). Консультировать, помогать решать трудные вопросы "],[5]),
//        (["Ч-11.Играть на сцене, в кино, выступать в концертном зале, по радио, на телевидении. Быть профессиональным артистом "],[5]),
//        (["Ч-12.Творить, создавать новое, изобретать. Отстаивать новые идеи, доказывать свою правоту невеждам"],[5]),
//        (["Ч-13.Художественно оформлять что-либо, создавать уют "],[5]),
//        (["Ч-14.Управлять транспортным средством "],[5]),
//        (["Ч-15.Преобразовывать вещества (с помощью температуры, в химико-биологических и кулинарных процессах"],[5]),
//        (["Ч-16.Обрабатывать объекты и материалы вручную (использовать простые ручные приспособления) "],[5]),
//        (["Ч-17.Обрабатывать что-либо с помощью механизмов. Управлять станком, технологической установкой, автоматической линией "],[5]),
//        (["Ч-18.Демонстрировать силу и ловкость. Танцы, акробатика, спортивные соревнования"],[5]),
//        (["Ч-19.Исследовать, изучать, экспериментировать"],[5]),
//        (["Ч-20.Быстро ориентироваться (соображать) в ситуациях стресса и риска"],[5]),
//        (["Ч-21.Воспитывать, обучать детей"],[5]),
//        (["Ч-22.Ухаживать за животными и растениями "],[5]),
//        (["Ч-23.Лечить, предупреждать болезни "],[5]),
//        (["Ч-24.Оценивать, контролировать, ставить диагноз я"],[5]),
//        (["Ч-25.Много двигаться, разъезжать. Командировки, рейсы, путешествия, экспедиции, длительные обходы больших территорий "],[5]),
//        (["Ч-26.Обслуживать помещения и объекты. Следить за порядком "],[5]),
//        (["Ч-27.Выполнять высокоточную и ответственную работу. Хирургические операции, реставрация шедевров культуры, ювелирные работы, обработка дорогих деталей "],[1])
//    ]
    
    var nameWhatCardss: [String] = [
        "Ч-1.Работать с текстами. Много читать, писать, печатать, редактировать, корректировать",
        "Ч-2.Обслуживать посетителей. Торговать, давать справки, оказывать услуги",
        "Ч-3.Соста влять планы, программы. Обрабатывать информацию, вести расчеты",
        "Ч-4.Преподавать, выступать перед аудиториями. Обучать, воспитывать, читать лекции",
        "Ч-5.Руководить, организовывать взаимодействие. Командовать, контролировать, налаживать деловые «связи»",
        "Ч-6.Ремонтировать, настраивать, регулировать. Готовить технику и оборудование; ремонтировать помещения",
        "Ч-7.Делать чертежи, конструировать",
        "Ч-8.Сооружать что-либо. Возводить объекты; собирать, монтировать крупные блоки ",
        "Ч-9.Постоянно работать над собой. Непрерывное образование и самообразование; тренировки, репетиции ",
        "Ч-10.Беседовать с людьми (клиентами, пациентами, посетителями). Консультировать, помогать решать трудные вопросы ",
        "Ч-11.Играть на сцене, в кино, выступать в концертном зале, по радио, на телевидении. Быть профессиональным артистом ",
        "Ч-12.Творить, создавать новое, изобретать. Отстаивать новые идеи, доказывать свою правоту невеждам",
        "Ч-13.Художественно оформлять что-либо, создавать уют ",
        "Ч-14.Управлять транспортным средством ",
        "Ч-15.Преобразовывать вещества (с помощью температуры, в химико-биологических и кулинарных процессах",
        "Ч-16.Обрабатывать объекты и материалы вручную (использовать простые ручные приспособления) ",
        "Ч-17.Обрабатывать что-либо с помощью механизмов. Управлять станком, технологической установкой, автоматической линией ",
        "Ч-18.Демонстрировать силу и ловкость. Танцы, акробатика, спортивные соревнования",
        "Ч-19.Исследовать, изучать, экспериментировать",
        "Ч-20.Быстро ориентироваться (соображать) в ситуациях стресса и риска",
        "Ч-21.Воспитывать, обучать детей",
        "Ч-22.Ухаживать за животными и растениями ",
        "Ч-23.Лечить, предупреждать болезни ",
        "Ч-24.Оценивать, контролировать, ставить диагноз я",
        "Ч-25.Много двигаться, разъезжать. Командировки, рейсы, путешествия, экспедиции, длительные обходы больших территорий ",
        "Ч-26.Обслуживать помещения и объекты. Следить за порядком ",
        "Ч-27.Выполнять высокоточную и ответственную работу. Хирургические операции, реставрация шедевров культуры, ювелирные работы, обработка дорогих деталей "
    ]
    
    
    var i = 0
    var mMode: Mode = .view {
        didSet {
            switch mMode {
            case .view:
                selectBarButton.title = "Выбор"
                navigationItem.leftBarButtonItem = nil
                collectionView.allowsMultipleSelection = false
            case .select:
                selectBarButton.title = "Отмена"
                navigationItem.leftBarButtonItem = nextBarButton
                collectionView.allowsMultipleSelection = true
            }
        }
    }
    
    
//    func findNumberForWhat(a: [Int], b: [Int]) {
//        a.sorted()
//        b.sorted()
//        let bs = a.index(of: b[0])
//        if bs == nil {
//            print("Нет элемента")
//        }
//        else {
//            print(bs)
//            print("Элемент есть")
//        }
//    }
    
    func findNumberForWhats(a: [Int], b: Int) {
        a.sorted()
        let bs = a.index(of: b)
        if bs == nil {
            print("Нет элемента")
        }
        else {
            print("Элемент есть")
            print(b)
            print(nameWhatCardss[b-1])
        
        }
    }
    
//    func findNumberInArray() {
//        var a: [Int] = []
//        var b: [Int] = []
//
//        var z: Int = 0
//        //repeat {
//        for x in firstCollection {
//            for i in nameWhatCards {
//                a = x.whatPoint
//                b = i.point
//                print(a)
//                print(b)
//                break
//
//            }
//            //break
//             print(findNumberForWhat(a: a, b: b))
//
//        }
//
//
//        //print(findNumberForWhat(a: a, b: b))
//        z += 1
//        //break
//        // } while z != firstCollection.count
//    }
    
    
    func findNumberInArrays() {
        var a: [Int] = []
        var b: Int = 1
        
        //repeat {
        for x in firstCollection {
                a = x.whatPoint
                print(a)
                print(b)
                print(findNumberForWhats(a: a, b: b))
                b += 1
            }
            
            //break
             
            
        }
        
        
       
    
    
    
    lazy var selectBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Выбор", style: .plain, target: self, action: #selector(didSelectButtonClicked(_:)))
        return barButtonItem
        
    }()
    
    lazy var nextBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Дальше", style: .plain, target: self, action: #selector(nextSelectButtonClicked(_:)))
        return barButtonItem
    }()
    
    
    var dictionarySelectedIndexPath: [IndexPath: Bool] = [:]
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupBarButtonsItems()
        findNumberInArrays()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
      
        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    
    private func setupBarButtonsItems(){
        navigationItem.rightBarButtonItem = selectBarButton
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WWWCollectionViewCell
        //cell.nameCards.text = nameCards[indexPath.row]
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
     //Uncomment this method to specify if the specified item should be selected
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//
//        return true
//    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch mMode {
        case .view:
           // let item = nameCards[indexPath.item]
            performSegue(withIdentifier: "Cards", sender: self)
        case .select:
            dictionarySelectedIndexPath[indexPath] = true
        }
//        var cell = collectionView.cellForItem(at: indexPath)
//        if cell?.isSelected == true {
//            i += 1
//            cell?.backgroundColor = UIColor.green
//            if i == 3 {
//                self.performSegue(withIdentifier: "Cards", sender: self)
//            }
//        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
       if mMode == .select {
         dictionarySelectedIndexPath[indexPath] = false
       }
     }
    
    @objc func didSelectButtonClicked(_ sender: UIBarButtonItem) {
        mMode = mMode == .view ? .select : .view
    }
    
    @objc func nextSelectButtonClicked(_ sender: UIBarButtonItem) {
        
    }

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
