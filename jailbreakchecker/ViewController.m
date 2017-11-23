//
//  ViewController.m
//  jailbreakchecker
//
//  Created by Matteo D'Alessio on 23/11/17.
//  Copyright © 2017 Matteo D'Alessio. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)commonfile:(id)sender {
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"]){
        
            [self jb];
        } else {
            [self nojb];
        }
}
- (IBAction)sandboxviolation:(id)sender {
    NSError *error;
    [@"jb?" writeToFile:@"/private/jb.txt" atomically:YES encoding:NSUTF8StringEncoding error: &error];
    if (error == NULL) {
        [self jb];
    } else {
        [self nojb];
    }

}

- (void)jb{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@""
                                                                    message:@"jailbroken"
                                                             preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yes = [UIAlertAction actionWithTitle:@"goodbye"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * action) {
                                                }];
    [alert addAction:yes];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)nojb{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@""
                                                                    message:@"not jailbroken"
                                                             preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yes = [UIAlertAction actionWithTitle:@"goodbye"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * action) {
                                                }];
    [alert addAction:yes];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
