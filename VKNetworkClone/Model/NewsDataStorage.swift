//
//  NewsDataStorage.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 25.04.2021.
//

import UIKit

class NewsDataStorage: NSObject {
    
    static let shared = NewsDataStorage()
    
    private override init() {
        super.init()
    }
    
    var newsArray = [News]()
    
    
    func firstLoadNews() {
        NewsDataStorage.shared.newsArray = [
            News(userName: "Ivanov Ivan", newsText: "В России проведут полный анализ школьных учебников, сообщил министр просвещения Сергей Кравцов. Такое заявление он сделал после того, как российский президент Владимир Путин рассказал, с каким удивлением он порой смотрит на то, что написано в учебниках.", newsPhoto: UIImage(named: "news1")!),
            News(userName: "Kalashnikov Vasily", newsText: "Проект #СтраницыПобеды, посвящённый окончанию Великой Отечественной войны, получил четыре номинации на престижную премию Webby Awards. RT Creative Lab посостязается с такими крупными игроками веба, как Facebook, Google, National Geographic, LinkedIn и другие. Проголосуйте за нас — ваше участие поможет проекту, в создании которого принимали участие школьники и студенты из России, выиграть международный приз зрительских симпатий.", newsPhoto: UIImage(named: "news2")!),
            News(userName: "Sergachev Vladimir", newsText: "«Авангард» на своём льду одержал победу над ЦСКА в четвёртом матче финала Кубка Гагарина. Подопечные Боба Хартли уступали с разницей в две шайбы, но сумели воспользоваться обилием удалений в составе соперника и отличиться трижды подряд. Усилиями Мэта Робинсона москвичи восстановили паритет за секунду до сирены и перевели игру в овертайм, но в дополнительное время уступили. Победную шайбу в меньшинстве оформил Павел Дедунов.", newsPhoto: UIImage(named: "news3")!)
        ]
        
    }
    
}
