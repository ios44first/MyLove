//
//  MusicManager.h
//  MyLove
//
//  Created by mac on 14/10/23.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface MusicManager : NSObject<AVAudioPlayerDelegate>

@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,strong) NSArray *musicNames;

+ (MusicManager *)getPlayer;

+ (void)play;

+ (void)pause;

+ (void)nextPlay;

@end
