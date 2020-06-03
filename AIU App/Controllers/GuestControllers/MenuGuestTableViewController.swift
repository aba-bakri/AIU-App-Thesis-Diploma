//
//  MenuGuestTableViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/13/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class MenuGuestTableViewController: UITableViewController {

    let allInfoTitle = ["Campus", "Admissions", "History of Ala-Too"]
    let allInfoImage = [UIImage(named: "campus"), UIImage(named: "admision"), UIImage(named: "history")]
    let allInfoDesc = ["The campus area constitutes 54,000 m2 covered and 16,000 m2 of open space.\n\nFive blocks are located on the campus, equipped with smart boards, internet infrastructure, and modern laboratories.\n\nIn our peaceful campus you can benefit from the use of the library that is a home for 30 thousand books in different languages used in our various study programs.\n\nEvery day, on weekdays at noon, both delicious and affordable meals are available for 250 people in the big dining hall.\nTwo canteens, with decent environments, serve our students in the winter and summer.\n\nAn indoor sports hall and football-basketball-volleyball-tennis fields also add to the diversity of our campus.", "1) What you need to dial a passing score for admission?\n\nEach year, the Kyrgyz Republic Ministry of Education sets the threshold scores for admission of applicants to higher education institutions. During the 2019-2020 academic year the threshold score on the main test is 110 points. For the next academic year 2020-2021, the threshold score on the main test is not already installed.\n\n2) What are the benefits for admission to your university?\n\nOn the basis of GRT at our university are from 5% to 100% discount on tuition. Winner of national and regional competitions provided 20 to 100% discount on tuition. Applicants, who took first place in the individual competitions at the national and international sporting Olympics, get a 30% discount. Graduates who receive <<red certificate>> of secondary education is provided admission 20% discount.\n\n3) Are there any other additional internal tests in high school?\n\nAfter receiving the documents, the university conducts internal English test to determine the level of knowledge on the subject. Students who successfully pass the test, go to the 1st course. Not gaining threshold students sit on the preparatory course. Persons who present an official TOEFL (IBT 60) and IELTS (6,0) certificates are credited to the first year without trial test. Other additional admission tests of the university do not hold.\n\n4) Do you provide to nonresident students a hostel?\n\nPartners Ala-Too International University provide for nonresident and foreign students dormitory, which is conveniently located in the city.\n\n5) When you start receiving documents?\n\nAccording to the Resolution of the Government of the Kyrgyz Republic of the selection and enrollment of students in higher education institutions starting with the month of July of each year.\n\n6) Whether it is possible to use results of GRT of last years?\n\nNo, it is impossible.\n\n7) What faculties are available in AIU? \n\nFaculty of Engineering and Informatics - Faculty of Social Sciences - Faculty of Economics and Administrative Sciences - Faculty of Medicine - Vocational education - Distance Learning Center - Institute of Languages\n\n8) What objects are studied in a preparatory course?\n\nIn a preparatory course students learn two foreign languages: English and Turkish. In a week 8 hours for Turkish and for studying of English are given 24 hours.\n\n9) How it is possible to pay the contract for training?\n\nThe tuition fee can be brought in parts: on 50% at the beginning of each semester.\n\n10) What documents are necessary for receipt? \n\nAt filing of application about enrollment of students arriving provides: - a photocopy of the documents proving his identity, nationality; - the original document of the state sample about education (certificate/diploma); - 6 photos 3х4 - certificate of GRT (original and copy) - the copy of the assigned certificate (for young men): -The first installment of tuition is 30 % of the total value of the contract; - Medical certificate 086(original); - The copy of the Medical certificate 063\n\n11) Is it possible to transfer to our university from others?\n\nYes, sure. It requires the appropriate level of English to be transferred to our university from other universities. \n\n12) Is it possible to get distance education at our university?\n\nDistance Learning Center (DLC) at the university administrates educational services on preparation of bachelor there are two directions: management and international relations. DLC is preparing masters in the following areas: management and pedagogy.\n\n13) Is there an academic exchange program for students?\n\nYes, there is. Implementation of academic exchange programs carries out annually. Our university cooperates with more than 20 partner countries, which include more than 70 universities. Student exchange in the framework of partnership - it is an opportunity to pass semester or one-year non-degree training in one of the partner universities.\n\n14) Does our university participate in the ERASMUS program?\n\nYes, our University is involved in the pan-European program for cooperation in educational area. Within the “ERASMUS+” program there is an exchange of students and teachers between institutions of higher education in Europe, where our university is a competent partner. Our students have a great opportunity to be trained under this program, all the costs of which assumes the European Union and the host country.", "Ala-too International University was established in 1996.\n\nThe University provides students with a modern education and grants graduates with internationally recognized diplomas.\n\nCurrently the university achieved a number of successes in teaching and research activities and became popular for its achievements throughout the country and in other countries.\n\nThrough the use of new teaching technologies and incessant labor of highly qualified academic staff it trains specialists from other countries as well.\n\nVision\n\nIn the light of the given knowledge to grow the persons seeking to extend global and human values, and the world from the home to worldwide.\n\n Mission\n\nThe mission of the university is to prepare well-rounded professionals who respect historical values, have high critical thinking abilities, and are able to adapt to the changing environment through their knowledge and competencies."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "AlaTooInformationViewController") as? AlaTooInformationViewController
        if indexPath.row == 7 {
            vc?.alatooInfoTitle = allInfoTitle[0]
            vc?.alatooInfoImagess = allInfoImage[0]
            vc?.alatooInfoDecss = allInfoDesc[0]
            self.navigationController?.pushViewController(vc!, animated: true)
        } else if indexPath.row == 9 {
            vc?.alatooInfoTitle = allInfoTitle[1]
            vc?.alatooInfoImagess = allInfoImage[1]
            vc?.alatooInfoDecss = allInfoDesc[1]
            self.navigationController?.pushViewController(vc!, animated: true)
        } else if indexPath.row == 10 {
            vc?.alatooInfoTitle = allInfoTitle[2]
            vc?.alatooInfoImagess = allInfoImage[2]
            vc?.alatooInfoDecss = allInfoDesc[2]
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
