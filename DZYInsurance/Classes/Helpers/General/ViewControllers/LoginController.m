//
//  LoginController.m
//  GTP2P
//
//  Created by 周永超 on 16/5/4.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "LoginController.h"

#import "LoginCell.h"
#import "LoginFootView.h"

#import "PMLoginService.h"

static NSString *const LoginCellIdentify = @"LoginCell";
@interface LoginController ()<UITableViewDataSource,UITableViewDelegate,LoginFootViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) UITableView *loginTableView;
@property (nonatomic, strong) LoginFootView *footView;
@property (nonatomic, strong) id<LoginDelegate> presentViewController;

@property (nonatomic, copy) NSArray *placeHolderArr;
@property (nonatomic, copy) NSArray *leftImageArr;

@property (nonatomic, strong) PMLoginService *loginService;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;

@end

@implementation LoginController

- (instancetype)initWithViewController:(id<LoginDelegate>)viewController {
    self = [super init];
    if (self) {
        if (viewController) {
            self.delegate = viewController;
        }
        _presentViewController = viewController;
    }
    return self;
}

- (instancetype )init {
    return [self initWithViewController:nil];
}

- (void)dealloc {
    TT_RELEASE_SAFELY(_loginTableView);
    TT_RELEASE_SAFELY(_footView);
    TT_RELEASE_SAFELY(_presentViewController);
}

#pragma mark - life cycle 
- (void)loadView {
    [super loadView];
    [self.view addSubview:self.loginTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    [self customNavBar];
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.loginTableView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LoginCell *cell = [tableView dequeueReusableCellWithIdentifier:LoginCellIdentify forIndexPath:indexPath];
    cell.leftImageView.image = [UIImage imageNamed:self.leftImageArr[indexPath.row]];
    cell.rightTextField.placeholder = self.placeHolderArr[indexPath.row];
    cell.rightTextField.delegate = self;
    
    cell.rightTextField.tag = indexPath.row;
    [cell.rightTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    
    if (indexPath.row == 0) {
        self.userName = [UserCenter sharedInstance].takeUserAccount;
        cell.rightTextField.text = [UserCenter sharedInstance].takeUserAccount;
    } else {
        cell.rightTextField.secureTextEntry = YES;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 25.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25.f;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - custom Delegate
- (void)loginButtonClicked:(UIButton *)sender {
    [self.view endEditing:YES];
    [self.view showIndeterminateHUDWithTitle:@"正在登录"];
    
    self.loginService = [[PMLoginService alloc]init];
    [self.loginService loginWithAccount:self.userName password:self.password success:^(LoginDTO *data) {
        [self.view hideMBProgressHud];
        if ([self.delegate respondsToSelector:@selector(loginSuccess)]) {
            [self.delegate loginSuccess];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(NSString *errorStr) {
        if ([self.delegate respondsToSelector:@selector(loginFailure)]) {
            [self.delegate loginFailure];
        }
        [self showTextMessage:errorStr afterDelay:1];
    }];
}

- (void)registerButtonClicked:(UIButton *)sender {
    [self.view endEditing:YES];
//    RegisterController *registerVC = [[RegisterController alloc]init];
//    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)forgetButtonClicked:(UIButton *)sender {
    [self.view endEditing:YES];
//    GTForgetPasswordController *forgetVC = [[GTForgetPasswordController alloc]init];
//    [self.navigationController pushViewController:forgetVC animated:YES];
}

#pragma mark - private Methods
- (void)customNavBar {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeAction:)];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)closeAction:(UIBarButtonItem *)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)textFieldChanged:(UITextField *)textField {
    switch (textField.tag) {
        case 0:
            self.userName = textField.text ?:@"";
            break;
        case 1:
            self.password = textField.text ?:@"";
            break;
            
        default:
            break;
    }
}

#pragma mark - public Methods
- (void)show {
    UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:self];
    [((UIViewController *)self.presentViewController) presentViewController:loginNav animated:YES completion:nil];
}

- (void)hide {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - setter
#pragma mark - getter
- (UITableView *)loginTableView {
    if (!_loginTableView) {
        UITableViewController *tabVC = [[UITableViewController alloc]initWithStyle:UITableViewStyleGrouped];
        _loginTableView = tabVC.tableView;
        _loginTableView.delegate = self;
        _loginTableView.dataSource = self;
        _loginTableView.backgroundColor = TableViewColor;
        _loginTableView.rowHeight = 44;
        [_loginTableView registerNib:[UINib nibWithNibName:LoginCellIdentify bundle:nil] forCellReuseIdentifier:LoginCellIdentify];
        _loginTableView.tableFooterView = self.footView;
        [self addChildViewController:tabVC];
    }
    return _loginTableView;
}

- (LoginFootView *)footView {
    if (!_footView) {
        _footView = [[LoginFootView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90)];
        _footView.delegate = self;
    }
    return _footView;
}

- (NSArray *)placeHolderArr {
    if (!_placeHolderArr) {
        _placeHolderArr = @[@"用户名",@"密码"];
    }
    return _placeHolderArr;
}

- (NSArray *)leftImageArr {
    if (!_leftImageArr) {
        _leftImageArr = @[@"username",@"password"];
    }
    return _leftImageArr;
}

- (PMLoginService *)loginService {
    if (!_loginService) {
        _loginService = [[PMLoginService alloc]init];
    }
    return _loginService;
}

@end
