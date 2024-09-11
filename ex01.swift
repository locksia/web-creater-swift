//
//  main.swift
//  Swift_day01
//
//  Created by BEOMJOON KIM on 2023/09/06.

import Foundation

// 전화 번호 저장 공간
var phoneBook:[[String:Any]] = [
    ["name":"KIM", "phone":"010-1111-1111"]
]
var no:Int = 0

func menu() {
    print("[1]입력 [2]출력 [3]검색 [4]변경 [5]삭제 [6]종료")
    print("CHOICE: ", terminator: "")
    let choiceNo:Int = Int(readLine()!)!
    no = choiceNo
}

func input() {
    print("-------- INPUT --------")
    print("성명: ", terminator: "")
    let name = readLine()!
    print("전화: ", terminator: "")
    let phone = readLine()!
    phoneBook.append(["name":String(name), "phone":String(phone)])
    no = 0;
}

func output() {
    print("-------- OUTPUT --------")
    print("NAME \t PHONE");
    print("------------------------")
    for people in phoneBook {
        print("\(people["name"]!) \t \(people["phone"]!)");
    }
    // 다시 메뉴가 자동 실행 되도록 no값 초기화
    no = 0
}

func search() {
    print("-------- SEARCH --------")
    print("검색할 이름 입력: ", terminator: "")
    guard let name = readLine() else { return }
    
    var found = false
    
    for person in phoneBook {
        if String(describing: person["name"] ?? "") == name {
            print("검색된 정보: \(person["name"]!) \t \(person["phone"]!)")
            found = true
            break
        }
    }
    
    if !found {
        print("검색한 이름은 없는 이름입니다.")
    }
}


func modify() {
	// 메뉴로 가도록 no 초기화
    no = 0;
    print("-------- MODIFY --------")
	print("수정할 사람의 이름: ", terminator: "")
	let name = readLine()!
	var searched = false;
	for (i, person) in phoneBook.enumerated() {
        // 검색 후 삭제
        // Any Type은 사용 할때 형변환 필요
        if String(describing: person["name"] ?? "") == name {
			print("이름 입력: ", terminator: "")
			let modifyName = readLine()!
			print("전화번호 입력: ", terminator: "")
			let modifyPhone = readLine()!
			
            phoneBook.remove(at: i)
            phoneBook.append(["name": modifyName, "phone": modifyPhone])
			print("수정 완료")
			searched = true
            return
        }
    }
	
	if searched == false {
		print("일치하는 검색 결과가 없습니다.")
	}
}

func delete() {
    print("-------- DELETE --------")
    no = 0
    print("삭제 할 이름 입력: ", terminator: "")
    guard let name = readLine() else { return }
    
    for (i, person) in phoneBook.enumerated() {
        print(i)
        // 검색 후 삭제
        // Any Type은 사용 할때 형변환 필요
        if String(describing: person["name"] ?? "") == name {
            phoneBook.remove(at: i)
            print("삭제 완료!")
            return
        }
    }
    print("같은 이름의 정보가 없습니다!")
}


let _factory = [menu, input, output, search, modify, delete]

func main() {
    print("::::: 전화 번호부 :::::")
    
    while true {
        _factory[no]()
        if no == 6 {
            break
        }
    }
    print("--- 프로세스 종료 ---")
}

main()