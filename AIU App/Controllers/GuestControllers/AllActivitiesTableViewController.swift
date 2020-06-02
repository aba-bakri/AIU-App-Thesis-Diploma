//
//  AllActivitiesTableViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 6/2/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class AllActivitiesTableViewController: UITableViewController {

    let allActivitiesTitle = ["Dance Club", "Music Club", "Sport Club"]
    let allActivitiesImage = [UIImage(named: "dance"), UIImage(named: "music"), UIImage(named: "sport")]
    let allActivitiesDesc = ["If you want to learn the culture of a nation, look at their dances and music. Being kind of a language of communication, it expresses the values of national culture.In our national university, the students except of study also develop actively their creative life. The group of folk dances “Ala-Too” started in 2014 consists of 8-10 people (girls), which is updated periodically. Dances of different nations are in the repertoire of this group: Kyrgyz, Kazakh, Uzbek, Turkish, Uighur. The group performs their work during university events.", "Komuz club\nKomuz is a national musical instrument that is inherent part of the Kyrgyz culture. Due to its rich range of performance, it is widely popular. Some of our students also have a talent to play komuz. Therefore, Komuz club was opened to develop abilities of possessing this instrument and to perform in front of audience. Admission during  September.\nPiano club\nStudents attend the piano club for rehearsal, and further to perform in university concerts. Mostly, they already have knowledge to play the piano. If you have a good ability playing this type of instrument, you can gather a group and teach them.", "At the Ala-Too International University students do not forget to develop themselves in sport. There are sections of different kind of sport from classical football and basketball to Kyrgyz national sport like “ordo” and “toguz krgool”. In addition, the health of athletes is also important; preliminary medical survey is being held annually. Athletes are provided with the conditions for achieving the best results: qualified trainers, sports hall, shower cabins, sports equipment, football, basketball and tennis courts."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "ActivitiesViewController") as? ActivitiesViewController
        if indexPath.row == 0 {
            vc?.activitiesTitle = allActivitiesTitle[0]
            vc?.activitiesDescc = allActivitiesDesc[0]
            vc?.activitiesImagess = allActivitiesImage[0]
        } else if indexPath.row == 2 {
            vc?.activitiesTitle = allActivitiesTitle[1]
            vc?.activitiesDescc = allActivitiesDesc[1]
            vc?.activitiesImagess = allActivitiesImage[1]
        } else {
            vc?.activitiesTitle = allActivitiesTitle[2]
            vc?.activitiesDescc = allActivitiesDesc[2]
            vc?.activitiesImagess = allActivitiesImage[2]
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
