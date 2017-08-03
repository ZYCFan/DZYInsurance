//
//  LoginController.m
//  DZYInsurance
//
//  Created by Dao on 2017/8/2.
//  Copyright © 2017年 zhouyongchao. All rights reserved.
//

#import "YxLoginController.h"
#import "AFNetWorkTools.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#include <net/if.h>

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenheight [[UIScreen mainScreen] bounds].size.height

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@interface YxLoginController ()<UITextFieldDelegate>


@end

@implementation YxLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:44/255.0 green:70/255.0 blue:105/255.0 alpha:1];
    
    self.view.backgroundColor=[UIColor whiteColor];
    // ------------------登录框------------------
    
    
    UIImageView *logg = [[UIImageView alloc] init];
    logg.image = [UIImage imageNamed:@"logo.png"];
    logg.frame = CGRectMake(kScreenWidth/2-40,80,80, 40);
    [self.view addSubview:logg];
    
    
    UIImageView *imageView1 = [[UIImageView alloc] init];
    imageView1.image = [UIImage imageNamed:@"signin_password.png"];
    imageView1.frame = CGRectMake(80,180,30, 30);
    [self.view addSubview:imageView1];
    
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(115, 180, kScreenWidth-185, 30)];
    text.font = [UIFont systemFontOfSize:20];
    text.tag = 8;
    text.backgroundColor = [UIColor clearColor];
    text.returnKeyType = UIReturnKeyGo;
    text.placeholder=@"输入手机号";
    text.delegate=self;
    [self.view addSubview:text];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,text.height - 1,text.width, 1)];
    lineView.backgroundColor = [UIColor blackColor];
    [text addSubview:lineView];
    
    UIImageView *imageVpwd = [[UIImageView alloc] init];
    imageVpwd.image = [UIImage imageNamed:@"signin_phone.png"];
    imageVpwd.frame = CGRectMake(80,230,30,30);
    [self.view addSubview:imageVpwd];
    
    UITextField *pwd = [[UITextField alloc] initWithFrame:CGRectMake(115, 230, kScreenWidth-185, 30)];
    pwd.secureTextEntry = YES;
    pwd.tag = 88;
    pwd.font = [UIFont systemFontOfSize:20];
    pwd.backgroundColor = [UIColor clearColor];
    pwd.returnKeyType = UIReturnKeyDone;
    pwd.placeholder=@"输入密码";
    pwd.delegate = self;
    [self.view addSubview:pwd];
    UIView *lineViews = [[UIView alloc]initWithFrame:CGRectMake(0,pwd.height - 1,pwd.width, 1)];
    lineViews.backgroundColor = [UIColor blackColor];
    [pwd addSubview:lineViews];
    
    UILabel *msg = [[UILabel alloc] initWithFrame:CGRectMake(0,260,kScreenWidth, 30)];
    [msg setText:@""];
    msg.tag = 2301;
    msg.font = [UIFont systemFontOfSize:16];
    msg.textColor = [UIColor redColor];
    msg.textAlignment = NSTextAlignmentCenter;
    msg.hidden=YES;
    [self.view addSubview:msg];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(115-35, 290, kScreenWidth-185+35, 45)];
    btn.backgroundColor = [UIColor colorWithRed:44/255.0 green:70/255.0 blue:105/255.0 alpha:1];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loadweb:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font=[UIFont systemFontOfSize:20];
    btn.layer.cornerRadius = 6.0;
    [self.view addSubview:btn];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerAction:)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)registerAction:(UIButton *)sender {
    
}


//点击登录事件
-(void)loadweb:(id)sender{
    UITextField *login = (UITextField *)[self.view viewWithTag:8];
    NSString *uname = login.text;
    NSLog(@"登录手机号：%@",uname);
    BOOL t = [self isStringUtil:uname];
    if(t){
        UILabel *msg= (UILabel *)[self.view viewWithTag:2301];
        [msg setText:@"请输入登录账号"];
        msg.hidden = NO;
        NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(NSTimer) userInfo:nil repeats:NO];
        return;
    }
    UITextField *pwd = (UITextField *)[self.view viewWithTag:88];
    NSString *upwd = pwd.text;
    NSLog(@"登录密码：%@",upwd);
    
    BOOL ts = [self isStringUtil:upwd];
    if(ts){
        UILabel *msg= (UILabel *)[self.view viewWithTag:2301];
        [msg setText:@"请输入登录密码"];
        msg.hidden = NO;
        NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(NSTimer) userInfo:nil repeats:NO];
        return;
    }
    //组织参数
    NSString *detail = @"";
    NSString *username = @"&username=";
    username = [username stringByAppendingString:uname];
    detail = [detail stringByAppendingString:username];
    
    NSString *password = @"&password=";
    password = [password stringByAppendingString:upwd];
    detail = [detail stringByAppendingString:password];
    
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString *uuids = @"&channelid=";
    uuids = [uuids stringByAppendingString:uuid];
    detail = [detail stringByAppendingString:uuids];
    
    NSString *ip = [self getIP];
    NSString *ips = @"&loginIp=";
    ips = [ips stringByAppendingString:ip];
    detail = [detail stringByAppendingString:ips];
    
    NSString *urls = @"http://59.110.11.163:8080/safetyApp/a/sys/register/login_login.do?equipment=IOS&logintype=phone";
    
    urls = [urls stringByAppendingString:detail];
    
    //处理中文；
    urls = [urls stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [AFNetWorkTools getJSONWithUrl:urls parameters:nil success:^(id responseObject) {
        NSDictionary *dic =responseObject;
        NSLog(@"%@",dic);
        BOOL isYes = [NSJSONSerialization isValidJSONObject:dic];
        if(isYes){
            NSString *success = dic[@"success"];
            BOOL *run= YES;
            
            if([success isEqualToString:@"false"]){
                run = NO;
            }
            
            if(run){
                NSLog(@"%@",[dic[@"msg"]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
            }else{
                
                UILabel *msg= (UILabel *)[self.view viewWithTag:2301];
                [msg setText:[dic[@"msg"]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                msg.hidden = NO;
                NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(NSTimer) userInfo:nil repeats:NO];
                return;
            }
        }
    } fail:^{
        UILabel *msg= (UILabel *)[self.view viewWithTag:2301];
        [msg setText:@"请检查网络链接或联系客服!"];
        msg.hidden = NO;
        NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(NSTimer) userInfo:nil repeats:NO];
        return;
    }];
}

//获取ip地址
- (NSString *)getIP
{
    NSDictionary *addresses = [self getIPAddresses];
    __block NSString *address;
    address = addresses[@"en1/ipv4"];
    return address ? address : @"0.0.0.0";
}
//获取IP详情
- (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP)) {
                continue;
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

//判断非空
-(BOOL)isStringUtil:(NSString *)string{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

-(void)NSTimer{
    UILabel *msg= (UILabel *)[self.view viewWithTag:2301];
    msg.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
