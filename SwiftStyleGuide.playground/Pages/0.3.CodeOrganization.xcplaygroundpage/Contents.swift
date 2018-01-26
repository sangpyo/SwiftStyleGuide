//: [Previous](@previous)
/*:
 ## 3.    코드 구성 Code Organization
 
 기능적 논리 블럭으로 코드를 구성하기 위해 'extension'을 사용 한다.
 각 'extension'은 `// MARK: -` 주석으로 구분 하여야 한다.
 
  - - -
 
 ### 3.1    프로토콜 적합성
 
 모델에 프로토콜 적합성을 추가 할때 프로토콜 메소드에 대해 별도의 'extension'을 추가 한다.
 이는 관련 메소드를 프로토콜 별로 그룹화하여 관련성을 유지할 수 있고,
 클래스에 프로토콜과 관련된 메소드를 추가하여 인스트럭션을 단순화 할 수 있다.
 
 좋은 예:
 */
import UIKit

class MyGoodStyleViewController: UIViewController {
    // class stuff
}

// MARK: - UITableViewDataSource
extension MyGoodStyleViewController: UITableViewDataSource {
    // table view data source methods
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    }
}

// MARK: - UIScrollViewDelegate
extension MyGoodStyleViewController: UIScrollViewDelegate {
    // scroll view delegate methods
}
//: 나쁜 예:
class MyBadStyleViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
    // class stuff & all protocol methods
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    }
}
/*:
 컴파일러에서 파생 클래스에서 프로토콜 준수를 다시 선언할 수 없으므로 기본 클래스의 extension 그룹을 복제 할 필요가 없다.
 파생 클래스가 터미널 클래스이고 소수의 메소드를 재정의하는 경우 특히 그렇다.
 
 UIKit Veiw Controller 의 경우, 라이프사이클, 사용자 accessor, IBAction을 그룹화 하는 것이 좋다.

 - - -
 
 ### 3.2    비 사용 코드
 
 Xcode 템플릿 코드, placeholder 코멘트를 포함하여 비 사용 코드는 삭제 한다.

 - - -
 
 ### 3.3    코드 레이아웃
 */
//: [Next](@next)
