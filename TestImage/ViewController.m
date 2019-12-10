//
//  ViewController.m
//  TestImage
//
//  Created by fengbang on 2019/10/28.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *testLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
//    NSString *name = @"scanner.jpeg";
//    UIImage *image = [UIImage imageNamed:name];
//    NSString *imagePath =[[NSBundle mainBundle] pathForResource:@"scanner" ofType:@"jpeg"];
//    UIImage *fileImage = [UIImage imageWithContentsOfFile:name];
//
//    NSLog(@"path:%@",imagePath);
    
    
    //[self configUI];
    
    //[self loadHtmlTOLabel];
    
    //[self get];
}

- (void)get {
    //1.确定请求路径
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    //2.创建请求对象
    //请求对象内部默认已经包含了请求头和请求方法（GET）
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    //4.根据会话对象创建一个Task(发送请求）
    /**
     第一个参数：请求对象
     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）         data：响应体信息（期望的数据）
     response：响应头信息，主要是对服务器端的描述
     error：错误信息，如果请求失败，则error有值
    */
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //6.解析服务器返回的数据 //说明：（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"请求结果：%@",response);
    }];
    //5.执行任务
    [dataTask resume];

}

- (void)configUI {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height - 150.f)];
    label.font = [UIFont systemFontOfSize:15.f];
    label.textColor = [UIColor darkTextColor];
    label.layer.borderColor = [[UIColor redColor] CGColor];
    label.numberOfLines = 0;
    label.layer.borderWidth = .5f;
    [self.view addSubview:label];
    self.testLabel = label;
}

- (void)loadHtmlTOLabel {
    //返回的HTML文本
    NSString *str0 = @"Enter <a href=\"https://app-gearbest.com.trunk.s1.egomsl.com/my-coupon.html\" target=\"_blank\"><b>\"My Coupon\"</b></a> page to.3. Go to your “My Coupon” page to view your Coupon!<br>4. GearBest reserves the right to amend this activity. For any queries, please contact our Support Staff. (<a href=\"https://support.gearbest.com\" target=\"_blank\">https://support.gearbest.com</a>)";
    NSString *str1 = @"<p>< img src=\"http://img.tiku.qinxue100.com/d/file/image/20180913/1536827373145341.png\" alt=\"http://img.tiku.qinxue100.com/d/file/image/20180913/1536827373145341.png\"></p >";
    NSString *str3 = @"<img id=\"s_lg_img\" class=\"s_lg_img_gold_show\" src=\"//www.baidu.com/img/superlogo_c4d7df0a003d3db9b65e9ef0fe6da1ec.png?where=super\" width=\"270\" height=\"129\" usemap=\"#mp\" title=\"\" cursor=\"default\">";
    
    //NSString *str2 = @"<p style=\"line-height:150%\">\U628a\U56fe1\U4e2d\U7684\U6b63\U65b9\U4f53\U7684\U4e00\U89d2\U5207\U4e0b\U540e\U6446\U5728\U56fe2\U6240\U793a\U7684\U4f4d\U7f6e\Uff0c\U5219\U56fe2\U4e2d\U7684\U51e0\U4f55\U4f53\U7684\U4e3b\U89c6\U56fe\U4e3a\Uff08\U3000\U3000\Uff09</p ><p style=\"line-height:150%\">< img src=\"http://img.tiku.qinxue100.com/d/file/image/20180913/1536827309818056.png\" alt=\"http://img.tiku.qinxue100.com/d/file/image/20180913/1536827309818056.png\"></p >";
    
    NSMutableAttributedString * strAtt = [[NSMutableAttributedString alloc] initWithData:[[NSString stringWithFormat:@"%@",str3] dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.testLabel.attributedText = strAtt;
    return;
    
    
    
    NSString *htmlStr = str1;
    //富文本，两种都可以
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    NSData *data = [htmlStr dataUsingEncoding:NSUTF8StringEncoding];
    //或者
//    NSDictionary *option = @{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType};
//    NSData *data = [htmlStr dataUsingEncoding:NSUnicodeStringEncoding];
    
    //设置富文本
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
    //设置段落格式
    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
    para.lineSpacing = 7;
    para.paragraphSpacing = 10;
    [attStr addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, attStr.length)];
    self.testLabel.attributedText = attStr;
    
//    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, attStr.length)];
//    //计算加载完成之后Label的frame
//    CGSize size = [self.testLabel sizeThatFits:CGSizeMake(300, 1000)];
//    //也可以使用这个方法，对应好富文本字典
////    CGSize size = [self.testLabel.attributedText boundingRectWithSize:CGSizeMake(300, 1000) options:@{} context:nil];
//    self.testLabel.frame = CGRectMake(10, 100, size.width, size.height);
}


@end
