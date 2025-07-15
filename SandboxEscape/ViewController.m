//
//  ViewController.m
//  GetRoot
//
//  Created by IosBX on 2025/4/26.
//

#import "ViewController.h"
#import "grant_full_disk_access.h"
#import "kernel_find.h"
#import <CoreFoundation/CoreFoundation.h>
#import <dlfcn.h>

CFPropertyListRef MGCopyAnswer(CFStringRef property);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    grant_full_disk_access(^(NSError *error){
        if (error) {
            // 处理错误
            NSLog(@"获取权限失败：%@", error.localizedDescription);
        } else {
            // 成功获取权限后的操作
            NSLog(@"成功获取完整磁盘访问权限");

            // 添加写入文件代码
            NSString *filePath = @"/var/mobile/Documents/iosbx.txt";
            NSString *content = @"Hello, World.";
            NSError *writeError = nil;
            BOOL success = [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&writeError];
            if (success) {
                NSLog(@"文件写入成功: %@", filePath);
            } else {
                NSLog(@"文件写入失败: %@", writeError.localizedDescription);
            }

            // 延迟2秒后执行
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 获取/var/mobile/Documents目录路径
                NSString *documentsPath = @"/var/mobile/Documents";
                
                // 获取目录中的所有文件和文件夹
                NSFileManager *fileManager = [NSFileManager defaultManager];
                NSError *error = nil;
                NSArray *contents = [fileManager contentsOfDirectoryAtPath:documentsPath error:&error];
                
                // 遍历所有文件和文件夹
                for (NSString *item in contents) {
                    NSString *fullPath = [documentsPath stringByAppendingPathComponent:item];
                    BOOL isDirectory = NO;
                    [fileManager fileExistsAtPath:fullPath isDirectory:&isDirectory];
                    
                    NSLog(@"%@: %@", isDirectory ? @"文件夹" : @"文件", item);
                }
            });
        }
    });
    
}


@end
