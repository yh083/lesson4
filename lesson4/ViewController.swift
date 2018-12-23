//
//  ViewController.swift
//  lesson4
//
//  Created by student on 2018/12/23.
//  Copyright © 2018年 yh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myPageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
       initializeUserInterface()
        
    }
    func initializeUserInterface() -> () {
        let bigScrollView = UIScrollView(frame: view.bounds)
        view.addSubview(bigScrollView)
        
        //顶部 小的scrollview
        let width = view.bounds.width  //得到主视图的宽度
        
        let topScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: width, height: 200))
        //设置容量
        topScrollView.contentSize = CGSize(width: 3 * width, height: 200)
        //允许换页
        topScrollView.isPagingEnabled = true

        //设置代理
        topScrollView.delegate = self
        
        bigScrollView.addSubview(topScrollView) //添加到视图中
        
        //三张图片轮播 创建
        for i in 0..<3 {
//            let imageView = UIImageView(frame: topScrollView.bounds)
//            imageView.center
            let x = Double(width) * Double(i)
            
            //创建得到每张图片名称
            let name = String(format: "首页%d", i + 1)
            let imageView = UIImageView(frame: CGRect(x: x, y: 0, width: Double(width), height: 200))
            imageView.image = UIImage(named: name)
            topScrollView.addSubview(imageView)
        }
        //pageControl
        let  pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        pageControl.center = CGPoint(x: Double(width) / 2, y: 150)
        pageControl.numberOfPages = 3
        //设置主题色
        pageControl.tintColor = UIColor.red
        pageControl.currentPageIndicatorTintColor = UIColor.cyan
        view .addSubview(pageControl)
        myPageControl = pageControl
        //图文混编
        //1
        let str1 = "成都，简称“蓉”，四川省省会，副省级市，国家区域中心城市（西南），1993年被国务院确定为西南地区的科技、商贸、金融中心和交通及通信枢纽，综合实力西部第一。"
        let imageview1 = UIImageView(frame: CGRect(x: 0, y: Double(topScrollView.frame.maxY) + 20, width: Double(width), height: 200))
        imageview1.image = UIImage(named: "首页1")
        imageview1.contentMode = .scaleAspectFill
        bigScrollView.addSubview(imageview1)
        
        let label1 = UILabel(frame: CGRect(x: 0, y: Double(imageview1.frame.maxY) + 10, width: Double(width), height: 100))
        label1.text = str1
        label1.font = UIFont .systemFont(ofSize: 12)
        label1.numberOfLines = 0
        bigScrollView .addSubview(label1)
        //2
        let str2 = "成都位于中国华西地区东部，西南地区最大平原——成都平原腹地，境内地势平坦、河网纵横、物产丰富、水系发达，自古就有“天府之国”的美誉，是国家首批历史文化名城和中国最佳旅游城市。"
        let imageview2 = UIImageView(frame: CGRect(x: 0, y: Double(label1.frame.maxY) + 20, width: Double(width), height: 200))
        imageview2.image = UIImage(named: "首页2")
        imageview2.contentMode = .scaleAspectFill
        bigScrollView.addSubview(imageview2)
        
        let label2 = UILabel(frame: CGRect(x: 0, y: Double(imageview2.frame.maxY) + 10, width: Double(width), height: 100))
        label2.text = str2
        label2.font = UIFont .systemFont(ofSize: 12)
        label2.numberOfLines = 0
        bigScrollView .addSubview(label2)
        //3
        let str3 = "成都有着4500余年的文明史，2600年左右的建城史。三国蜀汉、五代前后蜀及北宋李顺、明末张献忠大西等割据政权先后在此建都，唐朝和中华民国时曾作为临时首都而存在。早在北宋年间成都人联合发行了世界最早的纸币“交子”，官府在成都设立了世界最早的管理储蓄银行“交子务”。"
        let imageview3 = UIImageView(frame: CGRect(x: 0, y: Double(label2.frame.maxY) + 20, width: Double(width), height: 200))
        imageview3.image = UIImage(named: "首页3")
        imageview3.contentMode = .scaleAspectFill
        bigScrollView.addSubview(imageview3)
        
        let label3 = UILabel(frame: CGRect(x: 0, y: Double(imageview3.frame.maxY) + 10, width: Double(width), height: 100))
        label3.text = str3
        label3.font = UIFont .systemFont(ofSize: 12)
        label3.numberOfLines = 0
        bigScrollView .addSubview(label3)
        
        //设置bigscrollview的内容容量
        bigScrollView.contentSize = CGSize(width: Double(width), height: Double(label3.frame.maxY))
    }

}
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = round(scrollView.contentOffset.x / scrollView.bounds.width)
        myPageControl.currentPage = Int(x)
    }
}

